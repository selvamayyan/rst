<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfirmButtonExtender.aspx.cs" Inherits="Ajax_ConfirmButtonExtender" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:ScriptManager ID="spm" runat="server">
     </asp:ScriptManager>
        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" ConfirmText="Are you want to Save?"  TargetControlID="btnSave" runat="server" />
    
      <asp:Button ID="btnSave" runat="server" Text="Save" />

    </div>
   
    </form>
</body>
</html>
