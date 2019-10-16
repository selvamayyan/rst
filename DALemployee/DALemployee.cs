using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using BLemployee;


namespace DALemployee
{
    public class DALemployee
    {

        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Del_Scheduling_Tool;Integrated Security=True");

        public int Insert(Employee emp)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Sel_SetTblEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter par=  cmd.Parameters.Add("@Name",SqlDbType.VarChar,200);
                         par.Value=emp.Name;
                         par=  cmd.Parameters.Add("@Gerder",SqlDbType.VarChar,2);
                         par.Value=emp.Gender;
                         par=  cmd.Parameters.Add("@City",SqlDbType.VarChar,100);
                         par.Value=emp.City;

                         cmd.ExecuteNonQuery();

 

                

            return 1;
        }

        public int Modify(int empId)
        {


            return 1;
        }

        public int Delete(int empId)
        {


            return 1;
        }
      



    }
}
