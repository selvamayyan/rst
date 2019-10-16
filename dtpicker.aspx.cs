using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dtpicker : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            
            if (Request.QueryString["selectDat"].ToString() != "")
            {

                myCalender.SelectedDate = System.Convert.ToDateTime(Request.QueryString["selectDat"].ToString());

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
    protected void myCalender_SelectionChanged(object sender, EventArgs e)
    {

        Response.Write("<script language='javascript'>window.returnValue='"+myCalender.SelectedDate.ToString() +"'; window.close();</script>");
           
    }

}