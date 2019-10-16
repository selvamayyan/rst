using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;


public partial class ado_ExportExcel_Word : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString() );
    protected void Page_Load(object sender, EventArgs e)
    {

        if(!IsPostBack)
        {

            

            SqlCommand cmd = new SqlCommand("Select * from tblEmployee",con);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            adp.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();





        }



    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AppendHeader("content-disposition", "attachment;Employee.xls");
        Response.ContentType = "application/Excel";

        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);

        GridView1.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }

    protected void btnExporttoWord_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AppendHeader("content-disposition", "attachment;Employee.doc");
        Response.ContentType = "application/msword";

        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);

        GridView1.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }


    public override void VerifyRenderingInServerForm(Control control)
    {
        
    }


    
}
