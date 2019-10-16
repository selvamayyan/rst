using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for UsersCustom
/// </summary>
public class UsersCustom
{
    public int Id { get; set; }
    public string EnterpriseId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }


    public static List<User> GetAllUsers(int pageindex, int rowsize)
    {

        using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString())) 
        {
            List<User> Users = new List<User>();

            con.Open();
            SqlCommand cmd = new SqlCommand("GetUsersPageIndexPageSize", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@pageIndex ", pageindex);
            cmd.Parameters.AddWithValue("@pageSize", rowsize);

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


    public static int getTotolCount()
    {

        int TotUsers = 0;
         using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString())) 
        {

          con.Open();

         SqlCommand cmd=new SqlCommand("Select count(*) from del_User",con);
         TotUsers=System.Convert.ToInt16(cmd.ExecuteScalar());
   
        }

         return TotUsers;
        
    }






}