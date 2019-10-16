using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Ajax_GoogleSearch : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
  

    protected void Page_Load(object sender, EventArgs e)
    {
        
    

    TxtSearch.Attributes.Add("onkeyup", "chngtxtbxval();");
       
    }
    protected void TxtSearch_TextChanged(object sender, EventArgs e)
    {

        con.Open();
        SqlCommand cmd = new SqlCommand("select firstName from del_user where firstname like'" + (TxtSearch.Text ).Trim() +"%'",con);
        SqlDataReader rdr = cmd.ExecuteReader();

        LstItems.DataSource = rdr;
        LstItems.DataTextField = "FirstName";
        LstItems.DataBind();
        
    }
}