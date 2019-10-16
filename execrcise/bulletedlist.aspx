<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bulletedlist.aspx.cs" Inherits="execrcise_bulletedlist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
    <div>
   <asp:bulletedlist ID="Bulletedlist1" runat="server" BulletStyle="Square" 
            displaymode="HyperLink" Target="_blank">
    <asp:ListItem Text="Google" Value="HTTP://www.google.com"></asp:ListItem>
    <asp:ListItem Text="Yohoo" Value="http://www.yahoo.com"></asp:ListItem>
    <asp:ListItem Text="UK" Value="3"></asp:ListItem>
    <asp:ListItem Text="FRANCE" Value="4"></asp:ListItem>
    
    </asp:bulletedlist>
    </div>
    </form>
</body>
</html>
