<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="SessionList.aspx.cs" Inherits="SessionList" %>
<asp:Content ID="cnt1" runat="server" ContentPlaceHolderID="Main">


<script type="text/javascript">

    function funRedirectManagementPage(Mode) {

        if (Mode == 'Add') {
          location.href = "SessionManagement.aspx?mode=add";
          return false;


      }
      else if (Mode == 'Edit')
       {

          var sessid = "";
          var elem = document.getElementById('aspnetForm').elements;
          var chkflg=false;

          for (var i = 0; i < elem.length; i++)
           {


              if (elem[i].type == "radio")
              {

              if (elem[i].checked)
                {
                 sessid= elem[i].value;
                 chkflg = true;
                }

              }

        }


         if (chkflg) {


             location.herf = "SessionManagement.aspx?mode=add&sessionId=" + sessid;
             return false;
        }
         else
         
          {

              alert("Select Session to Edit");
              return true; 

          }


      }






    }

 </script>

<div><table id="MainTable1" width="100%" >
        <tr>
            <td>
                <asp:Label ID="Label1" CssClass="clsPageHeading" runat="server" Text="Session Management"></asp:Label>
            </td>

        </tr>
       <tr>
<td colspan="8" style="background-color: white; height: 15px;"></td>

</tr>
        
        <tr>
            <td colspan="2" width="700px">
            <table width="700px" border="0" cellpadding="0" cellspacing="0">
            <!--________________________________________SEARCH _______________________-->
                <tr>
                    <td align="right" >
                        <asp:Label ID="lblScheduler" EnableViewState="true" runat="server" Text="Scheduler:" CssClass="clsLabelBold"></asp:Label>
                        </td>
                    <td align="left" >
                        &nbsp;<asp:DropDownList ID="drpScheduler" runat="server"  CssClass="clsDropdownlist" >
                        </asp:DropDownList>
                        </td>
                   
                    
                    <td align="right" >
                        <asp:Label ID="txtName" runat="server" Text="Name:" CssClass="clsLabelBold"></asp:Label>
                    </td>
                    <td align="left" >
                        &nbsp;<asp:DropDownList ID="drpSessionName" runat="server" Width="228px"></asp:DropDownList>  
                    </td>
                    <td align="right" style="white-space:nowrap" >
                        <span id="lblLearningActivity"  runat="server"    class="clsLabelBold">Learning Activities:</span>
                    </td>
                    <td align="left" >
                        <asp:CheckBox ID="chkLearningActivity" Checked="true" runat="server" />
                    </td>
                    
                   
                </tr>
                 <tr>
                    <td align="right" >
                        <asp:Label ID="lblLanguage" runat="server" Text="Language:" CssClass="clsLabelBold"></asp:Label>
                    </td>
                    <td align="left" >
                        &nbsp;<asp:DropDownList ID="drpLanguage" runat="server" CssClass="clsDropdownlist">
                        </asp:DropDownList>
                    </td>
                     <td align="right" style="white-space:nowrap"  >
                        <span id="lblActivityCode" runat="server"  class="clsLabelBold">Activity Code:</span>
                    </td>
                    <td align="left" >
                        &nbsp;<asp:DropDownList ID="drpActivityCode" runat="server" CssClass="clsTextBox" Width="228px"></asp:DropDownList>  
                    </td>
                    <td align="right" >
                        <asp:Label ID="lblOutOfOffice"   runat="server" Text="Off Platform:" CssClass="clsLabelBold"></asp:Label>  
                    </td>
                    <td align="left" >
                      <asp:CheckBox ID="chkOutOfOffice"  Checked="true" runat="server" />
                    </td>
                   
                  
                </tr>
                <tr>
                <td align="right">
                     <asp:Label ID="lblStatus" runat="server" Text="Status:" CssClass="clsLabelBold"></asp:Label>
                </td>
                <td> <!--Kaustav-- changed default value in session status to Draft-->
                     &nbsp;<asp:DropDownList ID="drpStatus" runat="server" 
                        CssClass="clsDropdownlist" 
                        onselectedindexchanged="drpStatus_SelectedIndexChanged"   >
                        <asp:ListItem Text="All" Value="0"></asp:ListItem>
                        <asp:ListItem  Value="Draft" Text="Draft"></asp:ListItem>
                        <asp:ListItem Text="Ready for Production" Value="Ready for Production"></asp:ListItem>
                        <asp:ListItem Text="Production" Value="Production"></asp:ListItem>
                        <asp:ListItem Text="Draft Revised" Value="Draft Revised"></asp:ListItem>
                       </asp:DropDownList>
                </td>
                <td align="right">
                 <asp:Label ID="lblActive" runat="server" Text="Active?:" CssClass="clsLabelBold"></asp:Label>
                </td>
                <td>
                        &nbsp;<asp:DropDownList ID="drpActive" runat="server" CssClass="clsDropdownlist" OnSelectedIndexChanged="drpActive_SelectedIndexChanged" >
                        <asp:ListItem Text="All" Value="0"></asp:ListItem>
                        <asp:ListItem Value="Active" Text="Active"/>
                        <asp:ListItem Value="Inactive" Text="Inactive"/>
                        <asp:ListItem Value="Cancelled" Text="Cancelled"/>
                        </asp:DropDownList>
                </td>
                <td colspan="2" align="right">
                
                </td>
                </tr>
                <!--________________________________________     SEARCH          _______________________-->   
                <tr>
                <td colspan="9" align="right">
                
                </td>
                
                </tr>
                
