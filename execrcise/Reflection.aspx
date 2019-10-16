<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reflection.aspx.cs" Inherits="execrcise_Reflection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

     <asp:TextBox ID="TxtEntry"  length="350px" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
     <asp:Button ID="btnSearch" runat="server" Text="Search" 
            onclick="btnSearch_Click" /><br /><br />

        
          <asp:ListBox ID="Lstmothod"  Height="500px" Width="200px" runat="server"></asp:ListBox> &nbsp;&nbsp;&nbsp;
          <asp:ListBox ID="LstProperties"  Height="500px" Width="200px" runat="server"></asp:ListBox> &nbsp;&nbsp;&nbsp;
          <asp:ListBox ID="LstConstructors"  Height="500px" Width="200px" 
            runat="server"></asp:ListBox> &nbsp;&nbsp;&nbsp;
        
      
    </div>
    </form>
</body>
</html>
