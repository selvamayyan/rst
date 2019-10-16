using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class execrcise_viewstate : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
   

        if (!IsPostBack)
        {

            SqlCommand cmd = new SqlCommand("select * from del_Location", con);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

           this.ViewState["LocationsView"] = ds;

            Session.Add("LocationSess", ds);

            Cache.Insert("LocationsCache", ds);
              
           // string tt = "";
            this.ViewState["tt"] = DateTime.Now.ToString();
            hidTime.Value = DateTime.Now.ToString();

        }

        Response.Write(this.ViewState["tt"]);
        Response.Write("<br/>" + hidTime.Value);

       


    }


    protected void dd_Click(object sender, EventArgs e)
    {

        DataSet ds = new DataSet();
        ds = (DataSet)this.ViewState["LocationsView"];
        GridView1.DataSource = ds; 
        GridView1.DataBind();
    }


    protected void btnCrosspost_Click(object sender, EventArgs e)
    {

                
    }
       
}