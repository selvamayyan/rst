<%@ Page Language="C#" AutoEventWireup="true" smartnavigation="true"  CodeFile="bestfitLocation.aspx.cs" Inherits="bestfitLocation" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    
    
    <script type="text/javascript">


        window.onload = function () {

            var selLoc = document.getElementById('<%=hidSelectedLocation.ClientID %>').value;

            if (selLoc != "") {
                var ArrselLoc = selLoc.split('~');

                var elem = document.getElementById("Form1").elements;

              //  alert("coming");


                for (var i =0; i < elem.length; i++) {


                    if (elem[i].type == 'checkbox') {

                        for (var j = 0; j < ArrselLoc.length; j++) {

                            if (elem[i].value == ArrselLoc[j]) {
                                elem[i].checked = true;
                            }
                        }


                    }

                   

             }


            
            }

        }



        function passValueToParentWindow()
         {
            var elem = document.getElementById("Form1").elements;
            var selLoc = "";

            for (var i = 0; i < elem.length; i++) {
                if (elem[i].type == 'checkbox') {

                    if (elem[i].checked) {

                        selLoc = selLoc + elem[i].value + "~";
                   }
                }
            }

           // alert(selLoc);
            top.returnValue = selLoc;
            window.close();
        }

        
    
    </script>
</head>






