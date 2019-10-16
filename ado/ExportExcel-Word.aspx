<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExportExcel-Word.aspx.cs" Inherits="ado_ExportExcel_Word" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <br />
        
        <asp:Button ID="btnExportExcel" runat="server" Text="Export to Excel" Height="34px" OnClick="btnExportExcel_Click" /> &nbsp;&nbsp;&nbsp; <asp:Button ID="btnExporttoWord" runat="server" Text="Export to Word" Height="33px" Width="140px" OnClick="btnExporttoWord_Click" /><br />
        &nbsp; &nbsp; &nbsp;&nbsp;
    </div>
    </form>
    
</body>
</html>
