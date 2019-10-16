<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myCalendar-ServerControl-Test.aspx.cs" Inherits="execrcise_myCalendar_ServerControl_Test" %>

<%@ Register Assembly="ServerControl1" Namespace="ServerControl1" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <cc1:myCalendar ID="MyCalendar1" runat="server" ImageUrl="~/common/image/cal.gif" />

    <br />
    <br />
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    
    
    </div>
    </form>
</body>

</html>
