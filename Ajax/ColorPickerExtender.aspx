

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ColorPickerExtender.aspx.cs" Inherits="Ajax_ColorPickerExtender" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="scmgf" runat="server"></asp:ScriptManager>


    <cc1:ColorPickerExtender ID="ColorPickerExtender1" runat="server" TargetControlID="txtcolour" />

        <asp:DropDownList runat="server">

            <asp:ListItem Value="en-tamil" Text="தமிழ்"></asp:ListItem>
        </asp:DropDownList>

    <asp:TextBox ID="txtcolour" runat="server">
    </asp:TextBox>
    </div>
    </form>
</body>
</html>