<body>
    <form id="Form1" runat="server"   >
   <table id="MainTable" style="width:850px" >
        <tr>
        
                <td style="height: 1px; ">
                <asp:Label ID="lblHeading" CssClass="clsPageHeading" runat="server" Text="Best Fit-Location"></asp:Label></td>

        </tr>
      
    </table>    
    <table>
    
        <tr>
          <td style=""   >
            <table>
            
                 <tr>
                    <td colspan="8" style="background-color: white;height:15px;">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width:12.5%">
                        <asp:Label ID="Label7" runat="server" Text="Facility:" CssClass="clsLabelBold"></asp:Label>
                    </td>
                    <td align="left" style="width:12.5%">
                        <asp:DropDownList ID="ddlFacility" runat="server" CssClass="clsDropdownlist" >
                        </asp:DropDownList>
                    </td>
                    <td align="right" style="width:12.5%">
                        <asp:Label ID="Label8" runat="server" Text="Active?:" CssClass="clsLabelBold"></asp:Label>
                    </td>
                    <td align="left" style="width:12.5%" >
                        <asp:DropDownList ID="ddlActive" runat="server" CssClass="clsDropdownlist" >
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem Selected="True">Active </asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td  align="right" style="width:12.5%;white-space:nowrap" >
                        <asp:Label ID="Label9" runat="server" Text="Capacity at Least:" CssClass="clsLabelBold"></asp:Label>
                    </td>
                    <td  align="left" style="width:12.5%">
                        <asp:TextBox ID="txtCapacityAtLeast" runat="server" CssClass="clsTextBox" MaxLength="9"></asp:TextBox>
                    </td>
                    <td style="width:12.5%">
                    </td>
                    <td align="left" style="width:12.5%">
                        
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width:12.5%" >
                        <asp:Label ID="Label10" runat="server" Text="Location:" CssClass="clsLabelBold"></asp:Label>
                    </td>
                    <td align="left" style="width:12.5%">
                        <asp:DropDownList ID="ddlLocation" runat="server" CssClass="clsDropdownlist" >
                        </asp:DropDownList>
                    </td>

                    <td align="right" style="width:12.5%" >
                        <asp:Label ID="Label11" runat="server" Text="Type:" CssClass="clsLabelBold"></asp:Label>
                    </td>
                    <td  align="left" style="width:12.5%" >
                        <asp:DropDownList ID="ddlType" runat="server" CssClass="clsDropdownlist" >
                        </asp:DropDownList>
                    </td>
                    
                     <td align="right" style="width:12.5%" >
                        <asp:Label ID="Label3" runat="server" Text="Course Approved:" CssClass="clsLabelBold"></asp:Label>
                    
                    
                    </td>
                    
                    <td align="left" style="width:12.5%">
                     
                        <asp:DropDownList ID="ddlCourseApproved" runat="server" CssClass="clsDropdownlist">
                         <asp:ListItem>All</asp:ListItem>
                         <asp:ListItem Selected="True">Yes</asp:ListItem>
                         <asp:ListItem>No</asp:ListItem>                         
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                   <td align="left">
                   <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="clsButton" OnClientClick="FillSelectedRecords()" OnClick="btnSearch_Click" />
                   </td>                
                   <td colspan="7" align="right" >
                       <asp:Label ID="Label1" runat="server" Text="Export to Excel:" CssClass="clsLabelBold"></asp:Label>
                       <asp:ImageButton ID="ExportToExcel" runat="server" ImageUrl="~/Common/Image/icon_excel.gif" OnClick="ExportToExcel_Click" />
                   </td>
               </tr>  
           </table>
          </td>
        </tr>
        <tr >
                      <td  align="left" colspan="8">
                           &nbsp;<asp:Button ID="Button1" runat="server" CssClass="clsButton" OnClientClick="return passValueToParentWindow()" Text="OK" OnClick="Button1_Click" />
                          
                      </td>
        </tr>   
        <%---- Grid View ----%><tr>
           <td style=" height: 233px;">
                   <table >
                    <tr>
                     <td style="" >
                        <asp:GridView ID="grdbestfitLoc" runat="server" 
                                AutoGenerateColumns="False" BackColor="White"
                                BorderColor="Black"  
                                BorderWidth="1px" CellPadding="4" Font-Names="Arial" >
                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                <Columns>
                                
                                    <asp:TemplateField>
                                        <HeaderTemplate>Action</HeaderTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>                         
                                                              
                          <input name="chkLocationPK" type="checkbox"  value='<%# Eval("Location") %>'  />                                                    
                                        </ItemTemplate>
                                   </asp:TemplateField>
                                   
                                   <asp:TemplateField>
                                   <HeaderTemplate>Rank</HeaderTemplate>
                                       <ItemTemplate >
                                             <%# Container.DataItemIndex+1 %>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                  <%-- <asp:BoundField DataField="----------" HeaderText="Rank" />--%>
                                  
                                  
                                   <asp:BoundField DataField="LocationName" HeaderText="Name" />                                   
                                   <asp:BoundField DataField="CourseApproved" HeaderText="Course Approved" >
                                   <HeaderStyle HorizontalAlign="Center" Width="10%" Wrap="true" Font-Bold="true"  />
                                   </asp:BoundField>
                                   
                                   <asp:BoundField DataField="Active?" HeaderText="Active?" />
                                   <asp:BoundField DataField="FacilityName" HeaderText="Facility" />
                                  
                                   <asp:BoundField DataField="MaxCapacity" HeaderText="Capacity" />
                                   
                                   <asp:BoundField DataField="State/Country" HeaderText="State/Country" />
                                </Columns>
                              <RowStyle BackColor="White" ForeColor="Black" Font-Size="Smaller" />
                              <SelectedRowStyle BackColor="#E0E0E0" 
                                      Font-Bold="True" ForeColor="Black" BorderColor="Gray" HorizontalAlign="Left" />
                              <PagerStyle BackColor="#FFFFCC" 
                                      ForeColor="#330099" HorizontalAlign="Center" />
                              <HeaderStyle BackColor="WhiteSmoke" CssClass="clsLabelBold" Font-Underline="False" ForeColor="Black" HorizontalAlign="Center" Wrap="False"  />
                              </asp:GridView>
                      </td>
                   </tr>
                   
               </table>
              </td>
          </tr>
          <tr >
                      <td  align="left" colspan="8" style="height: 26px">
                           &nbsp<asp:Button ID="btnOK" runat="server" CssClass="clsButton" OnClientClick="return passValueToParentWindow()" Text="OK" OnClick="btnOK_Click" />   
                      </td>
          </tr>   
          
        
    </table>



    <asp:HiddenField ID="txtLocationID" runat="server" />  
    <asp:HiddenField ID="hidSelectedLocation" runat="server" />
    <%---- Multiple Location-Selvam ----%>
 

</form>
</body>
</html>
