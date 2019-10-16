<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DropdownSelect-SqldataSrc.aspx.cs" Inherits="execrcise_DropdownSelect_SqldataSrc" %>

<asp:Content id="cnt5" ContentPlaceHolderID="Main" runat="server">
<br />
<br />
<asp:DropDownList ID="drpCheckList" DataSourceID="mydatasource" AutoPostBack="true" DataValueField ="sessionpk" DataTextField="SessionName" runat="server">
</asp:DropDownList>

<asp:SqlDataSource ID="mydatasource" runat="server" 
ConnectionString="data source=admin-pc;initial catalog=Del_Scheduling_Tool; integrated security=SSPI"
SelectCommand="select top 100 SessionPk, SessionName from Del_Session"   >
</asp:SqlDataSource>  

<asp:GridView ID="grdSession" DataSourceID="mySession" runat="server">
</asp:GridView>


<asp:SqlDataSource ID= "mySession" 
ConnectionString="data source=admin-pc;initial catalog=Del_Scheduling_Tool; integrated security=SSPI"
SelectCommand="Select * from Del_Session where Sessionpk=@Sessionpk " runat="server">

    
    
<SelectParameters  >
    
<asp:ControlParameter ControlID="drpCheckList" Name="sessionpk" />

</SelectParameters>

</asp:SqlDataSource>   



</asp:Content>