using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient;
 

public partial class outputparameter_ : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {


        if(!IsPostBack)
        {


            try
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Output", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter par=cmd.Parameters.Add("@Rose",SqlDbType.VarChar,100);
                par.Value=20;

                par=cmd.Parameters.Add("@Lilly",SqlDbType.VarChar,100);
                par.Value=40;
               
               
                par=cmd.Parameters.Add("@ecode",SqlDbType.VarChar,100);
                par.Direction = ParameterDirection.Output;
               

                par = cmd.Parameters.Add("@preturn", SqlDbType.VarChar, 100);
                par.Direction = ParameterDirection.ReturnValue;


                cmd.ExecuteNonQuery();
                int rst = Convert.ToInt16(cmd.Parameters["@ecode"].Value);
                int rv = Convert.ToInt16(cmd.Parameters["@preturn"].Value);

                Response.Write(rst+"<br>");
                Response.Write(rv);


              

            }
             catch( Exception Ex)
            {

                string User = Context.User.Identity.Name;
                User = User.Remove(User.IndexOf("\\"), 6);

                string altMsg = Ex.Message.ToString();
                altMsg = altMsg.Replace('\n', ' ');

                string stcTrc = Ex.StackTrace.ToString();
                stcTrc = stcTrc.Replace('\n', ' ');
                Response.Redirect("Error.aspx?ErrDtl=" + "Course.aspx" + "~" + User.ToString() + "~" + altMsg.ToString() + "~" + stcTrc.ToString());



            }









        }


    }
}