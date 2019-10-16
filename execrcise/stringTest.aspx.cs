using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class execrcise_stringTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string mytext = "selvam.ayyanperumal";

        //for (int i = 0; i <= mytext.Length-1; i++)
        //{

          

        //}

       // string itration test..
       //string testStr = "asfefsa";
       // for (int i = 0; i < testStr.Length;i++)
       // {
       //     Response.Write(testStr[i].ToString() +  "<br/>");
       // }


       // string polyndrom test..

        string testStr = "asfefsa";
        bool chkflg = true;

    

        for (int i = 0; i < testStr.Length-1; i++)
        {

            Response.Write(testStr[i].ToString());

            for (int j = testStr.Length-1; j > 0; j--)
            {

                if (testStr[i].ToString() != testStr[j].ToString())
                {
                    chkflg = false;
                }

            }
        }

        if (chkflg)
        {
            Response.Write("It is polyndrome");
        }
        else
        {
            Response.Write("It is not polyndrome");
        }


    }
}