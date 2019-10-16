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

public partial class VariuosDatabinding : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        ArrayList fruit = new ArrayList();

        fruit.Add("Apple");
        fruit.Add("Orange");
        fruit.Add("Cheko");
        fruit.Add("Grap");
        fruit.Add("Bannana");


        rdlist.DataSource = fruit;
        chklist.DataSource = fruit;
        lstFruit.DataSource = fruit;
        
      
        DrpFruit.DataSource = fruit;
       
        this.DataBind();


    }
    protected void lstFruit_SelectedIndexChanged(object sender, EventArgs e)
    {


        
       

    }
    protected void DrpFruit_SelectedIndexChanged(object sender, EventArgs e)
    {

        string ss = DrpFruit.SelectedItem.Text;
        Response.Write(ss);

    }



    protected void rdlist_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
