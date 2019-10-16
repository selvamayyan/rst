<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LINQ1.aspx.cs" Inherits="LINQ_LINQ1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family:Arial">

        <asp:Button ID="BtnSowUsers" Text="Show User" runat="server" 
            onclick="BtnSowUsers_Click"  />
        <br />
        <br />
       


        <asp:GridView ID="GrdUsers"
            runat="server">
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
