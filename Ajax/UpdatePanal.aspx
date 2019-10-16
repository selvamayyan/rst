
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdatePanal.aspx.cs" Inherits="Ajax_UpdatePanal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <asp:ScriptManager ID="scpmr1" runat="server"></asp:ScriptManager>
    
    <br />

  
        
      <%--  
        <asp:DropDownList ID="DrpUser" runat="server" 
            onselectedindexchanged="DrpUser_SelectedIndexChanged" AutoPostBack="true">

        </asp:DropDownList>--%>


         <%-- <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
         onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
         BackColor="#FFFFCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px">

         <asp:ListItem Value="~/common/image/bottomBanner.jpg" >
            AJAX in Action
         </asp:ListItem>

         <asp:ListItem Value="~/common/image/topBanner_short_left.jpg">
            AJAX Bible
         </asp:ListItem>

         <asp:ListItem Value="~/common/image/topBanner_short_right.jpg">
            Understanding AJAX
         </asp:ListItem>

      </asp:RadioButtonList>
      <br />
      <asp:Label ID="Label1" runat="server" Font-Size="14pt">AJAX in Action</asp:Label>
      <br />
      <br />
      <asp:Image ID="Image1" runat="server" ImageUrl="~/common/image/topBanner_short_right.jpg" />
--%>
    

   <asp:GridView ID="GdvInstructor" runat="server">
      </asp:GridView>
  
    <asp:UpdatePanel ID="updatepanel1" runat="server">
    <ContentTemplate>

    
        <asp:DropDownList ID="DrpUser" runat="server" 
            onselectedindexchanged="DrpUser_SelectedIndexChanged" AutoPostBack="true">

        </asp:DropDownList>
    
    </ContentTemplate>
    
    <%--<Triggers>
    <asp:AsyncPostBackTrigger ControlID="DrpUser" EventName="SelectedIndexChanged" />
   
   </Triggers>
     --%>
      
    
    </asp:UpdatePanel>
    
    </div>
    
    </form>
</body>
</html>
