using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class ado_InsertUpdateDeleteGirdview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
                                                     
             
    }

    protected void lbInsert_Click(object sender, EventArgs e)
    {

        SqlDataSource1.InsertParameters["Name"].DefaultValue =
      ((TextBox)GridView1.FooterRow.FindControl("TxtNameInsert")).Text;

        SqlDataSource1.InsertParameters["Gender"].DefaultValue =
      ((DropDownList)GridView1.FooterRow.FindControl("DrpGenderInsert")).SelectedValue;

        SqlDataSource1.InsertParameters["City"].DefaultValue =
      ((TextBox)GridView1.FooterRow.FindControl("TxtCityInsert")).Text;



        SqlDataSource1.Insert();
    }









}
