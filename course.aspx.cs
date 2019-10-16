using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
//using System.Runtime.InteropServices




public partial class course : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());

    public string sortField = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {

            if (!IsPostBack)
            {

                loadDropdown();
                loadCourse();
                fillgrid();
            }

        }
        catch (Exception Ex)
        {

            string User = Context.User.Identity.Name;
            //User = User.Remove(User.IndexOf("\\"), 6);

            string altMsg = Ex.Message.ToString();
            altMsg = altMsg.Replace('\n', ' ');

            string stcTrc = Ex.StackTrace.ToString();
            stcTrc = stcTrc.Replace('\n', ' ');
            Response.Redirect("Error.aspx?ErrDtl=" + "Course.aspx" + "~" + User.ToString() + "~" + altMsg.ToString() + "~" + stcTrc.ToString());

        }
        finally
        {

           // con.Close();
            Response.Write(" finally working");
        }


    }


    protected void loadDropdown()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from del_Course ORDER BY COURSEPK DESC",con);
        SqlDataReader rdr = cmd.ExecuteReader();
        
        drpName.DataSource = rdr;
        drpName.DataValueField = "CoursePk";
        drpName.DataTextField = "CourseName";

        drpName.DataBind();

        rdr.Close();

    }


    protected void loadCourse()
    {
        SqlCommand cmd = new SqlCommand("Select * from del_Course", con);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();

        //adp.Fill(ds,"crsdtl");
        //Session.Add("CourseDetail", ds.Tables["crsdtl"]);

        //or

        adp.Fill(ds);
        Session.Add("CourseDetail", ds.Tables[0]);






    }

    protected void fillgrid()
    {


        DataTable dt = new DataTable();
        dt = (DataTable)Session["CourseDetail"];
        DataView dv = new DataView();

        dv = dt.DefaultView;
      //  dv.Sort = sortField;

        grdCourse.DataSource = dv;
        grdCourse.DataBind();




    }
    
    protected void grdCourse_pageIndexChanging(object sender,GridViewPageEventArgs e)
    {
        grdCourse.PageIndex = e.NewPageIndex;
        fillgrid();
      
    }


   
     protected void grdCourse_sorting(object sender, GridViewSortEventArgs e)
    {
        sortField = e.SortExpression;
        fillgrid();
    }

    



    protected void btnAdd_Click(object sender, EventArgs e)
    {

    }

   

    protected void btnEdit_Click(object sender, EventArgs e)
    {

    }

    protected void Search_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {


        Label lblmstr = (Label)Master.FindControl("Lblmaster");


        lblmstr.Text = "hai selvam";


    }
}