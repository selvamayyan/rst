//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Data;
//using System.Data.SqlClient;

//public partial class Calendar : System.Web.UI.Page
//{

//    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString());
//    protected void Page_Load(object sender, EventArgs e)
//    {

//        try
//        {

//           FillDropDowns();

//           FillCalendar();

//        }
//        catch(Exception Ex)
//        {

//            string User = Context.User.Identity.Name;
//            User = User.Remove(User.IndexOf("\\"), 6);

//            string altMsg = Ex.Message.ToString();
//            altMsg = altMsg.Replace('\n', ' ');

//            string stcTrc = Ex.StackTrace.ToString();
//            stcTrc = stcTrc.Replace('\n', ' ');
//            Response.Redirect("Error.aspx?ErrDtl=" + "Course.aspx" + "~" + User.ToString() + "~" + altMsg.ToString() + "~" + stcTrc.ToString());

//        }

//    }


//    protected void FillDropDowns()
//    {
//        SqlCommand cmd = new SqlCommand("Select Sessionpk,SessionName from del_Session", con);
//        cmd.CommandType = CommandType.Text;

//        SqlDataAdapter adp = new SqlDataAdapter(cmd);
//        DataSet ds = new DataSet();
//        adp.Fill(ds);

//        DdlSession.DataSource = ds.Tables[0];
//        DdlSession.DataValueField = "SessionPK";
//        DdlSession.DataTextField = "SessionName";
//        DdlSession.DataBind();
//        // PIM GEL011302-Change "ALL" to "All"
//        DdlSession.Items.Insert(0, new ListItem("All", "0"));

//        DdlYear.Items.Insert(0, new ListItem("2005", "2005"));
//        DdlYear.Items.Insert(1, new ListItem("2006", "2006"));
//        DdlYear.Items.Insert(2, new ListItem("2007", "2007"));
//        DdlYear.Items.Insert(3, new ListItem("2008", "2008"));
//        DdlYear.Items.Insert(4, new ListItem("2009", "2009"));
//        DdlYear.Items.Insert(5, new ListItem("2010", "2010"));
//        DdlYear.Items.Insert(6, new ListItem("2011", "2011"));
//        DdlYear.Items.Insert(7, new ListItem("2012", "2012"));
//        DdlYear.Items.Insert(8, new ListItem("2013", "2013"));
//        DdlYear.Items.Insert(9, new ListItem("2014", "2014"));
//        DdlYear.Items.Insert(10, new ListItem("2015", "2015"));
//        DdlYear.Items.Insert(11, new ListItem("2016", "2016"));
//        DdlYear.Items.Insert(12, new ListItem("2017", "2017"));
//        DdlYear.Items.Insert(13, new ListItem("2018", "2018"));
//        DdlYear.Items.Insert(14, new ListItem("2019", "2019"));
//        DdlYear.Items.Insert(15, new ListItem("2020", "2020"));
//        DdlYear.Items.Insert(16, new ListItem("All", "All"));

//        //Month Dropdown Filling Process...
//        DdlMonth.Items.Insert(0, new ListItem("January", "1"));
//        DdlMonth.Items.Insert(1, new ListItem("February", "2"));
//        DdlMonth.Items.Insert(2, new ListItem("March", "3"));
//        DdlMonth.Items.Insert(3, new ListItem("April", "4"));
//        DdlMonth.Items.Insert(4, new ListItem("May", "5"));
//        DdlMonth.Items.Insert(5, new ListItem("June", "6"));
//        DdlMonth.Items.Insert(6, new ListItem("July", "7"));
//        DdlMonth.Items.Insert(7, new ListItem("August", "8"));
//        DdlMonth.Items.Insert(8, new ListItem("September", "9"));
//        DdlMonth.Items.Insert(9, new ListItem("October", "10"));
//        DdlMonth.Items.Insert(10, new ListItem("November", "11"));
//        DdlMonth.Items.Insert(11, new ListItem("December", "12"));


//    }



//    protected void FillCalendar()
//    {

//                   //string Year = DdlYear.SelectedValue;
//           //string Month = DdlMonth.SelectedValue;



