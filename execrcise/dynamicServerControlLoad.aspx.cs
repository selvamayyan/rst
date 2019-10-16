using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class execrcise_dynamicServerControlLoad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        


        DropDownList Dydl = new DropDownList();
        Dydl.ID = "ddlCity";
        Dydl.Items.Add("New Yark");
        Dydl.Items.Add("Delhi");
        Dydl.Items.Add("London");
        PlaceHolder1.Controls.Add(Dydl);
        Dydl.Visible = false;


        TextBox Dytxt = new TextBox();
        Dytxt.ID = "txtPostCode";
        PlaceHolder1.Controls.Add(Dytxt);
        Dytxt.Visible = false;



        if (DropDownList1.SelectedValue == "DDL")
        {
            Dydl.Visible = true;

        }

        else if (DropDownList1.SelectedValue == "TB")
        {
            Dytxt.Visible = true;

        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {



        //if (DropDownList1.SelectedValue == "DDL")
        //{
        //    Dydl.Visible = true;

        //}

        //else if (DropDownList1.SelectedValue == "TB")
        //{
        //    Dytxt.Visible = true;

        //}

    }
    protected void Button1_Click(object sender, EventArgs e)
    {



        if (DropDownList1.SelectedValue == "DDL")
        {
            Response.Write(((DropDownList)PlaceHolder1.FindControl("Dydl")).SelectedItem.Text);

        }

        else if (DropDownList1.SelectedValue == "TB")
        {
            Response.Write(((TextBox)PlaceHolder1.FindControl("Dytxt")).Text);

        }



    }
}