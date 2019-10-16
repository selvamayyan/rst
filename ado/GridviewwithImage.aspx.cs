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

public partial class ado_GridviewwithImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if(!IsPostBack)
        {

            // Instance method calling..
            //Employee emp = new Employee();
            //GridView1.DataSource = emp.GetAllEmployees();
            //GridView1.DataBind();

            //static  method calling..
            //GridView1.DataSource = Employee.GetAllEmployees();
            //GridView1.DataBind();


            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand("select * from tblEmployee",con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            GridView1.DataSource = rdr;
            GridView1.DataBind();

        }

    }
}
