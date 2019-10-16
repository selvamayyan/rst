<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NextPage.aspx.cs" Inherits="NextPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h3><b>Thi is next Page...</b></h3>


    <asp:GridView ID="GrdLocations"
    runat="server"> </asp:GridView><br /><br />

     <asp:button ID="BtnCrossPostback" runat="server" text="LocationFromCrossPostback" onclick="BtnCrossPostback_Click" 
            />&nbsp;&nbsp;
     <asp:button ID="BtnFromSession" runat="server" text="LocationsFromSession" onclick="BtnFromSession_Click" 
             />&nbsp;&nbsp;
     <asp:button ID="btnLocationsFromCache" runat="server" text="LocationsFromCache " onclick="btnLocationsFromCache_Click" 
             />
       
    </div>
    </form>
</body>

</html>
