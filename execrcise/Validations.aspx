

<%@ Page Language="C#" AutoEventWireup="true" EnableViewStateMac="true" CodeFile="Validations.aspx.cs" Inherits="execrcise_Validations"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

   <asp:textbox ID="Textbox1" runat="server" ></asp:textbox>
   <asp:RegularExpressionValidator ID="rgV" runat="server"
    ErrorMessage="Numbers only Allowed" ControlToValidate="Textbox1"
    ValidationExpression="^\d+" ></asp:RegularExpressionValidator ><br />
            

<asp:DropDownList id="drplist" runat="server"  AutoPostBack="true"  > 
<asp:ListItem>Madurai</asp:ListItem>
<asp:ListItem>Salem</asp:ListItem>
<asp:ListItem>Chennai</asp:ListItem>
<asp:ListItem Selected="True">All</asp:ListItem>
</asp:DropDownList>

<asp:RequiredFieldValidator ID="rqv" runat="server" ErrorMessage="select values"
ControlToValidate="drplist" InitialValue="All"></asp:RequiredFieldValidator ><br />

<%--<asp:textbox ID=Txtbox2" runat="server" ></asp:textbox>--%>
<%--<asp:CustomValidator ID="csV" runat="server" ControlToValidate="Textbox2"
 ErrorMessage="Allowed only Numbers" onservervalidate="csV_ServerValidate" ClientValidationFunction="funValidateNumbersOnly">
</asp:CustomValidator>--%>
<br />

  <asp:button ID="Button1"  runat="server" text="Button" />
    
    </div>
    </form>
</body>
</html>
