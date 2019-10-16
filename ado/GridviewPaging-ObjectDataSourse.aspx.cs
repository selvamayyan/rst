using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ado_GridviewPaging_ObjectDataSourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       

    }
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        Lblfooter.Text = "Page " + Convert.ToString(GridView1.PageIndex+1)  +"of" + Convert.ToString(GridView1.PageCount);
    }
}