//           int Year = Convert.ToInt32(DdlYear.SelectedValue.ToString());
//           int Month = Convert.ToInt32(DdlMonth.SelectedValue.ToString());

//           SqlCommand cmd = new SqlCommand("sp_SEL_GetResults", con);
//        cmd.CommandType = CommandType.StoredProcedure;

//      SqlParameter par1 = cmd.Parameters.Add("@Year", SqlDbType.Int);

//      if (DdlYear.SelectedIndex != 16)
//      {
//          par1.Value = Year; 
//      }
//      else
//      {
//          par1.Value = DBNull.Value;
//      }
//     // --

//      SqlParameter par2 = cmd.Parameters.Add("@month", SqlDbType.Int);
//      par2.Value = Month;
        

//        SqlDataAdapter adp = new SqlDataAdapter(cmd);
//        DataSet ds = new DataSet();
//        adp.Fill(ds);

//        DataView dv = new DataView();
//        dv=ds.Tables[0].DefaultView;
//        dv.Sort = "Tooltip";

//        CalendarCtrl.DataSource = dv;
       
//        CalendarCtrl.DataBind();
       
 


   

//    }
//    protected void BtnSearch_Click(object sender, EventArgs e)
//    {

//        int Year = Int32.Parse(DdlYear.SelectedValue.ToString());
//        int Month = Int32.Parse(DdlMonth.SelectedValue.ToString());

//        CalendarCtrl.SelectedDate = Convert.ToDateTime("" + Month + "/1/" + Year);
//    }
//    protected void BtnDay_Click1(object sender, EventArgs e)
//    {

//    }
//    protected void BtnWeek_Click1(object sender, EventArgs e)
//    {

//    }
//    protected void BtnMonth_Click(object sender, EventArgs e)
//    {

//    }
//    protected void DecDateButton_Click(object sender, EventArgs e)
//    {
//        try
//        {

//            switch (CalendarCtrl.ViewType)
//            {
//                case Mediachase.Web.UI.WebControls.CalendarViewType.DayView:
//                    CalendarCtrl.SelectedDate = CalendarCtrl.SelectedDate.AddDays(-1);

//                    BindLabelHeader();
//                    DdlYear.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Year);
//                    DdlMonth.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Month);


//                    ClickedDate = CalendarCtrl.SelectedDate.ToString();
//                    Dayview = "YES";
//                    CalendarCtrl.DataMember = "DST";
//                    CalendarCtrl.DataSource = FillCalendar();
//                    CalendarCtrl.DataBind();
//                    CalendarCtrl.Font.Size = 10;

//                    // BtnDay_Click1(this, e);



//                    break;
//                case Mediachase.Web.UI.WebControls.CalendarViewType.WeekView2:
//                    CalendarCtrl.SelectedDate = CalendarCtrl.SelectedDate.AddDays(-7);

//                    BindLabelHeader();
//                    DdlYear.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Year);
//                    DdlMonth.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Month);
//                    BtnWeek_Click1(this, e);

//                    break;


//                case Mediachase.Web.UI.WebControls.CalendarViewType.MonthView:
//                    CalendarCtrl.SelectedDate = CalendarCtrl.SelectedDate.AddMonths(-1);

//                    BindLabelHeader();
//                    DdlYear.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Year);
//                    DdlMonth.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Month);
//                    BtnMonth_Click(this, e);

//                    break;

//            }

//        }

//        catch (Exception ex)
//        {
//            string _stackTrace = " Stack Trace:" + ex.StackTrace.Replace('\n', ' ');
//            string _alertMsg = "";
//            _alertMsg = ex.Message;
//            Response.Redirect("../Del_error.aspx?ErrorInfo=" + _source.ToString() + "~" + _alertMsg.ToString() + "~" + _stackTrace + "~" + _userName.ToString());

//        }
//        finally
//        {
//            con.Close();
//        }
//    }
//    protected void IncDateButton_Click(object sender, EventArgs e)
//    {
//        try
//        {
//            switch (CalendarCtrl.ViewType)
//            {
//                case Mediachase.Web.UI.WebControls.CalendarViewType.DayView:
//                    CalendarCtrl.SelectedDate = CalendarCtrl.SelectedDate.AddDays(1);
//                    BindLabelHeader();
//                    DdlYear.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Year);
//                    DdlMonth.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Month);


