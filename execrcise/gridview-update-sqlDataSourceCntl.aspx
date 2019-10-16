<%@ Page Language="C#"  AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="gridview-update-sqlDataSourceCntl.aspx.cs" Inherits="execrcise_gridview_update_sqlDataSourceCntl" %>


<asp:Content ID="cnt2" ContentPlaceHolderID="Main" runat="server" >
<b> gridview-update using sqlDataSourceCntl...  </b>

<asp:SqlDataSource ID="Mydatasource" runat="server" 
ConnectionString="data source=admin-pc;initial catalog=Del_Scheduling_Tool; integrated security=SSPI" 
SelectCommand="Select * from Del_User" 
UpdateCommand="Update Del_User set lastName=@LastName,FirstName=@FirstName where UserPk=@UserPk">

</asp:SqlDataSource>

    <asp:DropDownList ID="DropDownList1" runat="server" >
    </asp:DropDownList>


<asp:GridView id="grd1" DataSourceID ="Mydatasource" runat="server" >
    
  <Columns>
     <asp:CommandField ShowEditButton="true" />
  </Columns>

  
</asp:GridView>
</asp:Content>