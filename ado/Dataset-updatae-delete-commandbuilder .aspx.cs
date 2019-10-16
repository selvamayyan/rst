using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Dataset_updatae_delete_commandbuilder_ : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {


       


    }


    private void DatafromDB()
    {

        //SqlCommand cmd = new SqlCommand("Select userpk, enterpriseid,firstname,lastname from employee",con);
        SqlCommand cmd = new SqlCommand("Select * from employee", con);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        adp.Fill(ds, "TblUserDtls");

        grdUser.DataSource = ds;
        grdUser.DataBind();

        ds.Tables["TblUserDtls"].PrimaryKey = new DataColumn[] { ds.Tables["TblUserDtls"].Columns["id"] };

        Cache.Insert("CacheUserDtls",ds,null,DateTime.Now.AddHours(24),System.Web.Caching.Cache.NoSlidingExpiration);

        Label1.Text = "Data Loaded from DB";
    }


    private void dataFromCache()
    {


        if ((DataSet)Cache["CacheUserDtls"]!=null)
       {


           DataSet ds = (DataSet)Cache["CacheUserDtls"];
           grdUser.DataSource = ds;
           grdUser.DataBind();
       
       }

    
    
    
    }


    protected void btnDatafromDb_Click(object sender, EventArgs e)
    {

        DatafromDB();

    }


    protected void grdUser_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdUser.EditIndex = e.NewEditIndex;
        dataFromCache();
    }
    
   
    protected void grdUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        grdUser.EditIndex = -1;
        dataFromCache();
    }
    protected void grdUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        if ((DataSet)Cache["CacheUserDtls"] != null)
        {

            DataSet ds = (DataSet)Cache["CacheUserDtls"];
           // DataRow dr = ds.Tables["TblUserDtls"].Rows.Find(e.Keys["id"]);
            DataRow dr = ds.Tables["TblUserDtls"].Rows.Find(e.Values);
            //  Response.Write(ds.Tables["TblUserDtls"].Rows.Find(e.Keys["userpk"]));


            // DataRow dr1 =  ds.Tables["Employee"].Rows[2];
            dr.Delete();
          

            Cache.Insert("CacheUserDtls", ds, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);

            dataFromCache();
        }

    }
    protected void btnDataFromCache_Click(object sender, EventArgs e)
    {
        dataFromCache();
    }
    protected void grdUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if ((DataSet)Cache["CacheUserDtls"] != null)
        {

            DataSet ds = (DataSet)Cache["CacheUserDtls"];
            DataRow dr = ds.Tables["TblUserDtls"].Rows.Find(e.Keys["userpk"]);

            dr["name"] = e.NewValues["Name"];
            dr["salary"] = e.NewValues["salary"];
            dr["departmentid"] = e.NewValues["DepartmentId"];

            Cache.Insert("CacheUserDtls", ds, null, DateTime.Now.AddHours(24), System.Web.Caching.Cache.NoSlidingExpiration);

            grdUser.EditIndex = -1;
            dataFromCache();
        }
    }
    protected void grdUser_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}