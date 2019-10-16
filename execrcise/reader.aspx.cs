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



public partial class execrcise_reader : System.Web.UI.Page
{

  SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
   
    protected void Page_Load(object sender, EventArgs e)
    {
        UserDetails  usr=new UserDetails();

      con.Open();
        SqlCommand cmd = new SqlCommand("select * from Del_User",con);

        SqlDataReader rdr = cmd.ExecuteReader();

        DrpUser.DataTextField = "FirstName";
        DrpUser.DataValueField = "UserPk";
        DrpUser.DataSource = rdr;
        DrpUser.DataBind();


        rdr.Close();



        SqlCommand cmd1 = new SqlCommand("select * from Del_Instructor", con);
        SqlDataReader rdr1 = cmd1.ExecuteReader();

        DrpIns.DataTextField = "InstructorName";
        DrpIns.DataValueField = "InstructorPk";
        DrpIns.DataSource = rdr1;
        DrpIns.DataBind();


        //DrpIns.DataTextField = "FirstName";
        //DrpIns.DataValueField = "UserPk";
        //DrpIns.DataSource = rdr;
        //DrpIns.DataBind();




        //SqlConnection con = new SqlConnection("data source=HP;initial catalog=Del_Scheduling_Tool;integrated security=SSPI");
        //SqlCommand cmd = new SqlCommand("select * from del_User", con);

        //con.Open();
        //SqlDataReader rdr = cmd.ExecuteReader();

        //grdTest.DataSource = rdr;
        //grdTest.DataBind();

        //con.Close();

    }
}
