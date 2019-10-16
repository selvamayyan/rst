using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;





public partial class _Default : System.Web.UI.Page
{

    
  
    protected void Page_Load(object sender, EventArgs e)
    {
        
   //OleDbConnection con = new OleDbConnection("Provider=microsoft.jet.oledb.4.0, datasource=" + Server.MapPath ("database/rst.accdb"));
        string User = Context.User.Identity.Name;
        //User = User.Remove(User.IndexOf("\\"), 6);
      
        try
        {

            if (!IsPostBack)
            {

                UserDetails usr = new UserDetails();
                usr.EntID = User;

                if (usr.checkValidUser())
                {


                //Response.Write(Request.ServerVariables.Get("HTTP_CT_REMOTE_USER"));
                Response.Write(Request.ServerVariables.Get("AUTH_USER") + "<br/>");

                Response.Write(Context.User.Identity.Name);


                }

                else
                {

                    throw new ApplicationException("Invalid User");
                }

            }

        }

        catch (ApplicationException appEx)
        {

            string altMsg = appEx.Message.ToString();
            altMsg = altMsg.Replace('\n', ' ');

            string stcTrc = appEx.StackTrace.ToString();
            stcTrc = stcTrc.Replace('\n', ' ');
            Response.Redirect("Error.aspx?ErrDtl=" + "default.aspx" + "~" + User.ToString() + "~" + altMsg.ToString() + "~" + stcTrc.ToString());
           
        }
        

        catch (Exception Ex)
        {

            string altMsg = Ex.Message;
            altMsg = altMsg.Replace('\n', ' ');
            string stcTrc = Ex.StackTrace;
            stcTrc = stcTrc.Replace('\n', ' ');

            Response.Redirect("Error.aspx?ErrDtl=" + "default.aspx" + "~" + User.ToString() + "~" + altMsg.ToString() + "~" + stcTrc.ToString());
           

        }

       
    
    }
}