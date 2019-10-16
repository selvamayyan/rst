using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _3Tier_MasterpageRetrival : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      

        Stack<string> stk = new Stack<string>();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //1st way..
        //TextBox txtmst =(TextBox) Master.FindControl("Txtmaster");
        //txtmst.Text = TxtContent.Text;

      //  2nd way..[strongly typed way using @MasterTpe directive
      //  Master.TxtboxOnMasterPage.Text = TxtContent.Text;


        //3nd way..[we have to typecast 'masterpage'..

        //((MasterPage)Page.Master).TxtboxOnMasterPage.Text = TxtContent.Text;
     
    }
}