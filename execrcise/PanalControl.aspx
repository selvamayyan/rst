﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PanalControl.aspx.cs" Inherits="execrcise_PanalControl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>


        <asp:Panel ID="Pnl1" runat="server">

            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
             <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
        </asp:Panel>
       

        <br />
        <br />

        <asp:PlaceHolder ID="PlcHld1" runat="server">
        
        <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
             <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
             <asp:ListBox ID="ListBox2" runat="server"></asp:ListBox>
        
        </asp:PlaceHolder>

          <asp:Button ID="Button1" runat="server" Text="Show Panel" 
        onclick="Button1_Click" />
    <asp:button ID="Button2" runat="server" text="Show PlaceHolder" 
        onclick="Button2_Click" />
    </div>
    </form>
  
</body>
</html>

