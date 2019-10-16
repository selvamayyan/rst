using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class ado_CustomPaging_Gridview_ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GrdUsers.DataSource = users.GetAllRecords();
            GrdUsers.DataBind();
        }


    }
    protected void GrdUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GrdUsers.PageIndex = e.NewPageIndex;
        GrdUsers.DataSource = users.GetAllRecords();
        GrdUsers.DataBind();
    }
}