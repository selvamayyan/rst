using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ado_GirdView_Insert_Update_Delete : System.Web.UI.Page
{
    //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
   
    protected void Page_Load(object sender, EventArgs e)
    {
        //SqlCommand cmd = new SqlCommand("Select * from del_User",con);

        //con.Open();
        //SqlDataReader rdr = cmd.ExecuteReader();

        //GrdUser.DataSource = rdr;
        //GrdUser.DataBind();

       
       
        
    }

   protected void lnkBtnInsert_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["Name"].DefaultValue = ((TextBox)GrdTrainer.FooterRow.FindControl("txtInsert")).Text;
        SqlDataSource1.InsertParameters["Location"].DefaultValue = ((TextBox)GrdTrainer.FooterRow.FindControl("txtLocation")).Text;
        SqlDataSource1.InsertParameters["Salary"].DefaultValue = ((TextBox)GrdTrainer.FooterRow.FindControl("txtSalary")).Text;
        SqlDataSource1.Insert();
    }

   

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GrdTrainer_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}