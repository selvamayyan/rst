<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="ContentToMaster.aspx.cs" Inherits="_3Tier_MasterpageRetrival" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="cnt3" runat="server" ContentPlaceHolderID ="Main">

    <asp:TextBox ID="TxtContent" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />

</asp:Content>

