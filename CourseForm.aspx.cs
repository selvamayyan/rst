using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class CourseForm : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());

    int courseId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {


        try
        {

            con.Open();

            if(!IsPostBack)
            {


                LoadControls();
                DataTable tbl = createTable();
                Session.Add("SelecIns", tbl);


                if(Request.QueryString["mode"].ToString()=="Edit")
                {

                  courseId = System.Convert.ToInt16(Request.QueryString["Coursepk"].ToString());
                  Session.Add("Crsid",courseId);

                  SqlCommand cmd = new SqlCommand("Select * from Del_Course where CoursePk='" + courseId +"'" , con);
                  SqlDataAdapter adp = new SqlDataAdapter(cmd);
                  DataSet ds = new DataSet();

                  adp.Fill(ds);

                  txtName.Text = ds.Tables[0].Rows[0]["CourseName"].ToString();
                  TxtCode.Text = ds.Tables[0].Rows[0]["CourseCode"].ToString();
                  TxtDuration.Text = ds.Tables[0].Rows[0]["CourseDuration"].ToString();
                  TxtMinSize.Text = ds.Tables[0].Rows[0]["MinClassSize"].ToString();
                  TxtMaxsize.Text = ds.Tables[0].Rows[0]["MaxClassSize"].ToString();

                //  DrpStatus.ClearSelection();
                  DrpStatus.Items.FindByValue(ds.Tables[0].Rows[0]["CourseStatus"].ToString()).Selected=true; 



                   //For Setting Locations...

                  SqlCommand cmdloc= new SqlCommand("select a.Location_fk,b.LocationName from Del_AssocLocation_Course a inner join Del_Location b on a.Location_FK=b.LocationPK where a.Course_FK='" + courseId + "'", con);
                  SqlDataAdapter adpLoc = new SqlDataAdapter(cmdloc);

                  DataSet dsLoc = new DataSet();
                  adpLoc.Fill(dsLoc);

                  for (int i = 1; i <= dsLoc.Tables[0].Rows.Count; i++)
                  {

                      LstAssignedLocation.Items.Add(new ListItem(dsLoc.Tables[0].Rows[i]["Location_fk"].ToString(), dsLoc.Tables[0].Rows[i]["LocationName"].ToString()));

                  }



                   //For Setting Instructors...


                  SqlCommand cmdIns = new SqlCommand("select a.Instructor_FK,b.InstructorName from Del_AssocInstructor_Course a inner join Del_Instructor b on a.Instructor_FK=b.InstructorPK where a.Course_FK='" + courseId + "'", con);
                  SqlDataAdapter adpIns = new SqlDataAdapter(cmdIns);
                  DataSet dsIns = new DataSet();
                  adpIns.Fill(dsIns);

                

                  for (int i = 1; i <= dsIns.Tables[0].Rows.Count; i++)
                  {

                      DataRow row =((DataTable)Session["SelecIns"]).NewRow();
                      row["InstructorPk"] = dsIns.Tables[0].Rows[i]["Instructor_FK"].ToString();
                      row["InstructorName"] = dsIns.Tables[0].Rows[i]["InstructorName"].ToString();
                      ((DataTable)Session["SelecIns"]).Rows.Add(row);

                     
                  }

                  grdAssignedIns.DataSource = (DataTable)Session["SelecIns"];
                  grdAssignedIns.DataBind();


                    
                }

               

            

            }

        }
        catch(Exception Ex)
        {
            string altMsg = Ex.Message;
            altMsg = altMsg.Replace('\n', ' ');
            string stcTrc = Ex.StackTrace;
            stcTrc = stcTrc.Replace('\n', ' ');
            string User = Context.User.Identity.Name;
            User = User.Remove(User.IndexOf("\\"), 6);

            Response.Redirect("Error.aspx?ErrDtl=" + "default.aspx" + "~" + User.ToString() + "~" + altMsg.ToString() + "~" + stcTrc.ToString());
           
        }
    }

    protected void LoadControls()
    {

       SqlCommand cmd=new SqlCommand("sp_GetCourseForm",con);
       cmd.CommandType=CommandType.StoredProcedure;

       SqlDataAdapter adp = new SqlDataAdapter(cmd);
       DataSet ds = new DataSet();

       adp.Fill(ds);

        

       LstApprovedLocation.DataSource = ds.Tables[0];
       LstApprovedLocation.DataValueField = "LocationPk";
       LstApprovedLocation.DataTextField = "LocationName";
       LstApprovedLocation.DataBind();

      DrpApprovedInstructors.DataSource = ds.Tables[1];
      DrpApprovedInstructors.DataValueField = "InstructorPk";
      DrpApprovedInstructors.DataTextField = "InstructorName";
      DrpApprovedInstructors.DataBind();

   
    }

    protected DataTable createTable()

    {
        //DataTable tbl = new DataTable();

        //DataColumn col = new DataColumn();
        //col.ColumnName = "InstructorPk";
        //col.DataType = Type.GetType("System.String");
        //tbl.Columns.Add(col);

        //DataColumn col2 = new DataColumn();
        //col2.ColumnName = "InstructorName";
        //col2.DataType = Type.GetType("System.String");
        //tbl.Columns.Add(col2);
        DataTable tbl = new DataTable();

        tbl.Columns.Add(new DataColumn("InstructorPk",typeof(int)));
        tbl.Columns.Add(new DataColumn("InstructorName",typeof(string)));



        //DataTable Mytbl = new DataTable();
        //Mytbl.Columns.Add(new DataColumn("pid", typeof(int)));
        //Mytbl.Columns.Add(new DataColumn("pname", typeof(string)));
        //Mytbl.Columns.Add(new DataColumn("pname", typeof(bool)));
        //Mytbl.Columns.Add(new DataColumn("pname", typeof(DateTime))); 


       

        return tbl;

    }



    protected void btnSave_Click(object sender, EventArgs e)
    {

        try
        {


            //if (Page.IsValid)
            //{
               

                string User = Context.User.Identity.Name;
                User = User.Remove(User.IndexOf("\\"), 6);

                string cName = txtName.Text;
                string cCode = TxtCode.Text;
                string cStatus = DrpStatus.SelectedValue;

                string cDuration = TxtDuration.Text;
                string cMaxvalue = TxtMaxsize.Text;
                string cMinvalue = TxtMinSize.Text;


                //con.Open();
                SqlCommand cmd = new SqlCommand("sp_sel_setCourseDtl", con);
                cmd.CommandType = CommandType.StoredProcedure;

                if (Session["Crsid"] != null)
                {

                    SqlParameter par = cmd.Parameters.AddWithValue("@CourseId", (int)Session["Crsid"]);
                    par = cmd.Parameters.AddWithValue("@CourseName", cName);
                    par = cmd.Parameters.AddWithValue("@CourseCode", cCode);
                    par = cmd.Parameters.AddWithValue("@Status", cStatus);
                    par = cmd.Parameters.AddWithValue("@Duration", cDuration);
                    par = cmd.Parameters.AddWithValue("@Maxsize", cMaxvalue);
                    par = cmd.Parameters.AddWithValue("@minsize", cMinvalue);
                    par = cmd.Parameters.AddWithValue("@User", User);

                }
                else
                {

                    SqlParameter par = cmd.Parameters.AddWithValue("@CourseId", courseId);
                    par = cmd.Parameters.AddWithValue("@CourseName", cName);
                    par = cmd.Parameters.AddWithValue("@CourseCode", cCode);
                    par = cmd.Parameters.AddWithValue("@Status", cStatus);
                    par = cmd.Parameters.AddWithValue("@Duration", cDuration);
                    par = cmd.Parameters.AddWithValue("@Maxsize", cMaxvalue);
                    par = cmd.Parameters.AddWithValue("@minsize", cMinvalue);
                    par = cmd.Parameters.AddWithValue("@User", User);

                }

              
                cmd.ExecuteNonQuery();

                AddLocInstru();






                //SqlParameter Par1 = cmd.Parameters.Add("@CourseName", SqlDbType.VarChar, 200);


                //if (cName != "")
                //{

                //    Par1.Value = cName.ToString();
                //}
                //else
                //{

                //    Par1.Value = DBNull.Value;
                //}



                //Par1 = cmd.Parameters.Add("@Status", SqlDbType.VarChar, 200);
                //if (cStatus != "")
                //{

                //    Par1.Value = cStatus.ToString();
                //}
                //else
                //{

                //    Par1.Value = DBNull.Value;
                //}



                //Par1 = cmd.Parameters.Add("@Code", SqlDbType.VarChar, 200);

                //if (cCode != "")
                //{

                //    Par1.Value = cCode.ToString();
                //}
                //else
                //{

                //    Par1.Value = DBNull.Value;
                //}

                //Par1 = cmd.Parameters.Add("@Duration", SqlDbType.Int);

                //if (cDuration != "")
                //{

                //    Par1.Value = cDuration.ToString();
                //}
                //else
                //{

                //    Par1.Value = DBNull.Value;
                //}


                //Par1 = cmd.Parameters.Add("@MinSize", SqlDbType.Int);

                //if (cMinvalue != "")
                //{

                //    Par1.Value = cMinvalue.ToString();
                //}
                //else
                //{

                //    Par1.Value = DBNull.Value;
                //}


                //Par1 = cmd.Parameters.Add("@MaxSize", SqlDbType.Int);
                //if (cMaxvalue != "")
                //{

                //    Par1.Value = cMaxvalue.ToString();
                //}
                //else
                //{

                //    Par1.Value = DBNull.Value;
                //}

                //Par1 = cmd.Parameters.Add("@Location", SqlDbType.VarChar, 2000);


                //if (hidSelectedLocations.Value != "")
                //{

                //    Par1.Value = hidSelectedLocations.Value.ToString();

                //}

                //else
                //{

                //    Par1.Value = DBNull.Value;
                //}

                //cmd.ExecuteNonQuery();
                //con.Close();

         //   }

        
        
        
        
     }
        catch(Exception Ex)
        {
            string User = Context.User.Identity.Name;
            User = User.Remove(User.IndexOf("\\"), 6);

            string altMsg = Ex.Message.ToString();
            altMsg = altMsg.Replace('\n', ' ');

            string stcTrc = Ex.StackTrace.ToString();
            stcTrc = stcTrc.Replace('\n', ' ');
          
           Response.Redirect("Error.aspx?ErrDtl=" + "Course.aspx" + "~" + User.ToString() + "~" + altMsg.ToString() + "~" + stcTrc.ToString());

       }

    }

    protected void AddLocInstru()
    {
        

        if (Session["Crsid"] != null)
        {
           
            //editing existing course...

            //Locations...
          
            SqlCommand cmd1 = new SqlCommand("delete from Del_AssocLocation_Course where course_fk=" + (int)Session["Crsid"], con);
            cmd1.ExecuteNonQuery();


            if (LstAssignedLocation.Items.Count > 0)
            {

                for (int i = 0; i <= LstAssignedLocation.Items.Count; i++)
                {

                    SqlCommand cmd3 = new SqlCommand("insert into Del_AssocLocation_Course(Course_fk,Location_fk)values('" + Session["Crsid"] + "'" + "," + "'" + LstAssignedLocation.Items[i].Value + "')", con);
                    cmd3.ExecuteNonQuery();

                }

            }
            //instructors...

            SqlCommand cmdI = new SqlCommand("delete from Del_AssocInstructor_Course where course_fk=" + (int)Session["Crsid"], con);
            cmdI.ExecuteNonQuery();

            DataTable tbl = new DataTable();
            tbl=(DataTable)Session["SelecIns"];

            if(tbl.Rows.Count>0)
            {

                for (int i = 0; i <= tbl.Rows.Count; i++)
                {

                    SqlCommand cmd4 = new SqlCommand("insert into Del_AssocInstructor_Course(Course_fk,Instructor_fk)values('" + Session["Crsid"] + "'" + "," + "'" + tbl.Rows[i]["instructorpk"].ToString() + "')", con);
                    cmd4.ExecuteNonQuery();

                }
              }
            
        }
        else
        {
         
         //new CourseInsert....

            //Locations....

            SqlCommand cmd5 = new SqlCommand("select max(coursepk) from del_course",con);
            string crID = cmd5.ExecuteScalar().ToString();


            if (LstAssignedLocation.Items.Count > 0)
            {
                for (int i = 0; i <= LstAssignedLocation.Items.Count - 1; i++)
                {

                    SqlCommand cmd6 = new SqlCommand("insert into Del_AssocLocation_Course(Course_fk,Location_fk)values('" + crID + "'" + "," + "'" + LstAssignedLocation.Items[i].Value + "')", con);
                    cmd6.ExecuteNonQuery();

                }

            }
    


            //Instructors...
           
            DataTable tbl = new DataTable();
            tbl = (DataTable)Session["SelecIns"];

            if (tbl.Rows.Count > 0)
            {
                for (int i = 0; i <= tbl.Rows.Count - 1; i++)
                {

                    SqlCommand cmd4 = new SqlCommand("insert into Del_AssocInstructor_Course(Course_fk,Instructor_fk)values('" + crID + "'" + "," + "'" + tbl.Rows[i]["instructorpk"].ToString() + "')", con);
                    cmd4.ExecuteNonQuery();

                }
            }

        }



    }


    protected void BtnBack_Click(object sender, EventArgs e)
    {

    }
    protected void BtnReset_Click(object sender, EventArgs e)
    {

    }


    protected void LnkBtnAddLocation_Click(object sender, EventArgs e)
    {


        //string selecLoc = hidSelectedLoc.Value;
        //string[] ArrselecLoc = selecLoc.Split('~');
        //LstAssignedLocation.Items.Add(new ListItem( ArrselecLoc[1],ArrselecLoc[0]));

        //OR

        LstAssignedLocation.Items.Add(new ListItem(LstApprovedLocation.SelectedItem.Text,LstApprovedLocation.SelectedItem.Value));

        
    }
    protected void LnkBtnRemoveLocation_Click(object sender, EventArgs e)
    {

        LstAssignedLocation.Items.Remove(LstAssignedLocation.SelectedItem);

    }


    protected void btnAddInstructor_Click1(object sender, EventArgs e)
    {

        string selctIns = hidSelectInc.Value.ToString();
        string[] arrselctIns = selctIns.Split('~');

        DataTable tbl=(DataTable)Session["SelecIns"];

        DataRow row = tbl.NewRow();
        row["InstructorPk"] = arrselctIns[0];
        row["InstructorName"] = arrselctIns[1];
        tbl.Rows.Add(row);

        grdAssignedIns.DataSource = tbl;
        grdAssignedIns.DataBind();



    }

  
    protected void btnRemoveInstructor_Click(object sender, EventArgs e)
    {





    }
   
}