using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class execrcise_PanalControl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Pnl1.Visible = false;
        PlcHld1.Visible = false;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Pnl1.Visible = true;
      
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       
        PlcHld1.Visible =true;
    }
}