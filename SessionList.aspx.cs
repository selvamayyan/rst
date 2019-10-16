using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class SessionList : System.Web.UI.Page
{

    string sortfield = "sessionName";
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {

            if(!IsPostBack)
            {

                SqlCommand cmd = new SqlCommand("select sessionpk,SessionName,sessionstatus,sessiontype,activityCode, systemstatus,Scheduledstartdate from del_session",con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                adp.Fill(ds);
                Session.Add("sessiondtls",ds.Tables[0]);

                

                drpSessionName.DataSource = ds;
                drpSessionName.DataValueField = "sessionpk";
                drpSessionName.DataTextField = "sessionName";
                drpSessionName.DataBind();
                drpSessionName.Items.Insert(0, new ListItem("All", "All"));

              
                drpActivityCode.DataSource = ds;
                drpActivityCode.DataValueField = "ActivityCode";
                drpActivityCode.DataTextField = "ActivityCode";
                drpActivityCode.DataBind();
                drpActivityCode.Items.Insert(0, new ListItem("All", "All"));


                
                FillSpread();



            }



        }
        catch( Exception Ex)
        {

            string User = Context.User.Identity.Name;
            User = User.Remove(User.IndexOf("\\"), 6);

            string altMsg = Ex.Message.ToString();
            altMsg = altMsg.Replace('\n', ' ');

            string stcTrc = Ex.StackTrace.ToString();
            stcTrc = stcTrc.Replace('\n', ' ');
            Response.Redirect("Error.aspx?ErrDtl=" + "Course.aspx" + "~" + User.ToString() + "~" + altMsg.ToString() + "~" + stcTrc.ToString());

        }


    }


    protected void loadControls()
    {
     




    }

    protected void FillSpread()
    {



        string rowfilt = "";

        if (drpSessionName.SelectedItem.Text != "All")
        {

            if( rowfilt =="")
            {
                rowfilt = "SessionName= '" + drpSessionName.SelectedItem.Text + "'";
            }
            else
            {

                rowfilt = rowfilt + " AND SessionName= '" + drpSessionName.SelectedItem.Text + "'";
            }
            


        }

        if (drpActivityCode.SelectedItem.Text != "All")
        {

            if (rowfilt == "")
            {
                rowfilt = "ActivityCode= '" + drpActivityCode.SelectedItem.Text + "'";
            }
            else
            {

                rowfilt = rowfilt + " AND ActivityCode= '" + drpActivityCode.SelectedItem.Text + "'";
            }
            


        }

        if (drpActive.SelectedItem.Text != "All")
        {
            
            if (rowfilt == "")
            {
                rowfilt = "sessionstatus= '" + drpActive.SelectedItem.Text + "'";
            }
            else
            {

                rowfilt = rowfilt + " AND sessionstatus= '" + drpActive.SelectedItem.Text + "'";
            }
            


        }
        if (drpStatus.SelectedItem.Text != "All")
        {
            if (rowfilt == "")
            {
                rowfilt = "Sessiontype= '" + drpStatus.SelectedItem.Text + "'";
            }
            else
            {

                rowfilt = rowfilt + " AND Sessiontype= '" + drpStatus.SelectedItem.Text + "'";
            }
            



        }


        



        DataTable tbl = new DataTable();
        tbl=(DataTable)Session["sessiondtls"];

        DataView dv = new DataView();
        dv = tbl.DefaultView;
        dv.RowFilter = rowfilt;
        dv.Sort = sortfield;

        dgvSessionList.DataSource = dv;
        dgvSessionList.DataBind();





    }

    protected void dgvSessionList_PageIndexChanging(object sender,GridViewPageEventArgs e)
    {

        dgvSessionList.PageIndex = e.NewPageIndex;
        FillSpread();

    }


    protected void grdSessionList_Sorting(object sender, GridViewSortEventArgs e)
    {

        sortfield = e.SortExpression;
        FillSpread();


    }

  


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillSpread();
    }
    protected void btnEditSession_Click(object sender, EventArgs e)
    {

    }
    protected void btnAddnewSession_Click(object sender, EventArgs e)
    {

    }
    protected void btnCopySession_Click(object sender, EventArgs e)
    {

    }
    protected void btnRemoveSession_Click(object sender, EventArgs e)
    {

    }
    protected void drpStatus_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void drpActive_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ExportToExcel_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void BtnExportforLMS_Click(object sender, EventArgs e)
    {

    }
}