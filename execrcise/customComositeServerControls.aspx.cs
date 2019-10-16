using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class execrcise_customComositeServerControls : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
        
    }
    protected void btnprint_Click(object sender, EventArgs e)
    {

        Response.Write(CustomCalender1.SelectedDate.ToShortDateString());

    }
}