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

public partial class OutputParameter : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString() );
   
   
    protected void Page_Load(object sender, EventArgs e)
    {

        con.Open();
        //SqlCommand cmd = new SqlCommand("sp_Output", con);
        //cmd.CommandType=CommandType.StoredProcedure;
        // SqlParameter parm1=cmd.Parameters.Add("@Rose",SqlDbType.Int);
        // parm1.Value=60;
        //SqlParameter parm2=cmd.Parameters.Add("@Lilly",SqlDbType.Int);
        // parm2.Value=60;
        // SqlParameter parm3=cmd.Parameters.Add("@Jas",SqlDbType.Int);
        // parm3.Direction=ParameterDirection.Output;
        //cmd.ExecuteNonQuery();

        //int gg=Convert.ToInt16(cmd.Parameters["@Jas"].Value);
        //Response.Write(gg);

       //SqlCommand cmd = new SqlCommand("Select dbo.fun_GetTable(@SessionPk) as Result", con);
        SqlCommand cmd = new SqlCommand("Select dbo.funInsAssigned(@SessionPk) as Result", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@SessionPk", 116);

        SqlDataReader rdr = cmd.ExecuteReader();

        rdr.Read();
        string tt = rdr["Result"].ToString();
        Response.Write(tt);

      
        //grdfunctionCall.DataSource = cmd.ExecuteReader();
        //grdfunctionCall.DataBind();
        //grdfunctionCall.DataBind();


        //if (Rdr.HasRows)
        //{
        //    Rdr.Read();

        //  grdfunctionCall.DataSource=  Rdr("Result");
        //  grdfunctionCall.DataBind();

        //}


    }

}
