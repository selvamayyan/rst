<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dataset-updatae-delete-commandbuilder .aspx.cs" Inherits="Dataset_updatae_delete_commandbuilder_" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

       <asp:Button ID="btnDatafromDb"  Text="DataFrom DB"  runat="server" 
            onclick="btnDatafromDb_Click" />
       <br />
       <asp:GridView ID="grdUser"  runat="server" 
             onrowcancelingedit="grdUser_RowCancelingEdit" 
             onrowdeleting="grdUser_RowDeleting" onrowediting="grdUser_RowEditing" 
             onrowupdating="grdUser_RowUpdating" 
            onselectedindexchanged="grdUser_SelectedIndexChanged">
       
       <Columns>
       




       <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
       
       </Columns>



       </asp:GridView>


    
    </div>
    <asp:Button ID="btnDataFromCache" runat="server" Text="DataFromCache" 
        onclick="btnDataFromCache_Click" />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
    </form>
</body>
</html>
