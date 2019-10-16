<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView-Insert-update-Delete2 .aspx.cs" Inherits="GridView_Insert_update_Delete2_" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:GridView ID="GVemployee" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataKeyNames="Id" DataSourceID="Sqldatasource1" 
        ShowFooter="True" OnSelectedIndexChanged="GVemployee_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                      
                </ItemTemplate>


                <FooterTemplate>
<%--                <asp:LinkButton ID="lnkInsert" runat="server"  OnClick="lnkInsert_click" Text="Insert"></asp:LinkButton>--%>
                </FooterTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>



            <asp:TemplateField HeaderText="City" SortExpression="City">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>



            <asp:BoundField DataField="ImageUrl" HeaderText="ImageUrl" 
                SortExpression="ImageUrl" />
            <asp:BoundField DataField="Dob" HeaderText="Dob" SortExpression="Dob" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server">
    </asp:ObjectDataSource>
    <asp:sqldatasource ID="Sqldatasource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Del_Scheduling_ToolConnectionString %>" 
        DeleteCommand="DELETE FROM [TblEmployee] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [TblEmployee] ([Name], [Gender], [City], [ImageUrl], [Dob]) VALUES (@Name, @Gender, @City, @ImageUrl, @Dob)" 
        SelectCommand="SELECT * FROM [TblEmployee]" 
        UpdateCommand="UPDATE [TblEmployee] SET [Name] = @Name, [Gender] = @Gender, [City] = @City, [ImageUrl] = @ImageUrl, [Dob] = @Dob WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="ImageUrl" Type="String" />
            <asp:Parameter Name="Dob" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="ImageUrl" Type="String" />
            <asp:Parameter Name="Dob" Type="DateTime" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:sqldatasource>

    </form>
</body>
</html>

