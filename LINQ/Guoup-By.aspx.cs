using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LINQ_Guoup_By : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        var studentGroup = from stu in student.getAllrecords()
                           group  stu by stu.gender;


        foreach(var group in studentGroup)
        {
            Response.Write(group.Key + "--" + group.Count() + "</br>");

            foreach(var stu in group)
            {
                Response.Write(stu.name + "</br>");
            }
        }
                           


        //Gridview1.DataSource = studentGroup;
        //Gridview1.DataBind();

        //LstStudent.DataSource = studentGroup;
        //LstStudent.DataTextField = "Name";
        //LstStudent.DataBind();


    }
}