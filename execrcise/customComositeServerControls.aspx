<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customComositeServerControls.aspx.cs" Inherits="execrcise_customComositeServerControls" %>

<%@ Register Assembly="CustomControl" Namespace="CustomControl" TagPrefix="cc1" %>








<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
</head>
<body>
    
    <form id="form1" runat="server">
  
    <div>
         <cc1:CustomCalender ID="CustomCalender1" runat="server" 
             ImagebuttonImageUrl="~/common/image/cal.gif" SelectedDate="2015-05-16" />
   

   <br /><br />
   <asp:Button ID="btnprint" runat="server"  Text="printDate" onclick="btnprint_Click"/>
    </div>
    </form>
</body>

</html>
