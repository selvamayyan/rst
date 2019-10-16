using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LINQ_LinqToSql : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        CourseDataContext cources = new CourseDataContext();

        GridView1.DataSource=from course in cources.Del_Courses
                             where course.CoursePK>10
                             select cources;

       
    }
}