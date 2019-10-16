using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for users
/// </summary>
public class users
{
    public int Id { get; set; }
    public string EnterpriseId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }



    public static List<User> GetAllRecords()
    {

        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());

        List<User> Users = new List<User>();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from del_User", con);
        SqlDataReader rdr = cmd.ExecuteReader();

        if (rdr.HasRows)
        {
            while (rdr.Read())
            {

                User Usr = new User();

                Usr.Id = Convert.ToInt16(rdr["Userpk"]);
                Usr.EnterpriseId = rdr["EnterpriseId"].ToString();
                Usr.FirstName = rdr["FirstName"].ToString();
                Usr.LastName = rdr["LastName"].ToString();

                Users.Add(Usr);

            }

        }

        return Users;
    }

}