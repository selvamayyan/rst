<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dtpicker.aspx.cs" smartnavigation="true" Inherits="dtpicker" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <asp:Calendar ID="myCalender" runat ="server" BackColor="White" 
            BorderColor="Black" 
            Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" 
            onselectionchanged="myCalender_SelectionChanged" 
            Width="330px" BorderStyle="Solid" CellSpacing="1" 
            NextPrevFormat="ShortMonth" >
        <DayHeaderStyle Font-Bold="True" Height="8pt" Font-Size="8pt" 
            ForeColor="#333333" />
        <DayStyle BackColor="#CCCCCC" />
        <NextPrevStyle Font-Size="8pt" ForeColor="White" Font-Bold="True" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="#333399" Font-Bold="True" Font-Size="12pt" 
            ForeColor="White" BorderStyle="Solid" Height="12pt" />
        <TodayDayStyle BackColor="#999999" ForeColor="White" />

    
    </asp:Calendar>
    
    </div>
    </form>
</body>
</html>
