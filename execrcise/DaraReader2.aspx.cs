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

public partial class DaraReader2 : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {

        

        con.Open();

        SqlCommand cmd = new SqlCommand("Select * from Del_Instructor", con);
        SqlDataReader rdr = cmd.ExecuteReader();


        drpIns.DataSource = rdr;
        drpIns.DataValueField = "InstructorPk";
        drpIns.DataTextField = "InstructorName";
        drpIns.DataBind();

        rdr.Close();

        SqlCommand cmd1 = new SqlCommand("Select * from Del_Course", con);
        SqlDataReader rdr1 = cmd1.ExecuteReader();


        DrpCourse.DataSource = rdr1;
        DrpCourse.DataValueField = "CoursePk";
        DrpCourse.DataTextField = "CourseName";
        DrpCourse.DataBind();






        //if(rdr.HasRows)
        //{

        //    while (rdr.Read)
        //    {


        //    }

        //}





    }
}
