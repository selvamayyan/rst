<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridviewwithImage.aspx.cs" Inherits="ado_GridviewwithImage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="City" HeaderText="City" />
                <asp:TemplateField HeaderText="Photo">
                    <ItemTemplate >
                        <asp:Image ID="Image1" runat="server" Height="80px" AlternateText="photo not found" Width="80px" ImageUrl='<% # Bind("ImageUrl") %>' />
                     
                     </ItemTemplate>
                </asp:TemplateField>
                
                
                <asp:ImageField HeaderText="Photo" ControlStyle-Width="80px" AlternateText="photo not found" ControlStyle-Height="80px" DataImageUrlField="ImageUrl" ></asp:ImageField>
               
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
       
      
    </div>
    </form>
</body>
</html>
