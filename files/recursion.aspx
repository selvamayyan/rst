

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recursion.aspx.cs" Inherits="files_recursion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <br />
        <asp:TextBox ID="Txtpath" runat="server"></asp:TextBox>
        <br />


    
     <asp:Button ID="btnfindFiles" Text="selectFiles" runat="server"
            onclick="btnfindFiles_Click" /><br /><br />


    
    
    <asp:ListBox ID="ListBox1" runat="server" Height="236px" Width="408px"></asp:ListBox>


    
    </div>
  
    </form>
</body>
</html>
