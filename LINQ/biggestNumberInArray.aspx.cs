using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LINQ_biggestNumberInArray : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        int[] numArray = {4,2,6,8,1,22,45,1,9};




        int? result = null;

        int? resultmin = numArray[0];
        foreach (int i in numArray)
        {
            if (i < resultmin)
            {
                resultmin = i;
            }

        }

        Response.Write(resultmin + "</br>");

        int? resultmax = numArray[0];
        foreach (int i in numArray)
        {
            if (i > resultmax)
            {
                resultmax = i;
            }

        }

        Response.Write(resultmax);

    }
}