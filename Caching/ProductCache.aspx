<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductCache.aspx.cs" Inherits="Caching_ProductCache" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Button ID="BtnGetProduct" runat="server" Text="Get Product" 
            onclick="BtnGetProduct_Click" /><br /><br />
        <asp:GridView ID="Grdroducts" runat="server">
        </asp:GridView>
        <br />

         <asp:Label ID="LblMsg" runat="server" Text="Label"></asp:Label>
    
    </div>
    
   
    
    </form>
</body>
</html>
