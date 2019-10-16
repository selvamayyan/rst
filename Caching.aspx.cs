using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Caching : System.Web.UI.Page
{
      
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {


            if (!IsPostBack)
            {

                SqlCommand cmd = new SqlCommand("select * from del_Location", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                adp.Fill(ds);

                // Cache.Insert("Locations", ds);

                // Cache.Insert("locations", ds, null, System.Web.Caching.Cache.NoAbsoluteExpiration, TimeSpan.FromSeconds(23), System.Web.Caching.CacheItemPriority.NotRemovable, null);

                Session.Add("Locations", ds.Tables[0]);

                for (int i = 0; i < ds.Tables[0].Columns.Count; i++)
                {

                    chklstLocations.Items.Add(new ListItem(ds.Tables[0].Columns[i].ColumnName, ds.Tables[0].Columns[i].ColumnName));

                }

            }



        }
        catch (Exception Ex)
        {

            string User = Context.User.Identity.Name;
            User = User.Remove(User.IndexOf("\\"), 6);

            string altMsg = Ex.Message.ToString();
            altMsg = altMsg.Replace('\n', ' ');

            string ns = Ex.GetType().Name; 

            string stcTrc = Ex.StackTrace.ToString();
            stcTrc = stcTrc.Replace('\n', ' ');
            Response.Redirect("Error.aspx?ErrDtl=" + "Course.aspx" + "~" + User.ToString() + "~" + altMsg.ToString() + "~" + stcTrc.ToString());



        }


    }
    protected void btnloc_Click(object sender, EventArgs e)
    {


        //  DataSet ds1=new DataSet();
        //  ds1 = (DataSet)Cache["Locations"];

        try
        {

            DataTable tbl = new DataTable();
            tbl = (DataTable)Session["locations"];




            foreach (ListItem item in chklstLocations.Items)
            {

                if (!item.Selected)
                {

                    tbl.Columns.Remove(item.Text);
                    //  ds1.Tables[0].Columns.Remove(item.Text);


                }

            }

            grdShowLoc.DataSource = tbl;
            grdShowLoc.DataBind();



        }
        catch(Exception Ex)
        {

            string User = Context.User.Identity.Name;
            User = User.Remove(User.IndexOf("\\"), 6);

            string altMsg = Ex.Message.ToString();
            altMsg = altMsg.Replace('\n', ' ');

            string ns = Ex.GetType().Name; 

            string stcTrc = Ex.StackTrace.ToString();
            stcTrc = stcTrc.Replace('\n', ' ');
            Response.Redirect("Error.aspx?ErrDtl=" + "Course.aspx" + "~" + User.ToString() + "~" + altMsg.ToString() + "~" + stcTrc.ToString());



        }


    }
}