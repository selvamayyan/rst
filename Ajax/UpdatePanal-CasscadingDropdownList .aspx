<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdatePanal-CasscadingDropdownList .aspx.cs" Inherits="Ajax_UpdatePanal_CasscadingDropdownList_" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

   <asp:ScriptManager ID="sptmgr" runat="server" >
   </asp:ScriptManager>   

   <asp:UpdatePanel ID="casdrpdown" runat="server">
   
     <ContentTemplate>
     
      City:   <asp:DropDownList ID="DrpCity" runat="server" AutoPostBack="true" 
             onselectedindexchanged="DrpCity_SelectedIndexChanged">
         </asp:DropDownList>
       <br />
       <br />
     
     College: <asp:DropDownList ID="DrpCollege" runat="server">
         </asp:DropDownList>
     </ContentTemplate>
   
   
   </asp:UpdatePanel>

    
    </div>
    </form>
</body>
</html>
