<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxCascadingDropdown.aspx.cs" Inherits="Ajax_AjaxCascadingDropdown" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div>
    <asp:ScriptManager ID="sp" runat="server"></asp:ScriptManager>
    
    <cc1:CascadingDropDown ID="CascadingDropDown1" runat="server" TargetControlID="TxtTest" />

    <asp:textbox ID="TxtTest" runat="server"></asp:textbox>
    </div>
    </form>
</body>

</html>
