using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        try
        {

            if(!IsPostBack)
            {

               if(Request.QueryString["ErrDtl"].ToString() !="")
               {

                   string ErrorDtl = Request.QueryString["ErrDtl"].ToString();
                   string[] ArrErrorDtl = ErrorDtl.Split('~');

                   string src = ArrErrorDtl[0];
                   string user= ArrErrorDtl[1];
                   string Msg = ArrErrorDtl[2];
                   string stctrc = ArrErrorDtl[3];

                   lblError.Text = Msg;

                   ErrDtl err = new ErrDtl();
                   err.Source = src;
                   err.User = user;
                   err.ErrMsg = Msg;
                   err.StkTrc = stctrc;

                   err.writeEventlog();
                   err.WriteTextLog();


                    }


            }


            

        }
        catch( Exception Ex)
        {

            string errMsg = Ex.Message.ToString();
            errMsg = errMsg.Replace('\n',' ');

        }




    }
}