</table></td></tr> 

 <tr>
<td colspan="8" align="left"><asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="clsBigButton" OnClick="btnSearch_Click" /></td>

</tr>

<tr>
<td colspan="8" style="height:3px" ></td>

</tr>
              <tr>
            <td colspan="2"  width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
<!--________________________________________  Redirection Button _______________________-->   
                       <td align="left" colspan="7" style="height: 39px">
                           <asp:Button ID="btnAddnewSession" runat="server" Text="Add New Session" CssClass="clsBigButton" OnClientClick="javascript:return funRedirectManagementPage('Add')" OnClick="btnAddnewSession_Click"/> 
                           <asp:Button ID="btnEditSession"  runat="server" Text="Edit Session" CssClass="clsBigButton" OnClientClick="javascript:return funRedirectManagementPage('Edit')" OnClick="btnEditSession_Click"/>
                            <asp:Button ID="btnCopySession" runat="server" Text="Copy Session" CssClass="clsBigButton" OnClientClick="javascript:return funRedirectManagementPage('Copy')" OnClick="btnCopySession_Click"/>
                            <asp:Button id="btnRemoveSession" runat="server" text="Remove Session" CssClass="clsBigButton" OnClientClick="javascript:return funRemoveSession()" OnClick="btnRemoveSession_Click"/>
                       
                       </td>
                       <td align="right" style="height: 39px"><!--OnClientClick="javascript:window.open('Del_SessionListExportToExcel.aspx')"--><asp:Label ID="lblExportToExcel" runat="server" Text=" Export to Excel" CssClass="clsLabelBold"/>
                           <asp:ImageButton ID="ExportToExcel"  ImageUrl="~/Common/Image/icon_excel.gif"  runat="server" OnClick="ExportToExcel_Click"  />
                       </td>
<!--________________________________________  Redirection Button _______________________-->                          
               </tr>
               <tr>
