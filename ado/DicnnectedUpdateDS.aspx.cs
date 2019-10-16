using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

 

public partial class ado_DicnnectedUpdateDS : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {

       
    }


    /// <summary>
    /// 
    /// </summary>

   
    private void datafromDB()
    {
      
      SqlDataAdapter adp = new SqlDataAdapter("select * from employee", con);
      DataSet ds = new DataSet();
      adp.Fill(ds, "Employee");

      ds.Tables["Employee"].PrimaryKey=new DataColumn[]{ds.Tables["Employee"].Columns["id"]};
      Cache.Insert("datasetEmp", ds, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);

      grdEmployee.DataSource=ds;
      grdEmployee.DataBind();

      Label1.Text = "Data Loaded from Data base";

    }


    protected void GetdataFromCache()
    {
        if (Cache["datasetEmp"] != null)
        {

            grdEmployee.DataSource = (DataSet)Cache["datasetEmp"];
            grdEmployee.DataBind();

            Label1.Text = "Data loaded from Cache";

        }



    }
    protected void BtnDatafromDB_Click(object sender, EventArgs e)
    {

        datafromDB();
    }
   


    protected void grdEmployee_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdEmployee.EditIndex = e.NewEditIndex;
        GetdataFromCache();
    }

    protected void grdEmployee_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (Cache["datasetEmp"] != null)
        {

            DataSet ds = (DataSet)Cache["datasetEmp"];
            DataRow dr=ds.Tables["Employee"].Rows.Find(e.Keys["Id"]);
            dr["Name"] = e.NewValues["Name"];
            dr["Gender"] = e.NewValues["Gender"];
            dr["City"] = e.NewValues["City"];

            Cache.Insert("datasetEmp", ds, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);
            GetdataFromCache();
      

        }
    }

    protected void grdEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        grdEmployee.EditIndex = -1;
        GetdataFromCache();

    }


    protected void grdEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {


        if (Cache["datasetEmp"] != null)
        {

            DataSet ds = (DataSet)Cache["datasetEmp"];
            


           //DataRow dr = ds.Tables["Employee"].Rows.Find(e.Keys["Id"]);

            DataRow dr = ds.Tables["Employee"].Rows[2];
            dr.Delete();

            Cache.Insert("datasetEmp", ds, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);
            GetdataFromCache();
       }
    }



    protected void btnUpdateDB_Click(object sender, EventArgs e)
    {
       
        SqlDataAdapter adp = new SqlDataAdapter("select * from tblemployee", con);
        DataSet ds = new DataSet();
        adp.Fill(ds, "Employee");

        
        SqlCommandBuilder cb = new SqlCommandBuilder(adp);
        adp = cb.DataAdapter;
        adp.Update((DataSet)Cache["datasetEmp"], "Employee");
        
    }



    protected void BtnUpdateDBCmdObject_Click(object sender, EventArgs e)
    {

        if (Cache["datasetEmp"] != null)
        {

            SqlDataAdapter adp = new SqlDataAdapter("select * from tblemployee", con);
            DataSet ds = (DataSet)Cache["datasetEmp"];
            

       SqlCommand cmdUpdate = new SqlCommand("Update tblemployee set name=@name,gender=@gender,city=@city where id=@id", con);
                      cmdUpdate.Parameters.Add("@name", SqlDbType.VarChar, 100, "name");
                      cmdUpdate.Parameters.Add("@gender", SqlDbType.VarChar, 100, "gender");
                      cmdUpdate.Parameters.Add("@city", SqlDbType.VarChar, 100, "city");
                      cmdUpdate.Parameters.Add("@id", SqlDbType.Int, 0, "id");

       SqlCommand cmdDelete = new SqlCommand("delete from tblemployee  where id=@id", con);
                      cmdDelete.Parameters.Add("@id", SqlDbType.Int, 0, "id");
     
                      adp.UpdateCommand = cmdUpdate;
                      adp.DeleteCommand = cmdDelete;

                      adp.Update(ds, "Employee");


        }
    }

    protected void btnRowState_Click(object sender, EventArgs e)
    {

        if (Cache["datasetEmp"] != null)
        {

            DataSet ds = (DataSet)Cache["datasetEmp"];

            //DataTable tbl = new DataTable();


            //DataRow dr = ds.Tables["Employee"].NewRow();

            //dr["ID"] = 6;
            //dr["Name"] = "MANI";
            //dr["Gender"] = "Male";

            //ds.Tables["Employee"].Rows.Add(dr);


            foreach (DataRow row in ds.Tables["Employee"].Rows)
            {
                Response.Write(row["id"].ToString() + "-" + row.RowState.ToString() + "<br/>");

            }

        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

        DataSet ds = (DataSet)Cache["datasetEmp"];

        ds.RejectChanges();


        foreach (DataRow row in ds.Tables["Employee"].Rows)
        {
            Response.Write(row["id"].ToString() + "-" + row.RowState.ToString() + "<br/>");

        }

        Cache.Insert("datasetEmp", ds, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);
        GetdataFromCache();


    }



    protected void btnAcceptChanges_Click(object sender, EventArgs e)
    {


        DataSet ds = (DataSet)Cache["datasetEmp"];

        ds.AcceptChanges();


        foreach (DataRow row in ds.Tables["Employee"].Rows)
        {
            Response.Write(row["id"].ToString() + "-" + row.RowState.ToString() + "<br/>");

        }
        Cache.Insert("datasetEmp", ds, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);
        GetdataFromCache();


    }

    protected void grdEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {

    }




  
}
