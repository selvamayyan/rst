using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;


public partial class ado_sqlBulkCopy_xmlToTable : System.Web.UI.Page
{
   protected void Page_Load(object sender, EventArgs e)
    {

    

      
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());

        DataSet ds = new DataSet();
        ds.ReadXml(Server.MapPath("~/ado/data.xml"));
      
        con.Open();

        DataTable dtDepart = ds.Tables["department"];
        DataTable dtEmploy = ds.Tables["Employee"];

        SqlBulkCopy bc = new SqlBulkCopy(con);
        bc.DestinationTableName = "Departments";
        bc.ColumnMappings.Add("Id","Id");
        bc.ColumnMappings.Add("Name", "Name");
        bc.ColumnMappings.Add("Location", "Location");
        bc.WriteToServer(dtDepart);
        
        SqlBulkCopy bc2 = new SqlBulkCopy(con);
        bc2.DestinationTableName = "Employees";
        bc2.ColumnMappings.Add("Id", "Id");
        bc2.ColumnMappings.Add("Name", "Name");
        bc2.ColumnMappings.Add("Gender", "Gender");
        bc2.ColumnMappings.Add("DepartmentID", "DepartmentID");
        bc2.WriteToServer(dtEmploy);


    }

    public class employee
    {
        public int id { get; set; }
        public string name { get; set; }

    }


}

