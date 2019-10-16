<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="ado_Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Id" DataSourceID="Sqldatasource1">


        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="ImageUrl" HeaderText="ImageUrl" 
                SortExpression="ImageUrl" />
            <asp:BoundField DataField="Dob" HeaderText="Dob" SortExpression="Dob" />
            <asp:CommandField ShowEditButton="True"  />
        
        
        </Columns>
        </asp:GridView>

        <asp:sqldatasource ID="Sqldatasource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Del_Scheduling_ToolConnectionString %>" 
            SelectCommand="SELECT * FROM [TblEmployee]" 
           
            UpdateCommand="UPDATE [TblEmployee] SET [Name] = @Name, [Gender] = @Gender, [City] = @City, [ImageUrl] = @ImageUrl, [Dob] = @Dob WHERE [Id] = @Id">
           
        </asp:sqldatasource>
    </div>
    </form>
</body>
</html>

