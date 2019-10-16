<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeForm.aspx.cs" Inherits="_3Tier_EmployeeForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family:Arial">
    
    <table>
      <tr>
         <td>
          Name:&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </td>
      </tr>

      <tr>
         <td>
          Gender:&nbsp;<asp:DropDownList ID="drpGender" runat="server">
          <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
          <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
         </asp:DropDownList>
        </td>
      </tr>

        <tr>
         <td>
         City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TxtCity" runat="server"></asp:TextBox>
        </td>
      </tr>

      
    </table>
        
    </div>

    <br />

       <asp:Button ID="BtnInsert" runat="server" Text="Insert" 
        onclick="BtnInsert_Click" />

    <div>
    
    <asp:GridView ID="GrdEmployee" runat="server">
        </asp:GridView>
       
    </div>

    </form>
</body>
</html>
