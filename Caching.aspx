<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Caching.aspx.cs" Inherits="Caching" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>


    <asp:CheckBoxList id="chklstLocations" RepeatDirection="Horizontal" RepeatColumns="5" runat="server"   ></asp:CheckBoxList>
    <br /> <br />

    <asp:Button ID="btnloc" Text="selectCol" runat="server" onclick="btnloc_Click" />
     <br />
 <br />
 
 <asp:GridView ID="grdShowLoc" runat="server" ></asp:GridView>


 
    
    </div>
    </form>
</body>
</html>
