using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class bestfitLocation : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["connectionstring"].ToString());
 
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {

            if (!IsPostBack)
            {

                if (Request.QueryString["selLoc"].ToString() != "")
                {
                    hidSelectedLocation.Value = Request.QueryString["selLoc"].ToString();
                   // Response.Write(Request.QueryString["selLoc"].ToString());
                }

                con.Open();
                SqlCommand cmd = new SqlCommand("sp_sel_bestfitlocation", con);
                cmd.CommandType = CommandType.StoredProcedure;
               

                SqlDataReader rdr = cmd.ExecuteReader();

                grdbestfitLoc.DataSource = rdr;
                grdbestfitLoc.DataBind();
                con.Close();

               


            }


        }
        catch(Exception Ex)
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void btnOK_Click(object sender, EventArgs e)
    {

    }
    protected void ExportToExcel_Click(object sender, ImageClickEventArgs e)
    {

    }
}