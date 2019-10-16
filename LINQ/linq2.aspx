

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="linq2.aspx.cs" Inherits="LINQ_linq2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

        <asp:Button ID="BtnLabda" runat="server" Text="Linq-Lamda" 
            onclick="BtnLabda_Click" />
        <asp:Button ID="BtnSqlQury" runat="server" Text="linq-SqlExpression" 
            onclick="BtnSqlQury_Click" />
        <asp:button ID="Button1" runat="server" text="Button" onclick="Button1_Click" /><br />
        <asp:gridview ID="Gridview1" runat="server"></asp:gridview>
    </div>
   
    </form>
</body>
</html>
