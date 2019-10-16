<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dynamicServerControlLoad.aspx.cs"  Inherits="execrcise_dynamicServerControlLoad" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server"  AutoPostBack="true"
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">

        <asp:listitem text="Please Select" value="-1" ></asp:listitem>
        <asp:listitem text="Select City" value="DDL" ></asp:listitem>
        <asp:listitem text="Enter PostCode" value="TB" ></asp:listitem>
        </asp:DropDownList>

        <br />
      <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
      <br />
      <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
    </div>

    <br />
    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
   
    </form>
</body>
</html>
