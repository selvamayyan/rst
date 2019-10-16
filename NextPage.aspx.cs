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

public partial class NextPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        Page post = this.PreviousPage;
        
         

       // Label posterlabel =(Label) post.FindControl("lblname");
        //string tt=posterlabel.Text;
        //Response.Write(tt); 

        //HiddenField hidPrePg = (HiddenField)post.FindControl("hidTime");
        //string tt = hidPrePg.Value;
        //Response.Write(tt); 
        //HiddenField tt = (HiddenField)post.FindControl("hidTime");
        //Response.Write(tt.Value);
    

    }
  
    protected void BtnCrossPostback_Click(object sender, EventArgs e)
    {
         Page post = this.PreviousPage;
        // HiddenField loctions = (HiddenField)post.FindControl("LocationsView");
        
         //GrdLocations.DataSource = loctions.Value;
         //GrdLocations.DataBind();
    }
    protected void BtnFromSession_Click(object sender, EventArgs e)
    {

        GrdLocations.DataSource = (DataSet)Session["LocationSess"];
        GrdLocations.DataBind();

       

    }
    protected void btnLocationsFromCache_Click(object sender, EventArgs e)
    {

        GrdLocations.DataSource = (DataSet)Cache["LocationsCache"];
        GrdLocations.DataBind();

    }
}
