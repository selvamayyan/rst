using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LINQ_3_LinqToSql : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        SampleDataContext Users = new SampleDataContext();
        GrdUsers.DataSource = from user in Users.Del_Users
                              where user.UserPK<25
                              orderby user.FirstName descending
                              select new {user.UserPK, user.EnterpriseID,user.FirstName,user.LastName };

       


        GrdUsers.DataBind();
    }
}