﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AlwaysVisibleExtender.aspx.cs" Inherits="Ajax_AlwaysVisibleExtender" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   

   <asp:ScriptManager ID="SPMNGR" runat="server"></asp:ScriptManager>

        <cc1:AlwaysVisibleControlExtender ID="AlwaysVisibleControlExtender1"
        HorizontalOffset="10" VerticalOffset="10" runat="server" HorizontalSide="Right" TargetControlID="panal1" />

    


    <asp:Panel ID="panal1" runat="server">
      <asp:Button ID="btnSubmit"  Text="Submit" runat="server" 
            onclick="btnSubmit_Click" />
    
    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
