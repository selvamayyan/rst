<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GirdView-Insert-Update-Delete.aspx.cs" Inherits="ado_GirdView_Insert_Update_Delete" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
  
    <form id="form1" runat="server">
   
    <div>
      <asp:GridView ID="GrdTrainer" runat="server" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" ShowFooter="True" 
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
            CellSpacing="2" onselectedindexchanged="GrdTrainer_SelectedIndexChanged">
          <Columns>
              <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />

              <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                  </ItemTemplate>
                  <EditItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                  </EditItemTemplate>
                 
                  <FooterTemplate>
                  <asp:LinkButton ID="lnkBtnInsert" runat="server" Text="Insert" OnClick="lnkBtnInsert_Click" ValidationGroup="InsertGroup" ></asp:LinkButton>
                  </FooterTemplate>

              </asp:TemplateField>

              <asp:TemplateField HeaderText="Name" SortExpression="Name">
                  <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                  </ItemTemplate>
                  <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                  </EditItemTemplate>

                   <FooterTemplate>
                      <asp:TextBox ID="txtInsert" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rqfInsertName" runat="server" ControlToValidate="txtInsert" ErrorMessage="Name is Requried Field"
                      text="*" ForeColor="red" ValidationGroup="InsertGroup" ></asp:RequiredFieldValidator>
                   </FooterTemplate>

               </asp:TemplateField>

              <asp:TemplateField HeaderText="Location" SortExpression="Location">
                  <ItemTemplate>
                      <asp:Label ID="Label3" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                  </ItemTemplate>

                  <EditItemTemplate>
                       <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox>
                  </EditItemTemplate>

                  <FooterTemplate>
                      <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rqfInsertLoc" runat="server" ControlToValidate="txtLocation" ErrorMessage="Location is Requried Field"
                      text="*" ForeColor="red" ValidationGroup="InsertGroup"></asp:RequiredFieldValidator>
                   </FooterTemplate>
              </asp:TemplateField>


              <asp:TemplateField HeaderText="salary" SortExpression="salary">
                  <ItemTemplate>
                      <asp:Label ID="Label4" runat="server" Text='<%# Bind("salary") %>'></asp:Label>
                  </ItemTemplate>
                  <EditItemTemplate>
                      <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("salary") %>'></asp:TextBox>
                  </EditItemTemplate>

                  
                  <FooterTemplate>
                      <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rqfInsertSalary" runat="server" ControlToValidate="txtSalary" ErrorMessage="Salary is Requried Field"
                      text="*" ForeColor="red" ValidationGroup="InsertGroup"></asp:RequiredFieldValidator>
                   </FooterTemplate>

              </asp:TemplateField>

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

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Del_Scheduling_ToolConnectionString %>" 
            DeleteCommand="DELETE FROM [Trainer] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [Trainer] ([Name], [Location], [salary]) VALUES (@Name, @Location, @salary)" 
            SelectCommand="SELECT * FROM [Trainer]" 
            UpdateCommand="UPDATE [Trainer] SET [Name] = @Name, [Location] = @Location, [salary] = @salary WHERE [id] = @id">
         <DeleteParameters>
             <asp:Parameter Name="id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Name" Type="String" />
             <asp:Parameter Name="Location" Type="String" />
             <asp:Parameter Name="salary" Type="Decimal" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Name" Type="String" />
             <asp:Parameter Name="Location" Type="String" />
             <asp:Parameter Name="salary" Type="Decimal" />
             <asp:Parameter Name="id" Type="Int32" />
         </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
   
</body>
</html>
