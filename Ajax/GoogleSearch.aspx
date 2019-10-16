<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoogleSearch.aspx.cs" Inherits="Ajax_GoogleSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

  <script type="text/javascript">
    function chngtxtbxval()
    {
        var t1 = document.getElementById("TxtSearch").value;
        var t2 = document.getElementById("LstItems");
      t2.value=t1;

    }
    </script>
   
</head>



<body>
    <form id="form1" runat="server">
    <div>

     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

   <asp:TextBox ID="TxtSearch" runat="server" AutoPostBack="true" 
        ontextchanged="TxtSearch_TextChanged" width="250px"></asp:TextBox><br />

    <asp:updatepanel ID="myUpdatePanel" runat="server">
    <ContentTemplate>
       
          
      <asp:ListBox id="LstItems" width="250px" runat="server"></asp:ListBox>
              
    </ContentTemplate>

    <Triggers>
      <asp:AsyncPostBackTrigger ControlID="TxtSearch" EventName="TextChanged" />
    </Triggers>
        
    </asp:updatepanel>
    
    </div>


   
     
  
    </form>
</body>
</html>
