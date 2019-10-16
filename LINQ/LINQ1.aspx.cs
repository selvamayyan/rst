using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class LINQ_LINQ1 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {


    }


    protected void BtnSowUsers_Click(object sender, EventArgs e)
    {

        List <User> Users = new List<User>();

        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["Connectionstring"].ToString());
        SqlCommand cmd = new SqlCommand("select userpk,enterpriseid,firstname,lastname from del_user", con);
       
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
       

        if (rdr.HasRows)
        {
            while(rdr.Read())
            {
                User usr = new User();
                usr.Id=System.Convert.ToInt16(rdr["Userpk"].ToString());
                usr.EnertpriseId = rdr["enterpriseid"].ToString();
                usr.FirstName = rdr["firstname"].ToString();
                usr.Lastname = rdr["lastname"].ToString();

                Users.Add(usr);
            }
        }


        GrdUsers.DataSource = Users;
        GrdUsers.DataBind();

    }


    public class User
    {
        public int Id { get; set; }
        public string EnertpriseId { get; set; }
        public string Lastname { get; set; }
        public string FirstName { get; set; }
    }
}