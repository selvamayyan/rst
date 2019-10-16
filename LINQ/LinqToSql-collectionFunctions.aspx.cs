using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LINQ_LinqToSql_collectionFunctions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {




        //UsersDataContext Users = new UsersDataContext();

        //List<Userr> MyUsers = from usr in Users.Del_Users
        //                      where usr.UserPK < 20
        //                      orderby usr.UserPK
        ////                      select usr;
        //var MyUsers = from usr in Users.Del_Users
        //                     // where usr.UserPK < 20
        //                      orderby usr.UserPK
        //                      select usr;


        //grdUser.DataSource = from usr in Users.Del_Users
                             // where usr.UserPK < 20
                           //  orderby usr.UserPK
                           //  select usr;
        grdUser.DataBind();

        //GridView1.DataSource=from course in cources.Del_Courses
        //                     where course.CoursePK>10
        //                     select cources;

    }
}