using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



public partial class Ajax_UpdatePanal : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
       
    protected void Page_Load(object sender, EventArgs e)
    {



        if(!IsPostBack)
        {


            Hashtable ht = new Hashtable();
            ht.Add(2, 345);
            ht.Add("tt", "tyyy");

            foreach (DictionaryEntry d in ht)
            {
                Response.Write(d.Key + " " + d.Value);

                Response.Write("<br>");

            }

            con.Open();
            SqlCommand cmd = new SqlCommand("select distinct(city) from del_instructor order by city", con);
            SqlDataReader rdr = cmd.ExecuteReader();

            DrpUser.DataSource = rdr;
            DrpUser.DataValueField = "city";
            DrpUser.DataTextField = "city";
            DrpUser.DataBind();

            rdr.Close();
        }
        




    }


    protected void DrpUser_SelectedIndexChanged(object sender, EventArgs e)
    {


           con.Open();
            SqlCommand cmd1 = new SqlCommand("select * from del_instructor where city='"+ DrpUser.SelectedValue +"'", con);
            SqlDataReader rdr = cmd1.ExecuteReader();

            GdvInstructor.DataSource = rdr;
            GdvInstructor.DataBind();
       



    }


    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
   //Image1.ImageUrl = RadioButtonList1.SelectedValue; 
   //Label1.Text = RadioButtonList1.SelectedItem.Text; 


    }
    
}