<!--________________________________________  GRID VIEW _______________________-->              
               <td colspan="11"><!--OnRowCreated="grdSessionList_RowCreated"-->
               <asp:GridView ID="dgvSessionList" runat="server" AllowSorting="true" PagerSettings-Mode="NumericFirstLast" 
                OnSorting="grdSessionList_Sorting" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="Black"  BorderWidth="1px" CellPadding="1"
                    Font-Names="Arial" HorizontalAlign="Left"  Width="100%" AllowPaging="True" OnPageIndexChanging="dgvSessionList_PageIndexChanging" PageSize="10">
                     <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                     <Columns>
                     <asp:TemplateField HeaderText="Action">
                     <ItemTemplate>
                              <input id="Radio1" name="rdSessionPK" type="radio" value='<% #Eval("Sessionpk") %>' runat="server" />
                     </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                                              
                           <asp:HyperLinkField DataNavigateUrlFields="SessionPK" DataNavigateUrlFormatString="SessionManagement.aspx?mode=Edit&sessionID={0}&callerPage=SessionList"
                           SortExpression="SessionName" DataTextField="SessionName"   HeaderText="Name" />

                        <asp:BoundField DataField="ActivityCode" HeaderText="Activity Code" SortExpression="ActivityCode" HtmlEncode="false" HeaderStyle-Wrap="false">
                        </asp:BoundField>
                        <%--<asp:BoundField DataField="LocationName" HeaderText="Location" SortExpression="LocationName" HtmlEncode="false" HeaderStyle-Wrap="false">
                        </asp:BoundField>--%>
                        <asp:BoundField DataField="ScheduledStartDate" DataFormatString="{0:d}" HeaderText="Start Date" SortExpression="ScheduledStartDate" HtmlEncode="false" HeaderStyle-Wrap="false">
                        </asp:BoundField>
                        <asp:BoundField DataField="SystemStatus" HeaderText="Status" SortExpression="SystemStatus" HtmlEncode="false" HeaderStyle-Wrap="false">
                           
                        </asp:BoundField>
                        <asp:BoundField DataField="SessionStatus" HeaderText="Active?" SortExpression="SessionStatus" HtmlEncode="false" HeaderStyle-Wrap="false" > 
                           
                        </asp:BoundField>
                        
                    </Columns>
                    <RowStyle BackColor="White" Font-Size="Smaller" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#E0E0E0" BorderColor="Gray" Font-Bold="True" ForeColor="Black"
                        HorizontalAlign="Left" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="Black" Font-Size="Smaller" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="WhiteSmoke" CssClass="clsLabelBold" Font-Underline="False" ForeColor="Black" HorizontalAlign="Center" Wrap="False"  />
                   <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
               </asp:GridView>
               
               </td>
               
<!--________________________________________  GRID VIEW _______________________-->                
               </tr>
               <tr>
                    <td align="right" colspan="11">
                     <asp:Label id="lblNorows" CssClass="clsLabelBold" runat="server">  </asp:Label>
                    </td>
                </tr>
               <tr>
<!--________________________________________  Redirection Button _______________________-->   
                       <td align="left" colspan="7">
                           <asp:Button ID="btnAddnewSession1" runat="server" Text="Add New Session" CssClass="clsBigButton" OnClientClick="javascript:return funRedirectManagementPage('Add')"/> 
                           <asp:Button ID="btnEditSession1"  runat="server" Text="Edit Session" CssClass="clsBigButton" OnClientClick="javascript:return funRedirectManagementPage('Edit')"/>
                            <asp:Button ID="btnCopySession1" runat="server" Text="Copy Session" CssClass="clsBigButton" OnClientClick="javascript:return funRedirectManagementPage('Copy')"/>
                            <asp:Button id="btnRemoveSession1" runat="server" text="Remove Session" CssClass="clsBigButton" OnClientClick="javascript:return funRemoveSession()"/>
                       
                       </td>
                       <td align="right">
                          <asp:Button id="BtnExportforLMS" runat="server" text="Export for LMS" CssClass="clsBigButton" OnClientClick="javascript:return funValidate();" OnClick="BtnExportforLMS_Click"/>
                          <asp:DataGrid ID="DataGrid1" runat="server"></asp:DataGrid>
                       </td>
                       
<!--________________________________________  Redirection Button _______________________-->                          
               </tr>
               </table>
             
              
                
           </td>
        </tr>
        
    </table>
</div>

</asp:Content>
