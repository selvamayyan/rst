using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Caching;


public partial class Caching_ProductCache : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Cache.Remove("ProductDetails");

    }
    protected void BtnGetProduct_Click(object sender, EventArgs e)
    {

        if (Cache["ProductDetails"] != null)
        {
            Grdroducts.DataSource = Cache["ProductDetails"];
            Grdroducts.DataBind();

            LblMsg.Text = "ProductList From Cache :" + DateTime.Now.ToString();

        }

        else
        {

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand("sp_getTblEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            SqlCacheDependencyAdmin.EnableNotifications("data source=admin-pc;initial catalog=Del_Scheduling_Tool; integrated security=SSPI");
            SqlCacheDependencyAdmin.EnableTableForNotifications("data source=admin-pc;initial catalog=Del_Scheduling_Tool; integrated security=SSPI", "TblEmployee");


            CacheItemRemovedCallback OncacheItemRemoved = new CacheItemRemovedCallback(CacheItemRemovedCallbackMethod);



            SqlCacheDependency cacheDep = new SqlCacheDependency("Del_Scheduling_Tool", "TblEmployee");
            Cache.Insert("ProductDetails", ds, cacheDep, DateTime.Now.AddDays(1), Cache.NoSlidingExpiration, CacheItemPriority.Default, OncacheItemRemoved);


           // Cache.Insert("ProductDetails", ds, null, DateTime.Now.AddSeconds(5), Cache.NoSlidingExpiration, CacheItemPriority.Default, null);

            Grdroducts.DataSource = ds;
            Grdroducts.DataBind();

            LblMsg.Text = "ProductList From Database :" + DateTime.Now.ToString();

       }

    }



    public void CacheItemRemovedCallbackMethod(string key, object value, CacheItemRemovedReason reason)
    {


        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("sp_getTblEmployee", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

     //   SqlCacheDependencyAdmin.EnableNotifications("data source=admin-pc;initial catalog=Del_Scheduling_Tool; integrated security=SSPI");
     //   SqlCacheDependencyAdmin.EnableTableForNotifications("data source=admin-pc;initial catalog=Del_Scheduling_Tool; integrated security=SSPI", "TblEmployee");


        CacheItemRemovedCallback OncacheItemRemoved = new CacheItemRemovedCallback(CacheItemRemovedCallbackMethod);



        SqlCacheDependency cacheDep = new SqlCacheDependency("Del_Scheduling_Tool", "TblEmployee");
        Cache.Insert("ProductDetails", ds, cacheDep, DateTime.Now.AddDays(1), Cache.NoSlidingExpiration, CacheItemPriority.Default, OncacheItemRemoved);



    }


}