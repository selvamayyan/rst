<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewstate.aspx.cs" Inherits="execrcise_viewstate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

     <asp:HiddenField ID="hidTime" runat="server" />
    <br />
    <br />
    
    <asp:Button ID="dd" Text="test"  runat="server" OnClick="dd_Click" /><br />
    
    <asp:Button ID="btnCrosspost"  Text="ToNextPage" PostBackUrl="~/nextPage.aspx"     runat="server" OnClick="btnCrosspost_Click" />
    
     
    
    <asp:Label ID="lblName" runat="server" Text="Selvam"></asp:Label>

    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    
    </div>
    
    </form>
</body>
</html>
