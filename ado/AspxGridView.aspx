<%@ Page Language="C#" AutoEventWireup="true" Trace="true" CodeFile="AspxGridView.aspx.cs" Inherits="ado_AspxGridView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:gridview ID="Gridview1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserPK" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="UserPK" HeaderText="UserPK" InsertVisible="False" ReadOnly="True"
                SortExpression="UserPK" />
            <asp:BoundField DataField="EnterpriseID" HeaderText="EnterpriseID" SortExpression="EnterpriseID" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="ResourceStatus" HeaderText="ResourceStatus" SortExpression="ResourceStatus" />
            <asp:BoundField DataField="RoleType_FK" HeaderText="RoleType_FK" SortExpression="RoleType_FK" />
        </Columns>
    </asp:gridview>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Del_Scheduling_ToolConnectionString %>"
            SelectCommand="SELECT [UserPK], [EnterpriseID], [LastName], [FirstName], [ResourceStatus], [RoleType_FK] FROM [Del_User]">
        </asp:SqlDataSource>

    
    </div>
    </form>
</body>
</html>