//                    ClickedDate = CalendarCtrl.SelectedDate.ToString();
//                    Dayview = "YES";
//                    CalendarCtrl.DataMember = "DST";
//                    CalendarCtrl.DataSource = FillCalendar();
//                    CalendarCtrl.DataBind();
//                    CalendarCtrl.Font.Size = 10;

//                   // BtnDay_Click1(this, e);

//                    break;
//                case Mediachase.Web.UI.WebControls.CalendarViewType.WeekView2:
//                    CalendarCtrl.SelectedDate = CalendarCtrl.SelectedDate.AddDays(7);

//                    BindLabelHeader();
//                    DdlYear.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Year);
//                    DdlMonth.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Month);
//                    BtnWeek_Click1(this, e);

//                    break;
//                case Mediachase.Web.UI.WebControls.CalendarViewType.MonthView:
//                    CalendarCtrl.SelectedDate = CalendarCtrl.SelectedDate.AddMonths(1);

                   
//                    BindLabelHeader();
//                    DdlYear.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Year);
//                    DdlMonth.SelectedValue = Convert.ToString(CalendarCtrl.SelectedDate.Month);
//                    BtnMonth_Click(this, e);

//                    break;

//            }
           

//        }



//        catch (Exception ex)
//        {
//            string _stackTrace = " Stack Trace:" + ex.StackTrace.Replace('\n', ' ');
//            string _alertMsg = "";
//            _alertMsg = ex.Message;
//            Response.Redirect("../Del_error.aspx?ErrorInfo=" + _source.ToString() + "~" + _alertMsg.ToString() + "~" + _stackTrace + "~" + _userName.ToString());

//        }
//        finally
//        {
//            con.Close();
//        }

//    }
//    }


//    //To Change the Header Information of Calendar control according to view[Day, Week,Month]
//    protected void BindLabelHeader()
//    {

//        try
//        {

//            switch (CalendarCtrl.ViewType)
//            {
//                case Mediachase.Web.UI.WebControls.CalendarViewType.DayView:
//                    CalendarCtrl.ViewType = Mediachase.Web.UI.WebControls.CalendarViewType.DayView;
//                    LblDate.Text = CalendarCtrl.SelectedDate.ToString("dd MMMM, yyyy");
//                    LblClientName.Text = "Calendar - "  + " - " + CalendarCtrl.SelectedDate.ToString("MMMM dd, yyyy");

//                    DecDateButton.Text = "Previous";
//                    IncDateButton.Text = "Next";
//                    break;

//                case Mediachase.Web.UI.WebControls.CalendarViewType.WeekView2:
//                    LblDate.Text = CalendarCtrl.SelectedDate.ToString("MMMM, yyyy");
//                    LblClientName.Text = "Calendar -  "  + " - " + CalendarCtrl.SelectedDate.ToString("MMMM, yyyy");
//                    DecDateButton.Text = "Previous";
//                    IncDateButton.Text = "Next";
//                    break;

//                case Mediachase.Web.UI.WebControls.CalendarViewType.MonthView:
//                    LblDate.Text = CalendarCtrl.SelectedDate.ToString("MMMM, yyyy");
//                    LblClientName.Text = "Calendar -  "  + " - " + CalendarCtrl.SelectedDate.ToString("MMMM, yyyy");

//                    DecDateButton.Text = "Previous";
//                    IncDateButton.Text = "Next";
//                    break;

//            }
//        }

//        catch (Exception ex)
//        {
//            string _stackTrace = " Stack Trace:" + ex.StackTrace.Replace('\n', ' ');
//            string _alertMsg = "";
//            _alertMsg = ex.Message;
//            Response.Redirect("../Del_error.aspx?ErrorInfo=" + _source.ToString() + "~" + _alertMsg.ToString() + "~" + _stackTrace + "~" + _userName.ToString());

//        }
//        finally
//        {
//            con.Close();
//        }

//    }
//}