<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DicnnectedUpdateDS.aspx.cs" Inherits="ado_DicnnectedUpdateDS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family:Arial">
    
        <asp:Button ID="BtnDatafromDB"  runat="server" Text="Data from DB" OnClick="BtnDatafromDB_Click" />
        
        <asp:GridView ID="grdEmployee" runat="server" DataKeyNames="Id" 
         OnRowCancelingEdit="grdEmployee_RowCancelingEdit" OnRowDeleting="grdEmployee_RowDeleting" 
         OnRowEditing="grdEmployee_RowEditing" OnRowUpdating="grdEmployee_RowUpdating" OnSelectedIndexChanged="grdEmployee_SelectedIndexChanged"   >
        
        <Columns>
          <asp:CommandField ShowEditButton="true"  ShowDeleteButton="true" />
          
        
        </Columns>
        </asp:GridView>
       <%-- <asp:Button ID="btnRowState" runat="server" OnClick="btnRowState_Click" Text="RowState" />--%>
       
   
       <asp:Button ID="btnUpdateDB" runat="server" Text="Update database-commandBuilder" OnClick="btnUpdateDB_Click" />
       <asp:Button ID="BtnUpdateDBCmdObject" runat="server" 
            Text="Update database-CmdObject" onclick="BtnUpdateDBCmdObject_Click"  />

       <asp:Label ID="Label1" runat="server" ForeColor="#00C000" ></asp:Label>&nbsp;
        <asp:Button ID="btnRejectChanges" runat="server" OnClick="Button1_Click" Text="UnDo" />
        <asp:Button ID="btnAcceptChanges" runat="server" OnClick="btnAcceptChanges_Click"
            Text="AcceptChanges" /></div>
    </form>
</body>
</html>
