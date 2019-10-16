<%@ Page Language="C#" AutoEventWireup="true" Trace="true" CodeFile="InsertUpdateDeleteGirdview.aspx.cs" Inherits="ado_InsertUpdateDeleteGirdview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" ShowFooter="True">
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
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
                           <asp:LinkButton ID="lbInsert"  OnClick="lbInsert_Click"  ValidationGroup="Insert" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>

                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                      <asp:TextBox ID="TxtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    
                      <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                      text="*" ErrorMessage="Name is requtred field" ForeColor="red" ></asp:RequiredFieldValidator>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    
                    <FooterTemplate>
                        <asp:TextBox ID="TxtNameInsert" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvInsertName" runat="server" ControlToValidate="TxtNameInsert"
                      text="*" ErrorMessage="Name is requtred field" ForeColor="red" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    
                    </FooterTemplate>
                    
                    
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DrpGender"  selectedvalue='<%# Bind("Gender") %>' runat="server">
                         <asp:ListItem>Select Gender</asp:ListItem>
                         <asp:ListItem>Male</asp:ListItem>
                         <asp:ListItem>Female</asp:ListItem>
                         </asp:DropDownList>
                       <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="DrpGender"
                      text="*" ErrorMessage="Gender is requtred field" ForeColor="red"  InitialValue="Select Gender"></asp:RequiredFieldValidator>
                         
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                    </ItemTemplate>
                    
                    <FooterTemplate>
                      <asp:DropDownList ID="DrpGenderInsert"  runat="server">
                         <asp:ListItem>Select Gender</asp:ListItem>
                         <asp:ListItem>Male</asp:ListItem>
                         <asp:ListItem>Female</asp:ListItem>
                         </asp:DropDownList>
                    
                      <asp:RequiredFieldValidator ID="rfvInsertGender" runat="server" ControlToValidate="DrpGenderInsert"
                      text="*" ErrorMessage="Gender is requtred field" ValidationGroup="Insert" ForeColor="red" InitialValue="Select Gender"></asp:RequiredFieldValidator>
                         
                    </FooterTemplate>
                    
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="City" SortExpression="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                        
                         <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                        text="*" ErrorMessage="City is requtred field"   ForeColor="red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="TxtCityInsert" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertCity" runat="server" ControlToValidate="TxtCityInsert"
                        text="*" ErrorMessage="City is requtred field" ValidationGroup="Insert" ForeColor="red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    
                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
        &nbsp; &nbsp;
        <asp:ValidationSummary ID="ValidationSummaryInsert"  ForeColor="red" ShowSummary="true"  runat="server" />
        <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="Insert" ForeColor="red" ShowSummary="true"  runat="server" />
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Del_Scheduling_ToolConnectionString %>"
            DeleteCommand="DELETE FROM [TblEmployee] WHERE [Id] = @Id" InsertCommand="INSERT INTO [TblEmployee] ([Name], [Gender], [City]) VALUES (@Name, @Gender, @City)"
            SelectCommand="SELECT * FROM [TblEmployee]" UpdateCommand="UPDATE [TblEmployee] SET [Name] = @Name, [Gender] = @Gender, [City] = @City WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="City" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        &nbsp;<br />
        <br />
        &nbsp;&nbsp;
    </div>
    </form>
</body>
</html>
