<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VariuosDatabinding.aspx.cs"  Inherits="VariuosDatabinding" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:ListBox ID="lstFruit"  runat="server" AutoPostBack="true" OnSelectedIndexChanged="lstFruit_SelectedIndexChanged">  </asp:ListBox><br />
    
    <asp:RadioButtonList  runat="server" ID="rdlist" RepeatColumns="2" OnSelectedIndexChanged="rdlist_SelectedIndexChanged"></asp:RadioButtonList> <br />
    <asp:CheckBoxList runat="server" ID="chklist" RepeatDirection="Vertical"> </asp:CheckBoxList><br />
    
    <asp:DropDownList ID="DrpFruit" runat="server"  OnSelectedIndexChanged="DrpFruit_SelectedIndexChanged"></asp:DropDownList>
    
    </div>
    </form>
</body>
</html>
