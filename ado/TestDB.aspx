﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestDB.aspx.cs" Inherits="ado_TestDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       
        <div>

             <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
