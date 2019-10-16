

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="calenderExtender.aspx.cs" Inherits="Ajax_colenderExtender" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:ScriptManager ID="scrtmgr" runat="server"></asp:ScriptManager>



    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtcal" />


     <asp:TextBox ID="txtcal" runat="server"></asp:TextBox>

    </div>
    </form>
</body>
</html>
