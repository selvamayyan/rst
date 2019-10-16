using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ajax_AlwaysVisibleExtender : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        for (int i = 0; i <= 1000; i++)
        {

            Response.Write(i + "<br>");
        }



    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }
}