using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _3Tier_multicast_Delegate : System.Web.UI.Page
{

    //protected void Page_Init(object sender, EventArgs e)
    //{

    //  //  BtnmultiFunction.Click += new EventHandler(BtnmultiFunction_Click);

    //  //  BtnmultiFunction.Click += new EventHandler(method1);
    //  //  BtnmultiFunction.Click += new EventHandler(method2);
    //}

    protected void Page_Load(object sender, EventArgs e)
    {

       // BtnmultiFunction.Click += new EventHandler(method1);
       // BtnmultiFunction.Click += new EventHandler(method2);

        BtnmultiFunction.Click += new EventHandler(Btntest_Click);
       // Btntest.Click += new EventHandler(BtnmultiFunction_Click);
    }


    protected void BtnmultiFunction_Click(object sender, EventArgs e)
    {



       // Response.Write("SELVAM-METHOD1");
       // Btntest.Click+=new EventHandler(Btntest_Click);


    }

   

    protected void method1(object sender, EventArgs e)
    {

        Response.Write("SELVAM-METHOD1");

    }
    protected void method2(object sender, EventArgs e)
    {

        Response.Write("SELVAM-METHOD2");

    }

    protected void Btntest_Click(object sender, EventArgs e)
    {
        Response.Write("This is Test Button_click");

      
    }
}