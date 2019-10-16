using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ado_TestDB : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection("data source =.; initial catalog = Test; Integrated Security=true;");

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from del_client",con);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);

       // DataSet ds = new DataSet();
       // adp.Fill(ds);

       SqlDataReader rdr = cmd.ExecuteReader();

        // GridView1.DataSource = ds;
        GridView1.DataSource = rdr;
        GridView1.DataBind();


    }
}