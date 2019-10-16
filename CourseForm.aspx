<%@ Page Language="C#" MasterPageFile ="~/MasterPage.master" AutoEventWireup="true" CodeFile="CourseForm.aspx.cs" Inherits="CourseForm" %>

<asp:Content ID="cnt3" ContentPlaceHolderID="Main" runat="server" >


<script type="text/javascript">


    function funValidate() {


        var ErrStr = "Enter the following fields \n";

        var chkflg = true;

        if (document.getElementById("<%=txtName.ClientID %>").value == "") {

            ErrStr = ErrStr + "Name \n";
            chkflg = false;

        }

        if (document.getElementById("<%=TxtCode.ClientID %>").value == "") {

            ErrStr = ErrStr + "Code \n";
            chkflg = false;

        }

        if (document.getElementById("<%=TxtDuration.ClientID %>").value == "") {

            ErrStr = ErrStr + "Duration \n";
            chkflg = false;

        }

        if (document.getElementById("<%=TxtMaxsize.ClientID %>").value == "") {

            ErrStr = ErrStr + "Max size \n";
            chkflg = false;

        }

        if (document.getElementById("<%=TxtMinSize.ClientID %>").value == "") {

            ErrStr = ErrStr + "Min size \n";
            chkflg = false;

        }

//         if (document.getElementById("<%=LstAssignedLocation.ClientID %>").value == "") {

//            ErrStr = ErrStr + "Location\n";
//            chkflg = false;

//        }



        if (document.getElementById("<%=TxtDuration.ClientID %>").value != "") {

            var strText = document.getElementById("<%=TxtDuration.ClientID %>").value;

            if ((strText.indexOf('.') > -1) || (strText.indexOf('-') > -1)) {

                ErrStr = "Enter Positive value for Duration";
                chkflg = false;

            }

        }


        if (chkflg) {
            return true;

        }
        else {
            alert(ErrStr);
            return false;

        }
 

   }

  function AddLocation() {


      var locid = document.getElementById("<%=LstApprovedLocation.ClientID %>").value;
      var locName = document.getElementById("<%=LstApprovedLocation.ClientID %>").options[document.getElementById("<%=LstApprovedLocation.ClientID %>").selectedIndex].text;
      document.getElementById("<%=hidSelectedLoc.ClientID %>").value = locid +"~"+ locName;


    
  }

  function AddInstructor() {

      var InsId = document.getElementById("<%=DrpApprovedInstructors.ClientID %>").value;
      var InsName= document.getElementById("<%=DrpApprovedInstructors.ClientID %>").options[document.getElementById("<%=DrpApprovedInstructors.ClientID %>").selectedIndex].text;
      document.getElementById("<%=hidSelectInc.ClientID %>").value = InsId + "~" + InsName;


   }



   function RemoveInstructor() {




       var elem = document.getElementById('aspnetForm').elements;

       var InsRemoved = "";

      // alert("coming");
       for (var i = 0; i<=elem.length; i++) {
           if (elem[i].type == "checkbox") {

//               if (elem[i].checked == false) {

//                   InsRemoved = InsRemoved + "~" + elem[i].value;
//               }
           }

       }

       document.getElementById("<%=HidInsUnChecked.ClientID %>").value = InsRemoved;

       alert(document.getElementById("<%=HidInsUnChecked.ClientID %>").value);
       
   }


 


</script> 



<table style="width:100%">

  <tr>
  <td><asp:Label ID="lbl1" runat="server" Text="Course" CssClass = "cssHeaderTitle1" Font-Bold="true"></asp:Label></td>
  </tr>
  <tr>
  <td align="right">
     <asp:Button ID="btnSave" CausesValidation ="TRUE" runat="server" Text="Save"  OnClientClick="return funValidate()" OnClick="btnSave_Click" CssClass="CssButton" /> &nbsp;
     <asp:Button ID="BtnBack" runat="server" Text="Back" CssClass="CssButton" OnClick="BtnBack_Click" />&nbsp;
     <asp:Button ID="BtnReset" runat="server" Text="Reset" CssClass="CssButton" OnClick="BtnReset_Click" />&nbsp;
  
  </td>
  </tr>

</table>
<br />
<br />

