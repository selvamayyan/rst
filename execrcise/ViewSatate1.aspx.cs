using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class execrcise_ViewSatate1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {

            this.ViewState["MyTime"] = DateTime.Now.ToString();
        }

       

        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write(this.ViewState["MyTime"]);
    }
}