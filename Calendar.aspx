<%--<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"  AutoEventWireup="true" CodeFile="Calendar.aspx.cs" Inherits="Calendar" %>
<%@register Assembly ="Mediachase.Web.UI.WebControls" Namespace ="Mediachase.Web.UI.WebControls" TagPrefix="mcwc" %>


<asp:Content ID="cnt1" runat="server" ContentPlaceHolderID ="Main">


 <!-- PIM GEL011206 - Add EnableEventValidation="false" to the Page directive-->
<table id="MainTable" cellpadding="0" cellspacing="0"  width="810">
<tr>
  <td style="width: 804px">
   <table id="MainTable1" width="100%" >
    <tr>
       <td style="width:60%">
           <asp:Label ID="LblClientName" CssClass="clsPageHeading" runat="server" Text="Client name from DB"></asp:Label>
       </td>
       <td align="left">
         <!--  <asp:Label ID="LblPageilters" CssClass="clsLabelBold" runat="server" Text="PAGE FILTERS"></asp:Label>-->
       </td>
    </tr>
        <tr>
       <td colspan="2" style="background-color: white; height: 15px;"></td>

     </tr>
    </table>
 </td>   
 </tr>   
  
 <tr>
 <td align="left" style="width: 804px" >   
    <table cellpadding="0" cellspacing="0"width="100%">
    <tr>
        
         <td style="width:100%" align="left">
            <table width="100%" >
                <tr>
                    <td style="width:14%" align="right" >
                        <asp:Label ID="Label15" runat="server" Text="Year: " CssClass="clsLabelBold" width="60"></asp:Label>
                    </td>
                    <td style="width:20%"align="left" >
                        <asp:DropDownList ID="DdlYear"  runat="server"   >
                        </asp:DropDownList>
                    </td>
                    <td style="width:12%"align="right">
                        <asp:Label ID="Label3" runat="server" Text="Session Name:" CssClass="clsLabelBold" ></asp:Label>

                    </td>
                    
                    <td style="width:49%"align="left" >
                        <asp:DropDownList ID="DdlSession" runat="server"  CssClass="clsDropdownlist" Width="235px" >
                        </asp:DropDownList>
                    </td>
                                                                 
                  
                </tr>
              </table>  
           </td>    
     </tr>
    
    <!--Row over-->
    <tr>
        <td style="width:100%">
            <table width="100%">
                <tr>
                    <td style="width:14%" align="right" >
                        <asp:Label ID="Label4" runat="server" Text="Month:" CssClass="clsLabelBold" width="60"></asp:Label>
                    </td>
                    <td style="width:20%"align="left" >
                        <asp:DropDownList ID="DdlMonth" runat="server" CssClass="clsDropdownlist">
                        </asp:DropDownList>
                    </td>
                    <td style="width:12%"align="right">
                         <asp:Label ID= "Label10" runat= "server" Text= "Location:" CssClass= "clsLabelBold"></asp:Label>

                    </td>
                    
                    <td style="width:49%"align="left" >
                    
                       <asp:DropDownList ID= "DdlLocation" runat= "server" EnableViewState= "False" CssClass="clsDropdownlist" Width="235px">
                       </asp:DropDownList>
                       
                    </td>
                                            
                  
                </tr>
        
              </table>  
           </td>    
    </tr>
     
  <tr>
  <td style="width:100%" > 
   <table width="100%" >
    <tr>
         <td style="width:14%" align="right" >
            <asp:Label ID="Label2" runat="server" Text="Learning Activity:" CssClass="clsLabelBold"></asp:Label>
         </td>
        <td style="width:20%" align="left" >
            <asp:CheckBox ID="ChkLearningActivity" width="1px" runat="server" Checked="true" />
        </td>
        <td style="width:12%" align="right" >
        <asp:Label ID="Label6" runat="server" Text=" Instructor Name:" CssClass="clsLabelBold"></asp:Label>

        </td>
        
        <td style="width:49%" align="left"  >
            <asp:DropDownList ID="DdlInstructor" runat="server" EnableViewState="False" CssClass="clsDropdownlist" Width="235px" >
            </asp:DropDownList>
           
        </td>
     </tr>
   </table>  
   </td>    
  </tr>
           
  <tr>
   
       <td style="width:100%" >
            <table width="100%">
                <tr>
                    <td style="width:14%" align="right">
                        <asp:Label ID="Label11" runat="server" Text="Off Platform:" CssClass="clsLabelBold"></asp:Label>
                    </td>
                    <td style="width:20%" align="left">
                        <asp:CheckBox ID="ChkOutOfOffice" width="10" Checked="true" runat="server" />
                    </td>
                    
                    <td style="width:12%" align="right">
                    <asp:Label ID="Label8" runat="server" Text=" Equipment Kit:" CssClass="clsLabelBold"></asp:Label>
                    </td>
                    
                    <td align="left" style="background-color: white;width:49%" >
                     <asp:DropDownList ID="ddlEquipmentKit" runat="server" EnableViewState="False" CssClass="clsDropdownlist" Width="235px">
                     </asp:DropDownList>   
                    </td>
                                                 
                  
  </tr>
              </table>  
           </td>    
  </tr>
    
  <tr>
  <td align="left" style="width:100%; height: 24px;" > 
  
         <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="clsButton" OnClick="BtnSearch_Click" />
    
 </td>    
 </tr>
    
    
    
    </table>  
    
   </td>
   </tr> 
   </table>
	<table id="Table1" cellpadding="0" cellspacing="0"  width="810">
	<tr>
          <td align="left" style="width: 797px" >
         <asp:Label ID="lblCountMessage" runat="server" Visible="false"  CssClass="clsLabelBold"><font color="red">*There are more sessions than can possibly be displayed in a month view.<Br> To see sessions, navigate to the Day or Week view </font></asp:Label>
         </td>
    </tr>
   <tr>
          <td align="left" style="width: 797px" >
         <asp:Button ID="BtnDay" runat="server" Text="Day" CssClass="clsButton" OnClick="BtnDay_Click1" />
         <asp:Button ID="BtnWeek" runat="server" Text="Week" CssClass="clsButton" OnClick="BtnWeek_Click1" />
         <asp:Button ID="BtnMonth" runat="server" Text="Month" CssClass="clsButton" OnClick="BtnMonth_Click" />
         </td>
    </tr>
	         
	<tr style="height:inherit">
	     <td style="width: 797px">
		   <table width="100%" border="0" style="background-color:#FFDD99">
		    <tr>
		    <td class="calhead" align="left"><asp:LinkButton ID="DecDateButton" runat="server" CssClass="calhead" Text="Previous Month" Font-Names="Arial" Font-Size="11pt" OnClick="DecDateButton_Click" ForeColor="Black"/></td>
			<td class="calhead" align="center"><asp:Label ID="LblDate" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" ForeColor="Black" ></asp:Label></td>
			<td class="calhead" align="right"><asp:LinkButton ID="IncDateButton" runat="server" CssClass="calhead"  Text="Next Month" Font-Names="Arial" Font-Size="11pt" OnClick="IncDateButton_Click" ForeColor="Black"/></td>
		    </tr>
		   </table>
		 </td> 
	</tr>	
	
<tr>	
	
<td style="width: 797px">
		<mcwc:Calendar id= "CalendarCtrl" runat="server" ViewType="MonthView" Palette="Windows"
   	    SpanType="Multiline" DataTextField="Tooltip" DataLinkField="Link" DataStartDateField="ScheduledStartDate"
   	    DataEndDateField="ScheduledEndDate" MoreItemsText="More..." width="100%" Height="15%" 
   	    CalendarItemDefaultStyle-Font-Size="9pt" CalendarHeaderStyle-Font-Size="9pt" CalendarHeaderStyle-Font-Bold="true"  CalendarHeaderStyle-Font-Names="Arial" CalendarItemDefaultStyle-Font-Names="Arial" CalendarItemInactiveStyle-Font-Names="Arial" CalendarItemInactiveStyle-Font-Size="9pt" CalendarItemSelectedStyle-Font-Names="Arial" CalendarItemSelectedStyle-Font-Size="9pt" >

   	   </mcwc:Calendar>
 	</td> 
 	
    </tr>
   
  
   </table>





</asp:Content>

--%>