<!---Main Table-->
<table style="background-color: #FFDD99; width:100%"  >

    <tr>
    <td align="right"><asp:Label id="lbl2" Text="Name:" CssClass="cssLabel" runat="server"></asp:Label></td>
    <td align="left" ><asp:TextBox ID="txtName" runat="server" CssClass ="cssTextbox"></asp:TextBox></td>
    <td align="right" ><asp:Label id="Label1" Text="Code:"  CssClass="cssLabel" runat="server"></asp:Label></td>
    <td align="left" ><asp:TextBox ID="TxtCode" runat="server" CssClass ="cssTextbox"></asp:TextBox></td>
    </tr>
    
   <tr>
    <td align="right" style="height: 26px" ><asp:Label id="Label2" Text="Status:" CssClass="cssLabel" runat="server"></asp:Label></td>
    <td align="left" style="height: 26px" ><asp:DropDownList ID="DrpStatus" runat="server" CssClass ="CssDropdown">
                      <asp:ListItem>All</asp:ListItem>
                     <asp:ListItem>Active</asp:ListItem>
                      <asp:ListItem>InActive</asp:ListItem>
                     </asp:DropDownList></td>
    <td align="right" style="height: 26px" ><asp:Label id="Label3" Text="Duration:"  CssClass="cssLabel" runat="server"></asp:Label></td>
    <td align="left" style="height: 26px" ><asp:TextBox ID="TxtDuration" runat="server" CssClass ="cssTextbox"></asp:TextBox>
    <asp:RegularExpressionValidator ID="rrv" runat="server" ControlToValidate="TxtDuration" ValidationExpression="\d+" ErrorMessage="Enter only numbers" ></asp:RegularExpressionValidator></td>
    </tr>
    
    
    <tr>
    <td align="right" ><asp:Label id="Label4" Text="Maximun Size:" CssClass="cssLabel" runat="server"></asp:Label></td>
    <td align="left" ><asp:TextBox ID="TxtMaxsize" runat="server" CssClass ="cssTextbox"></asp:TextBox></td>
    <td align="right"><asp:Label id="Label5" Text="Minimum Size:"  CssClass="cssLabel" runat="server"></asp:Label></td>
    <td align="left" ><asp:TextBox ID="TxtMinSize" runat="server" CssClass ="cssTextbox"></asp:TextBox></td>
    </tr>
    
    
     <tr>
        <td align="right" ><asp:Label id="Label7" Text="Approved Locations" runat="server" CssClass="csslabel"></asp:Label> </td>
        <td align="left"  ><asp:Label id="Label9" Text="Approved Locations" runat="server" CssClass="csslabel"></asp:Label><br />
         <asp:ListBox ID="LstApprovedLocation"  width="160px" Height="100pt" runat="server">
          
         
          </asp:ListBox></td>
        <td align="left"  ><asp:LinkButton ID="LnkBtnAddLocation"  runat="server" OnClientClick="return AddLocation()" OnClick="LnkBtnAddLocation_Click">Add >></asp:LinkButton><br />
        <asp:LinkButton ID="LnkBtnRemoveLocation"  runat="server"  OnClick="LnkBtnRemoveLocation_Click" Height="12px" Width="91px"><< Remove </asp:LinkButton></td>
        
        <td align="left" ><asp:Label id="Label8" Text="Assigned Locations" runat="server" CssClass="csslabel"></asp:Label><br />
        <asp:ListBox ID="LstAssignedLocation" Height="100pt" width="160px" runat="server"> </asp:ListBox>
    
     </td>
     </tr>
    
    
    <tr>
        <td align="right" ><asp:Label id="ll" Text="Approved Instructors" runat="server" CssClass="csslabel"></asp:Label> </td>
        <td align="left"  ><asp:DropDownList ID="DrpApprovedInstructors" runat="server"> </asp:DropDownList></td>
        <td align="left"  ><asp:LinkButton ID="btnAddInstructor"  runat="server"  OnClick="btnAddInstructor_Click1" OnClientClick="return AddInstructor()">Add >></asp:LinkButton><br />
        <asp:LinkButton ID="btnRemoveInstructor"  runat="server" OnClientClick="return RemoveInstructor()" OnClick="btnRemoveInstructor_Click" Height="12px" Width="91px"><< Remove </asp:LinkButton></td>
        
        <td align="left" ><asp:Label id="Label6" Text="Assigned Instructors" runat="server" CssClass="csslabel"></asp:Label>
       <asp:GridView ID="grdAssignedIns" runat="server" AutoGenerateColumns="false"  BackColor="White" BorderColor="Black" BorderWidth="1px" CellPadding="1"
                    Font-Names="Verdana" HorizontalAlign="Left"  width="120px" Height="10px" > 
                     <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
          
          
           <Columns>
            <asp:TemplateField HeaderText="Action">
            <ItemTemplate><input type="checkbox" name="chkasslovation" value='<%# Eval("Instructorpk") %>' /> </ItemTemplate>
            </asp:TemplateField>
           
            <asp:BoundField HeaderText="Name" DataField="InstructorName" HtmlEncode="false" />
            
            
           </Columns>
          
          
          </asp:GridView>
        
        
        </td>
       
    </tr>
    
   
     
     <tr>
    <td>
        
     <asp:HiddenField ID="hidSelectedLoc" runat="server" />
     <asp:HiddenField ID="hidSelectInc" runat="server" />
      <asp:HiddenField ID="HidInsUnChecked" runat="server" />

        
    
    </td>   
    </tr>
   
 
</table>
</asp:Content>

