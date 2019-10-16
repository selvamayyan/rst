using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
   

public partial class Ajax_UpdatePanal_CasscadingDropdownList_ : System.Web.UI.Page
{


    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from city", con);
        SqlDataReader rdr = cmd.ExecuteReader();

        DrpCity.DataSource = rdr;
        DrpCity.DataTextField = "Name";
        DrpCity.DataValueField = "id";
        DrpCity.DataBind();
        rdr.Close();

        }

    }
    protected void DrpCity_SelectedIndexChanged(object sender, EventArgs e)
    {

        con.Open();
        SqlCommand cmd = new SqlCommand("select *  from College where cityId="+DrpCity.SelectedValue  , con);
        SqlDataReader rdr = cmd.ExecuteReader();

        DrpCollege.DataSource = rdr;
        DrpCollege.DataValueField = "id";
        DrpCollege.DataTextField = "CallegeName";
        DrpCollege.DataBind();

        rdr.Close();

    }
}