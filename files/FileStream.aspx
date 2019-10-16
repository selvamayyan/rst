<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileStream.aspx.cs" Inherits="FileStream" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    
    <br />
    
    <asp:DropDownList ID="drpFils" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpFils_SelectedIndexChanged">
    </asp:DropDownList><br /><br />
    
    <asp:Label ID="lblDisply" runat="server"></asp:Label><br /><br />
    
    <asp:Label ID="lblread" runat="server"></asp:Label> <br /><br />
    
    
    <asp:Button ID="btnRead" runat="server"  Text="Read" OnClick="btnRead_Click" />
    
    </div>
    </form>
</body>
</html>
