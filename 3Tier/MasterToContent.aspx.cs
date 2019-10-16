using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MasterToContent : System.Web.UI.Page
{


    protected void Page_Init(object sender, EventArgs e)
    {
        //Master.buttonOnMasterPage.Click += new EventHandler(buttonOnMasterPage_Click);

       Master.buttonOnMasterPage.Click +=new EventHandler(buttonOnMasterPage_Click);
        
    }



    void buttonOnMasterPage_Click(object sender, EventArgs e)
    {
        getEmployee(Master.SearchTermOnMasterPage);

      
    }

    


    protected void Page_Load(object sender, EventArgs e)
    {

        if(!IsPostBack)
        {
            getEmployee(null);
        }

    }

    public void getEmployee(string searchPar)
    
    {


        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("sp_GetEmployeesByName", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter par = cmd.Parameters.AddWithValue("@empName", searchPar??string.Empty);
            
        GrdEmployee.DataSource = cmd.ExecuteReader();
        GrdEmployee.DataBind();
        con.Close();


    }



}