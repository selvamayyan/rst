<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" smartnavigation="true" CodeFile="SessionManagement.aspx.cs" Inherits="SessionManagement" %>


<asp:Content ID="cnt1" runat="server" ContentPlaceHolderID="main">
<script type ="text/javascript">

    function Showcal(controlValue) {
        var selectDate = window.showModalDialog("dtpicker.aspx?selectDat=" +document.getElementById(controlValue).value, window, "dialogwidth:150px;dialogheight:200px;status:0");

        if (selectDate != "") 
        {

           document.getElementById(controlValue).value = selectDate;

        }
     }



     function bestfitCheck(task) {

    //  alert ("coming");

        if(task=="bestFitLoc")
        {

            retValue = window.showModalDialog('bestfitLocation.aspx?selLoc=' + document.getElementById("<%=hidSelectedLocations.ClientID %>").value, window, "dialogwidth:750px;dialogHeight:650px;status:0");


           

            if( retValue!="")
            {

                document.getElementById("<%=hidSelectedLocations.ClientID %>").value = retValue;

                var locIdName = retValue.split('~');
            var  LocationID="";
           var  LocationName="";

           var olddata = "<table border='1',cellspacing='0' cellpadding='4'; style='background-color=#FFDD99;'><tr><th>PrimaryLocation</th><th>LocationName</th></tr>"

                for (var i = 0; i < locIdName.length-1; i++)
                    {

                        LocationID = locIdName[i].split('|')[0];
                        LocationName = locIdName[i].split('|')[1];

                        var newrow = "<tr><td><input type='radio' id='rdLocationPK' value=" + LocationID + "></td><td>" + LocationName + "</td></tr>"


                        olddata = olddata + newrow;
                    }

                   


            }

                document.getElementById("divGridViewLocation").innerHTML = olddata + "</table>";
                return false;   
     
                 }
     }
     
   
</script>



<table id="MainTable" style="background-color:Fuchsia" width="790">

    <tr>
       <td  >       
        <table id ="formHeading" width="100%">
            <tr>
                <td align="left" style=" width:50%;">                 
                    <asp:Label ID="Label12" CssClass="clsPageHeading" runat="server" Text="Session Form"></asp:Label>
                  </td>
                <td align="right" style="white-space:nowrap;">
                    <asp:Label ID="Label13" runat="server" CssClass="clsBoldLabel" Text="Note: "></asp:Label>
                    <asp:Label ID="Label14" runat="server" CssClass="clsLabel" Text="("></asp:Label><span style=" font:arial; color:red">*</span><asp:Label ID="Label15" runat="server" CssClass="clsLabelBold" Text=") Required Form Field"></asp:Label>
                 </td>
            </tr>
      </table>
       </td>      
    </tr>
    <tr>
       <td style="height: 21px" >
       </td>
    </tr>
    <tr>
       <td >
            <table width="100%" runat="server" id="tblButton" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td style="height: 24px" colspan="2">
                        <asp:Label ID="lblForm" runat="server" Text="Form:" CssClass="clsLabelBold" Width="53px"></asp:Label>
                        <asp:DropDownList ID="ddlForm" runat="server" CssClass="clsDropdownlist" Width="164px" AutoPostBack="True" OnSelectedIndexChanged="ddlForm_SelectedIndexChanged" >
                                        <asp:ListItem>Learning Activity </asp:ListItem>
                                        <asp:ListItem>Off Platform</asp:ListItem>
                        </asp:DropDownList></td>
                    <td align="right" colspan="4">
                                  <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="clsButton" OnClientClick="return funDataValidate('save')" OnClick="btnSave_Click" />
                                  <asp:Button ID="btnSaveAndSTP" runat="server" Text="Save & Send to Production" CssClass="clsBiggerButton" Width="179px" OnClientClick="return funDataValidate('saveAndSTP')" OnClick="btnSaveAndSTP_Click" />
                                  <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="clsButton" OnClick="btnBack_Click" />
                                  <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="clsButton" OnClick="btnReset_Click" OnClientClick="return confirm('Any Changes made since the last saved will be discarded, are you sure you want to Reset ?')" />
                    </td>
                </tr>
                 
             </table>
             
             <table id="tblBorder" runat="server" class="clsFormTable"  width="100%" >
                    <tr>
                        <td>
                        <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" >
                        <table runat="server"  width="95%" cellpadding="0" cellspacing="0" id="tblContent">
                            <tr>
                                <td align="left" colspan="6" > 
                                <table id="hidTable" runat="server">
                                <tr>
                                <td>
                              
                                <asp:TextBox Visible="false" ID="txtEverInProduction" runat="server" Width="0px"></asp:TextBox>
                               
                                
                             
                               
                             
                                </td>
                                </tr>
                         </table>
                              </td>
                            </tr>
                            <tr>
                                <td align="right" style="width:18%" > 
                                    <asp:Label ID="lblCourse" runat="server" CssClass="clsLabelBold" Text="Course:"></asp:Label><span style=" font:arial; color:red">*</span></td>
                                <td align="right" style="width:2%" > </td>
                                <td align="left" style="width:30%"> 
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="clsDropdownlist" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" Width="216px">
                                    </asp:DropDownList></td>
                                    
                                <td align="left" colspan="3"  > 
                                <!--
                                GEL011318 : DST V1.0: Course Type dropdown filter is overlapping the label:
	                            Removed style from <td > and width of label
                                -->
                                    <asp:Label ID="lblCourseType" runat="server"  CssClass="clsLabelBold"   Text="Course Type:"></asp:L
                                    <asp:DropDownList ID="ddlCourseType" runat="server" CssClass="clsDropdownlist" 
                                        Width="281px" onselectedindexchanged="ddlCourseType_SelectedIndexChanged"> </asp:DropDownList>
                                    </td>
                                <td align="right" style="width:2%" > </td>
                                <td align="left" style="width:30%"> 
                                    </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="lblName" runat="server" CssClass="clsLabelBold" Text="Name:"></asp:Label><span style="color:red">*</asp:Label><span style="color:red">*</span></td>
                                  <td align="right" style="width:2%" > </td>
                                <td align="left"  colspan="2"> 
                                    <asp:TextBox ID="txtName" runat="server" CssClass="clsTextBox" MaxLength="300" Width="250pt"></asp:TextBox></td>
                                <%--<td align="right" ></td>
                                <td > </td>--%>
                                <td align="Left" colspan="2">
                                  <asp:Label ID="lblActivityCode" runat="server" CssClass="clsLabelBold" Text="Activity Code:"></asp:Label>
                                  <asp:TextBox ID="txtActivityCode" runat="server" CssClass="clsTextBox" MaxLength="255"  Width="108pt"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="lblDescription" runat="server" CssClass="clsLabelBold" Text="Description:"></asp:Label></td>
                                  <td align="right" style="width:2%" > </td>
                                <td align="left" colspan="4" style="width: 80%">
                                   <asp:TextBox ID="txtDescription" runat="server" CssClass="clsTextBox" Height="66px" TextMode="MultiLine" Width="585px"></asp:TextBox></td>
                            </tr>
                            
                            <tr>
                                <td align="left" style="height:20px" colspan="6">
                                    <strong>______________________________________________________________________________________________</strong>
                                    </td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 18%; height: 19px;">
                                    <asp:Label ID="lblScheduling" runat="server" CssClass="clsSubHeading" Text="Scheduling"></asp:Label></td>
                                 <td align="right" style="width:2%; height: 19px;" > </td>
                                <td align="left" style="width: 30%; height: 19px;">
                                </td>
                                <td align="right" style="width: 18%; height: 19px;">
                                </td>
                                 <td align="right" style="width:2%; height: 19px;" > </td>
                                <td align="left" style="width: 199px; height: 19px;">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 2px;">
                                    <asp:Label ID="lblActivity" runat="server" CssClass="clsLabelBold" Text="Active ?:"></asp:Label></td>
                                 <td align="right" style="width:2%; height: 2px;" > </td>
                                <td align="left" style="width: 30%; height: 2px;">
                                    <asp:DropDownList ID="ddlActive" runat="server" CssClass="clsDropdownlist">
                                        <asp:ListItem>Active</asp:ListItem>
                                        <asp:ListItem>Inactive</asp:ListItem>
                                        <asp:ListItem>Cancelled</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%; height: 2px;">
                                    <asp:Label ID="lblStatus" runat="server" CssClass="clsLabelBold" Text="Status:"></asp:Label></td>
                                 <td align="right" style="width:2%; height: 2px;" > </td>
                                <td align="left" style="width: 199px; height: 2px;">
                                    <asp:DropDownList ID="ddlStatus" runat="server" Width="216px" Enabled="False">
                                        <asp:ListItem >Draft</asp:ListItem>
                                        <asp:ListItem>Ready for Production</asp:ListItem>
                                        <asp:ListItem>Production</asp:ListItem>
                                        <asp:ListItem>Draft Revised</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <%----------------------new code added for Cancelation changes------------------------%>
                            
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label67" runat="server" CssClass="clsLabelBold" Text="Cancellation Reason:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:DropDownList ID="ddlCancellationReason" runat="server" CssClass="clsDropdownlist"
                                        Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label68" runat="server" CssClass="clsLabelBold" Text="Instructor Redeployed:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:CheckBox ID="ckbInstructorRedeployed" runat="server" /></td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            
                            
                            <%------------------------------------------------------------------------------------%>
                            
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="lblScheduler" runat="server" CssClass="clsLabelBold" Text="Scheduler:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:DropDownList ID="ddlScheduler" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="lblSchedulingStart" runat="server" CssClass="clsLabelBold" Text="Scheduling Status: "></asp:Label><span style="color:red">*</span></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                    <asp:DropDownList ID="ddlSchedulingStatus" runat="server" CssClass="clsDropdownlist"
                                        Width="216px">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 74px;">
                                    <asp:Label ID="lblSchedulingNotes" runat="server" CssClass="clsLabelBold" Text="Scheduling Notes:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 74px;">
                                </td>
                                <td align="left" colspan="4" style="height: 74px">
                                    <asp:TextBox ID="txtSchedulingNotes" runat="server" CssClass="clsTextBox" Height="66px"
                                        MaxLength="200" TextMode="MultiLine" Width="581px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td align="left" style="height:20px" colspan="6" >
                                    <strong>______________________________________________________________________________________________</strong>
                                    </td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblDemand" runat="server" CssClass="clsSubHeading" Text="Demand "></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                </td>
                                <td align="right" style="width: 18%; height: 11px">
                                </td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblLearningPlan" runat="server" CssClass="clsLabelBold" Text="Learning Plan:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:DropDownList ID="ddlLearningPlan" runat="server" CssClass="clsDropdownlist"
                                        Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%; height: 11px">
                                </td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblPlanStart" runat="server" CssClass="clsLabelBold" Text="Plan Start:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:TextBox ID="txtPlanStart" runat="server" CssClass="clsTextBox" Width="70px"></asp:TextBox><img
                                        alt="Click Here to Pick up the date" height="16" onclick="Showcal('<%=txtPlanStart.ClientID%>')"
                                        src="../Common/image/cal.gif" /></td>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblPlanEnd" runat="server" CssClass="clsLabelBold" Text="Plan End:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                    <asp:TextBox ID="txtPlanEnd" runat="server" CssClass="clsTextBox" Width="70px"></asp:TextBox><img
                                        alt="Click Here to Pick up the date" height="16" onclick="Showcal('<%=txtPlanEnd.ClientID%>')"
                                        src="../Common/image/cal.gif" /></td>
                            </tr>
                            <%----------------new coloum----------------%>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="Label5" runat="server" CssClass="clsLabelBold" Text="Requested Facility:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                
                                <td align="left"  colspan="3"> 
                                    <asp:TextBox ID="txtRequestedFacility" runat="server" CssClass="clsTextBox" MaxLength="255" Width="210px"></asp:TextBox>
                                </td>
                                    
                                
                                <td align="right" style="width: 199px; height: 11px">
                                </td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                </td>
                            </tr>
                            <%------------------------------------------%>
                            <tr>
                                <td align="right" style="width: 18%; height: 23px">
                                    <asp:Label ID="lblPlanLocation" runat="server" CssClass="clsLabelBold" Text="Requested Location:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 23px">
                                </td>
                                
                                <td align="left"  colspan="3" style="height: 23px"> 
                                    <asp:TextBox ID="txtRequestedLocation" runat="server" CssClass="clsTextBox" MaxLength="255" Width="210px"></asp:TextBox>
                                </td>
                                
                                
                    
                                <td align="right" style="width: 199px; height: 23px">
                                </td>
                                <td align="right" style="width: 2%; height: 23px">
                                </td>
                                <td align="left" style="width: 30%; height: 23px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblRequistorSource" runat="server" CssClass="clsLabelBold" Text="Requestor Source:"
                                        Width="156px"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:DropDownList ID="ddlRequestorSource" runat="server" CssClass="clsDropdownlist"
                                        Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%; height: 11px">
                                    </td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                    </td>
                            </tr>
                            <%--------------------------new two fields-----------------------%>
                             <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="Label10" runat="server" CssClass="clsLabelBold" Text="Preferred Period Within Quarter:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:TextBox ID="txtPreferredPeriodWithinQuarter" runat="server" CssClass="clsTextBox" MaxLength="100"
                                        Width="210px"></asp:TextBox></td>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblRequestedDate" runat="server" CssClass="clsLabelBold" Text="Requested Date:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                <asp:TextBox ID="txtRequestedDate" runat="server" CssClass="clsTextBox" Width="70px"></asp:TextBox><img
                                        alt="Click Here to Pick up the date" height="16" onclick="Showcal('<%=txtRequestedDate.ClientID%>')"
                                        src="../Common/image/cal.gif" />
                                </td>
                            </tr>
                             <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="Label11" runat="server" CssClass="clsLabelBold" Text="Blackout Dates:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:TextBox ID="txtBlackoutDates" runat="server" CssClass="clsTextBox" MaxLength="100"
                                        Width="210px"></asp:TextBox></td>
                                <td align="right" style="width: 18%; height: 11px">
                                </td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                </td>
                            </tr>
                            <%---------------------------------------------------------------%>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblRequestorName" runat="server" CssClass="clsLabelBold" Text="Requestor Name:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:TextBox ID="txtRequestorName" runat="server" CssClass="clsTextBox" MaxLength="50"
                                        Width="210px"></asp:TextBox></td>
                                <td align="right" style="width: 18%; height: 11px">
                                </td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblClientRequestorName" runat="server" CssClass="clsLabelBold" Text="Client Requestor Name:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:TextBox ID="txtClientRequestorName" runat="server" CssClass="clsTextBox" MaxLength="50"
                                        Width="210px"></asp:TextBox></td>
                                <td align="right" style="width: 18%; height: 11px">
                                </td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblPriority" runat="server" CssClass="clsLabelBold" Text="Priority:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:DropDownList ID="ddlPriority" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%; height: 11px">
                                </td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblRequestSessionNumber" runat="server" CssClass="clsLabelBold" Text="Request Session Number:"
                                        Width="160px"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:TextBox ID="txtRequestSessionNumber" runat="server" CssClass="clsTextBox" MaxLength="50"
                                        Width="210px"></asp:TextBox></td>
                                <td align="right" style="width: 18%; height: 11px ; white-space:nowrap ">
                                
                                </td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="right" style="width: 199px; height: 11px">
                                <asp:Label ID="lblSchedulerPerRequest"  runat="server" CssClass="clsLabelBold" Text="Scheduled Per Request:"></asp:Label> 
                                    <asp:CheckBox ID="ckbScheduledPerRequest" runat="server" />&nbsp;&nbsp;
                               </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblSRNumber" runat="server" CssClass="clsLabelBold" Text="SR Number:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:TextBox ID="txtSRNumber" runat="server" CssClass="clsTextBox" MaxLength="25"
                                        Width="210px"></asp:TextBox></td>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblApprovedDate" runat="server" CssClass="clsLabelBold" Text="Approved Date:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                    <asp:TextBox ID="txtApprovedDate" runat="server" CssClass="clsTextBox" Width="70px"></asp:TextBox><img 
                                    alt="Click Here to Pick up the date" height="16" onclick="Showcal('<%=txtApprovedDate.ClientID%>')"
                                        src="../Common/image/cal.gif" /></td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblApprovedBy" runat="server" CssClass="clsLabelBold" Text="Approved By:"
                                        Width="156px"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:TextBox ID="txtApprovedBy" runat="server" CssClass="clsTextBox" MaxLength="50"
                                        Width="210px"></asp:TextBox></td>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblQACompleted" runat="server" CssClass="clsLabelBold" Text="QA Completed Date:"
                                        Width="100%"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                    <asp:TextBox ID="txtQACompletedDate" runat="server" CssClass="clsTextBox" Width="70px"></asp:TextBox><img
                                        alt="Click Here to Pick up the date" height="16" onclick="Showcal('<%=txtQACompletedDate.ClientID%>')"
                                        src="../Common/image/cal.gif" /></td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblSubmittedToQA" runat="server" CssClass="clsLabelBold" Text="Submitted to QA:"
                                        Width="156px"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 30%; height: 11px">
                                    <asp:CheckBox ID="ckbSubmittedToQA" runat="server" /></td>
                                <td align="right" style="width: 18%; height: 11px">
                                </td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" style="width: 199px; height: 11px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 11px">
                                    <asp:Label ID="lblQANotes" runat="server" CssClass="clsLabelBold" Text="QA Notes:"
                                        Width="156px"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 11px">
                                </td>
                                <td align="left" colspan="4" style="height: 11px">
                                    <asp:TextBox ID="txtQANotes" runat="server" CssClass="clsTextBox" Height="66px" MaxLength="200"
                                        TextMode="MultiLine" Width="581px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td align="left" style="height:20px" colspan="6" >
                                    <strong>______________________________________________________________________________________________</strong>
                                    </td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 18%">
                                    <asp:Label ID="Label29" runat="server" CssClass="clsSubHeading" Text="Detail "></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" colspan="2" style="height: 19px">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 24px;">
                                    <asp:Label ID="Label33" runat="server" CssClass="clsLabelBold" Text="Scheduled Start:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 24px;">
                                </td>
                                <td align="left" colspan="2" style="height: 24px">
                                    <asp:TextBox ID="txtScheduledStart" runat="server" CssClass="clsTextBox" Width="70px"></asp:TextBox><img
                                        alt="Click Here to Pick up the date" height="16" onclick="Showcal('<%=txtScheduledStart.ClientID%>')"
                                        src="../Common/image/cal.gif" /><asp:Label ID="Label4" runat="server" CssClass="clsLabelBold"
                                            Text=" "></asp:Label><asp:DropDownList ID="ddlStartTimeHH" runat="server" CssClass="clsDropdownlist"
                                                Width="58px">
                                            </asp:DropDownList><asp:Label ID="Label6" runat="server" CssClass="clsLabelBold"
                                                Text=" : "></asp:Label><asp:DropDownList ID="ddlStartTimeMM" runat="server" CssClass="clsDropdownlist"
                                                    Width="38px">
                                                </asp:DropDownList></td>
                                <td align="right" style="width: 2%; height: 24px;">
                                </td>
                                <td align="left" style="width: 199px; height: 24px;">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 24px;">
                                    <asp:Label ID="Label3" runat="server" CssClass="clsLabelBold" Text="Scheduled End:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 24px;">
                                </td>
                                <td align="left" colspan="2" style="height: 24px">
                                    <asp:TextBox ID="txtScheduledEnd" runat="server" CssClass="clsTextBox" Width="70px"></asp:TextBox><img
                                        alt="Click Here to Pick up the date" height="16" onclick="Showcal('<%=txtScheduledEnd.ClientID%>')"
                                        src="../Common/image/cal.gif" /><asp:Label ID="Label8" runat="server" CssClass="clsLabelBold"
                                            Text=" "></asp:Label><asp:DropDownList ID="ddlEndTimeHH" runat="server" CssClass="clsDropdownlist"
                                                Width="58px">
                                            </asp:DropDownList><asp:Label ID="Label9" runat="server" CssClass="clsLabelBold"
                                                Text=" : "></asp:Label><asp:DropDownList ID="ddlEndTimeMM" runat="server" CssClass="clsDropdownlist"
                                                    Width="38px">
                                                </asp:DropDownList></td>
                                <td align="right" style="width: 2%; height: 24px;">
                                </td>
                                <td align="left" style="width: 199px; height: 24px;">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label7" runat="server" CssClass="clsLabelBold" Text="Time Zone:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:DropDownList ID="ddlTimeZone" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 25px;">
                                </td>
                                <td align="right" style="width: 2%; height: 25px;">
                                </td>
                                <td align="left" style="width: 30%; height: 25px;">
                                </td>
                                <td align="right" style="width: 18%; height: 25px;">
                                </td>
                                <td align="right" style="width: 2%; height: 25px;">
                                </td>
                                <td align="left" style="width: 199px; height: 25px;">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
          <asp:Label ID="Label35" runat="server" CssClass="clsLabelBold" Text="Locations:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td><td></td>
                                <!--  <td align="left" style="width: 30%">
                                 <asp:TextBox ID="txtLocation" runat="server" CssClass="clsTextBox" Width="210px"></asp:TextBox></td> -->
                                <td align="left" style="height: 19px" colspan="3">  
                                   <asp:Button ID="btnBestFitLoc" runat="server" OnClick="btnBestFitLoc_Click" OnClientClick="return bestfitCheck('bestFitLoc')"
                                        Text="Find Best Fit" />
                                        </td>


                              </tr>



                             <%--<tr>
                                <td align="right" style="width: 18%; height: 25px;">
                                </td>
                                <td align="right" style="width: 2%; height: 25px;">
                                </td>
                                <td align="left" style="width: 30%; height: 25px;">
                                </td>
                                <td align="right" style="width: 18%; height: 25px;">
                                </td>
                                <td align="right" style="width: 2%; height: 25px;">
                                </td>
                                <td align="left" style="width: 199px; height: 25px;">
                                </td>
                            </tr>--%>
                           
                                     
                           <%---------------Multiple locations Starts[selvam]------------------------------------------------%>
                          
                           <tr>                            
                                <td align="left" colspan="8" >
                                    
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="8" style="height: 18px">
                                                            
                               
                                  <div id="divGridViewLocation">
                                    <asp:GridView ID="GridViewLocation" runat="server" AutoGenerateColumns="False"
                                        BackColor="#ffdd99" BorderColor="#ffdd99"  BorderWidth="1px" CellPadding="4"
                                        Font-Names="Arial" Width="60%">
                                        <FooterStyle BackColor="#FFDD99" ForeColor="#330099" />
                                        <Columns>
                                        
                                        
                                         <asp:TemplateField HeaderText="Primary Location*">
                                           <ItemTemplate>
                                           <input name="rdLocationPK" type="radio"    value='<%# Eval("LocationPK") %>' checked="checked"   />
                                           </ItemTemplate>
                                           <ItemStyle HorizontalAlign="Center" Width="28%"/>
                                         </asp:TemplateField>
                                         
                                         <asp:BoundField DataField="LocationName" HeaderText="Location Name">
                                                <ItemStyle  HorizontalAlign="Left" Width="75%" />
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                         </asp:BoundField>
                                            
                                            
                                        </Columns>
                                        <RowStyle BackColor="White" Font-Size="Smaller" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#E0E0E0" BorderColor="Gray" Font-Bold="True" ForeColor="Black"
                                            HorizontalAlign="Left" />
                                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                      <HeaderStyle BackColor="WhiteSmoke" Font-Bold="True" CssClass="clsLabelBold" Font-Underline="False" ForeColor="Black" HorizontalAlign="Center" Wrap="False"  />
                                  </asp:GridView>
                                  </div>
                                  <asp:Label ID="labelNote" runat="server" CssClass="clsLocationNotes"  Text="*Note:The selected Proximity	Location is used to determine instructor Proximity values when using the Instructor Best Fit functionality."></asp:Label>
                                                                           
                                </td>
                                                               
                            </tr>
                            
                            <%---------------Multiple locations Ends[selvam]------------------------------------------------%>

                            
                            
                            
                            
                            
                            
                            
                            
                            
                            <tr>
                                <td align="right" style="width: 18%; height: 25px;">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                </td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label37" runat="server" CssClass="clsLabelBold" Text="Equipment Kit Name:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:TextBox ID="txtEquipmentKitName" runat="server" CssClass="clsTextBox" Width="210px"></asp:TextBox></td>
                                <td align="left" style="height: 19px" colspan="3">
                                    <asp:Button ID="btnBestFitEquip" runat="server" OnClick="btnBestFitEquip_Click" OnClientClick="return bestfitCheck('bestFitEquip')"
                                        Text="Find Best Fit" /></td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label36" runat="server" CssClass="clsLabelBold" Text="Equipment Kit Delivery:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtEquipmentKitDelivery" runat="server" CssClass="clsTextBox" Width="70px"></asp:TextBox><img
                                        alt="Click Here to Pick up the date" height="16" onclick="Showcal('<%=txtEquipmentKitDelivery.ClientID%>')"
                                        src="../Common/image/cal.gif" /></td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 19px;">
                                </td>
                                <td align="right" style="width: 2%; height: 19px;">
                                </td>
                                <td align="left" style="width: 30%; height: 19px;">
                                </td>
                                <td align="right" style="width: 18%; height: 19px;">
                                </td>
                                <td align="right" style="width: 2%; height: 19px;">
                                </td>
                                <td align="left" style="width: 199px; height: 19px;">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 10px;">
                                    <asp:Label ID="Label38" runat="server" CssClass="clsLabelBold" Text="Instructors:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 10px;">
                                </td>
                                <td align="left" style="width: 30%; height: 10px;">
                                </td>
                                <td align="left" colspan="3" style="height: 10px">
                                    <asp:Button ID="btnBestFitInstruc" runat="server" OnClick="btnBestFitInstruc_Click"
                                        OnClientClick="return bestfitCheck('bestFitIns')" Text="Find Best Fit" /></td>
                            </tr>
                            <%--<tr>
                                <td align="right" style="width: 18%; height: 25px;">
                                </td>
                                <td align="right" style="width: 2%; height: 25px;">
                                </td>
                                <td align="left" style="width: 30%; height: 25px;">
                                </td>
                                <td align="right" style="width: 18%; height: 25px;">
                                </td>
                                <td align="right" style="width: 2%; height: 25px;">
                                </td>
                                <td align="left" style="width: 199px; height: 25px;">
                                </td>
                            </tr>--%>
                            <tr>
                            
                                <td align="left" colspan="8" >
                                    <table  style=" width: 100%;">
                                    <tr>
                                        <td align="center" style="height:100%;">  <asp:Label  ID="lblResponsibleInstructors" runat="server"  BackColor="#f5f5f5" Font-Bold="true" CssClass="clsLabelBold" Text="Responsible Instructors" Width="100%" ></asp:Label> </td>
                                    </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="8" style="height: 18px">
                                <div id="divGridViewInstructor">
                                    <asp:GridView ID="GridViewInstructor" runat="server" AutoGenerateColumns="False"
                                        BackColor="#ffdd99" BorderColor="#ffdd99"  BorderWidth="1px" CellPadding="4"
                                        Font-Names="Arial" Width="100%">
                                        <FooterStyle BackColor="#ffdd99" ForeColor="#330099" />
                                        <Columns>
                                        
                                        
                                         <asp:TemplateField HeaderText="Select">
                                        
                                         <ItemTemplate>
                                         <input id="Radio1" type="radio" runat="server" value='<%#Eval("InstructorPk") %>)'   />
                                         </ItemTemplate>
                                        
                                        </asp:TemplateField>
                                        
                                            <asp:BoundField DataField="InstructorName" HeaderText="Instructor Name">
                                                <ItemStyle  HorizontalAlign="left" Width="20%" />
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Instructordays" HeaderText="Instructor days">
                                                <ItemStyle HorizontalAlign="left" Width="10%" />
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true"/>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="StartDate" DataFormatString="{0:M/dd/yyyy HH:mm}" HtmlEncode="false" HeaderText="Start Date">
                                                <ItemStyle HorizontalAlign="left" Width="15%"  Wrap="false" />
                                                <HeaderStyle HorizontalAlign="Center" Wrap="false" Font-Bold="true" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="EndDate" DataFormatString="{0:M/dd/yyyy HH:mm}" HtmlEncode="false" HeaderText=" End Date ">
                                                <ItemStyle HorizontalAlign="left" Width="15%" Wrap="false" />
                                                <HeaderStyle HorizontalAlign="Center" Wrap="false" Font-Bold="true" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="InstructorRequestedDate" DataFormatString="{0:M/dd/yyyy}" HtmlEncode="false" HeaderText="Date Instructor Requested">
                                                <ItemStyle HorizontalAlign="left" Width="15%" />
                                                <HeaderStyle HorizontalAlign="Center"  Font-Bold="true"/>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="InstructorConfirmedDate" DataFormatString="{0:M/dd/yyyy}" HtmlEncode="false" HeaderText="Date Instructor Confirmed">
                                                <ItemStyle HorizontalAlign="left" Width="15%" />
                                                <HeaderStyle HorizontalAlign="Center"  Font-Bold="true"/>
                                            </asp:BoundField>
                                        </Columns>
                                        <RowStyle BackColor="White" Font-Size="Smaller" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#E0E0E0" BorderColor="Gray" Font-Bold="True" ForeColor="Black"
                                            HorizontalAlign="Left" />
                                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                      <HeaderStyle BackColor="WhiteSmoke" Font-Bold="true" CssClass="clsLabelBold" Font-Underline="False" ForeColor="Black" HorizontalAlign="Center" Wrap="False"  />
                                    </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 25px;">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                </td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="right" style="width: 18%; height: 20px">
                                    <asp:Label ID="Label39" runat="server" CssClass="clsLabelBold" Text="Minimum Capacity:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 20px">
                                </td>
                                <td align="left" style="width: 30%; height: 20px">
                                    <asp:TextBox ID="txtMinimumCapacity" runat="server" CssClass="clsTextBox" MaxLength="9" Width="210px"></asp:TextBox></td>
                                <td align="right" style="width: 18%; height: 20px">
                                    <asp:Label ID="Label40" runat="server" CssClass="clsLabelBold" Text="Maximum Capacity:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 20px">
                                </td>
                                <td align="left" style="width: 199px; height: 20px">
                                    <asp:TextBox ID="txtMaximumCapacity" runat="server" CssClass="clsTextBox" MaxLength="9"
                                        Width="210px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label41" runat="server" CssClass="clsLabelBold" Text="Waiting List Type:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:DropDownList ID="ddlWaitingListType" runat="server" CssClass="clsDropdownlist"
                                        EnableViewState="True" Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label42" runat="server" CssClass="clsLabelBold" Text="Waiting List Expiration:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:TextBox ID="txtWaitingListExpiration" runat="server" CssClass="clsTextBox" Width="70px"></asp:TextBox><img
                                        alt="Click Here to Pick up the date" height="16" onclick="Showcal('<%=txtWaitingListExpiration.ClientID%>')"
                                        src="../Common/image/cal.gif" /></td>
                                <td align="right" style="width: 18%; white-space:nowrap">
                                    <asp:Label ID="Label43" runat="server" CssClass="clsLabelBold" Text="Waiting List Hold Time:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                    <asp:TextBox ID="txtWaitingListHoldTime" runat="server" CssClass="clsTextBox" MaxLength="9" Width="210px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label44" runat="server" CssClass="clsLabelBold" Text="Minimum Percent:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:TextBox ID="txtMinimumPercent" runat="server" CssClass="clsTextBox" MaxLength="20"
                                        Width="70px"></asp:TextBox></td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label45" runat="server" CssClass="clsLabelBold" Text="Requires Approval:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:CheckBox ID="ckbRequiresApproval" runat="server" /></td>
                                <td align="right" style="width: 18%">
                                    </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="right" style="width: 199px">
                                     <asp:Label ID="Label2" runat="server" CssClass="clsLabelBold" Text="Open For Registration:"></asp:Label>
                                    <asp:CheckBox ID="ckbOpenForRegistration" runat="server" />&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label46" runat="server" CssClass="clsLabelBold" Text="Delivery Method:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:DropDownList ID="ddlDeliveryMethod" runat="server" CssClass="clsDropdownlist"
                                        Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label47" runat="server" CssClass="clsLabelBold" Text="Language:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 21px;">
                                    <asp:Label ID="Label48" runat="server" CssClass="clsLabelBold" Text="Domain:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 21px;">
                                </td>
                                <td align="left" style="width: 30%; height: 21px;">
                                    <asp:DropDownList ID="ddlDomain" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%; height: 21px;">
                                </td>
                                <td align="right" style="width: 2%; height: 21px;">
                                </td>
                                <td align="left" style="width: 199px; height: 21px;">
                                </td>
                            </tr>
                            
                             <tr>
                                <td align="right" style="width: 18%; height: 21px;">
                                    <asp:Label ID="Label1" runat="server" CssClass="clsLabelBold" Text="Organization:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 21px;">
                                </td>
                                <td align="left" style="width: 30%; height: 21px;">
                                    <asp:DropDownList ID="ddlOrganizations" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%; height: 21px;">
                                </td>
                                <td align="right" style="width: 2%; height: 21px;">
                                </td>
                                <td align="left" style="width: 199px; height: 21px;">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 21px;">
                                    <asp:Label ID="Label16" runat="server" CssClass="clsLabelBold" Text="Audience:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 21px;">
                                </td>
                                <td align="left" style="width: 30%; height: 21px;">
                                    <asp:DropDownList ID="ddlAudience" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%; height: 21px;">
                                </td>
                                <td align="right" style="width: 2%; height: 21px;">
                                </td>
                                <td align="left" style="width: 199px; height: 21px;">
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td align="right" style="width: 18%; height: 21px;">
                                    <asp:Label ID="Label49" runat="server" CssClass="clsLabelBold" Text="Billing Region:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 21px;">
                                </td>
                                <td align="left" style="width: 30%; height: 21px;">
                                    <asp:DropDownList ID="ddlBillingRegion" runat="server" CssClass="clsDropdownlist"
                                        Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%; height: 21px;">
                                </td>
                                <td align="right" style="width: 2%; height: 21px;">
                                </td>
                                <td align="left" style="width: 199px; height: 21px;">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%; height: 21px;">
                                    <asp:Label ID="Label50" runat="server" CssClass="clsLabelBold" Text="Evaluation Name:"></asp:Label></td>
                                <td align="right" style="width: 2%; height: 21px;">
                                </td>
                                <td align="left" style="width: 30%; height: 21px;">
                                    <asp:DropDownList ID="ddlEvaluationName" runat="server" CssClass="clsDropdownlist"
                                        Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%; height: 21px;">
                                </td>
                                <td align="right" style="width: 2%; height: 21px;">
                                </td>
                                <td align="left" style="width: 199px; height: 21px;">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label51" runat="server" CssClass="clsLabelBold" Text="Trigger:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:DropDownList ID="ddlTrigger" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label52" runat="server" CssClass="clsLabelBold" Text="Trigger Offset:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:TextBox ID="txtTriggerOffset" runat="server" CssClass="clsTextBox" MaxLength="9" Width="70px"></asp:TextBox></td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label53" runat="server" CssClass="clsLabelBold" Text="Days to Complete:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:TextBox ID="txtDaysToComplete" runat="server" CssClass="clsTextBox" MaxLength="9" Width="70px"></asp:TextBox></td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="height:20px" colspan="6" >
                                    <strong>______________________________________________________________________________________________</strong>
                                    </td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 18%">
                                    <asp:Label ID="Label54" runat="server" CssClass="clsSubHeading" Text="Other "></asp:Label></td>
                                <td align="right" style="width: 2%" >
                                </td>
                                <td align="left" style="width: 30%">
                                </td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr id="t1" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField1" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 1:" Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField1" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                                
                            </tr>
                            <tr id="t2" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField2" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 2:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField2" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                                
                            </tr>
                            <tr id="t3" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField3" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 3:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField3" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                                
                            </tr>
                            <tr id="t4" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField4" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 4:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField4" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                                
                            </tr>
                            <tr id="t5" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField5" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 5:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField5" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                                
                            </tr>
                            <tr id="t6" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField6" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 6:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField6" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                                
                            </tr>
                            <tr id="t7" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField7" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 7:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField7" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                                
                            </tr>
                            <tr id="t8" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField8" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 8:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField8" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                                
                            </tr>
                            <tr id="t9" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField9" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 9:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField9" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                                
                            </tr>
                            <tr id="t10" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField10" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 10:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField10" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                                
                            </tr>
                            <tr id="t11" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField11" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 11:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField11" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                               
                            </tr>
                            <tr id="t12" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField12" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 12:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField12" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                               
                            </tr>
                            <tr id="t13" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField13" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 13:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField13" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                               
                            </tr>
                            <tr id="t14" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField14" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 14:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField14" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                               
                            </tr>
                            <tr id="t15" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField15" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 15:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField15" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                               
                            </tr>
                            <tr id="t16" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField16" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 16:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField16" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                               
                            </tr>
                            <tr id="t17" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField17" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 17:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField17" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                               
                            </tr>
                            <tr id="t18" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField18" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 18:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField18" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                             
                            </tr>
                            <tr id="t19" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField19" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 19:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField19" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                            
                            </tr>
                            <tr id="t20" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalTextField20" runat="server" CssClass="clsLabelBold" Text="Optional Text Field 20:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalTextField20" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                               
                            </tr>
                            <tr id="d1" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalDateField1" runat="server" CssClass="clsLabelBold" Text="Optional Date Field 1:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalDateField1" runat="server" CssClass="clsTextBox" Visible="False"
                                        Width="70px"></asp:TextBox><img id="img1" runat="server" 
                                        alt="Click Here to Pick up the date" height="16"
                                        src="../Common/image/cal.gif" visible="false"/></td>
                             
                            </tr>
                            <tr id="d2" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalDateField2" runat="server" CssClass="clsLabelBold" Text="Optional Date Field 2:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalDateField2" runat="server" CssClass="clsTextBox" Visible="False"
                                        Width="70px"></asp:TextBox><img id="img2" runat="server"
                                        alt="Click Here to Pick up the date" height="16"
                                        src="../Common/image/cal.gif" visible="false"/></td>
                               
                            </tr>
                            <tr id="d3" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalDateField3" runat="server" CssClass="clsLabelBold" Text="Optional Date Field 3:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalDateField3" runat="server" CssClass="clsTextBox" Visible="False"
                                        Width="70px"></asp:TextBox><img id="img3" runat="server"
                                        alt="Click Here to Pick up the date" height="16"
                                        src="../Common/image/cal.gif" visible="false"/></td>
                               
                            </tr>
                            <tr id="d4" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalDateField4" runat="server" CssClass="clsLabelBold" Text="Optional Date Field 4:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalDateField4" runat="server" CssClass="clsTextBox" Visible="False"
                                        Width="70px"></asp:TextBox><img id="img4" runat="server" 
                                        alt="Click Here to Pick up the date" height="16"
                                        src="../Common/image/cal.gif" visible="false"/></td>
                                
                            </tr>
                            <tr id="d5" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalDateField5" runat="server" CssClass="clsLabelBold" Text="Optional Date Field 5:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalDateField5" runat="server" CssClass="clsTextBox" Visible="False"
                                        Width="70px"></asp:TextBox><img id="img5" runat="server" 
                                        alt="Click Here to Pick up the date" height="16"
                                        src="../Common/image/cal.gif" visible="false"/></td>
                              
                            </tr> 
                            <tr id="d6" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalDateField6" runat="server" CssClass="clsLabelBold" Text="Optional Date Field 6:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalDateField6" runat="server" CssClass="clsTextBox" Visible="False"
                                        Width="70px"></asp:TextBox><img id="img6" runat="server" 
                                        alt="Click Here to Pick up the date" height="16"
                                        src="../Common/image/cal.gif" visible="false"/></td>
                              
                            </tr>
                            <tr id="d7" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalDateField7" runat="server" CssClass="clsLabelBold" Text="Optional Date Field 7:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalDateField7" runat="server" CssClass="clsTextBox" Visible="False"
                                        Width="70px"></asp:TextBox><img id="img7" runat="server" 
                                        alt="Click Here to Pick up the date" height="16"
                                        src="../Common/image/cal.gif" visible="false"/></td>
                              
                            </tr>
                            <tr id="d8" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalDateField8" runat="server" CssClass="clsLabelBold" Text="Optional Date Field 8:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalDateField8" runat="server" CssClass="clsTextBox" Visible="False"
                                        Width="70px"></asp:TextBox><img id="img8" runat="server" 
                                        alt="Click Here to Pick up the date" height="16"
                                        src="../Common/image/cal.gif" visible="false"/></td>
                             
                            </tr>
                            <tr id="d9" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalDateField9" runat="server" CssClass="clsLabelBold" Text="Optional Date Field 9:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalDateField9" runat="server" CssClass="clsTextBox" Visible="False"
                                        Width="70px"></asp:TextBox><img id="img9" runat="server"  
                                        alt="Click Here to Pick up the date" height="16"
                                        src="../Common/image/cal.gif" visible="false"/></td>
                              
                            </tr>
                            <tr id="d10" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalDateField10" runat="server" CssClass="clsLabelBold" Text="Optional Date Field 10:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalDateField10" runat="server" CssClass="clsTextBox" Visible="False"
                                        Width="70px"></asp:TextBox><img id="img10" runat="server"
                                        alt="Click Here to Pick up the date" height="16"
                                        src="../Common/image/cal.gif" visible="false"/></td>
                  
                            </tr>
                            <tr id="n1" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalNumericField1" runat="server" CssClass="clsLabelBold" Text="Optional Numeric Field 1:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalNumericField1" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                  
                            </tr>
                            <tr id="n2" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalNumericField2" runat="server" CssClass="clsLabelBold" Text="Optional Numeric Field 2:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalNumericField2" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                              
                            </tr>
                            <tr id="n3" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalNumericField3" runat="server" CssClass="clsLabelBold" Text="Optional Numeric Field 3:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalNumericField3" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                             
                            </tr>
                            <tr id="n4" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalNumericField4" runat="server" CssClass="clsLabelBold" Text="Optional Numeric Field 4:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalNumericField4" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                              
                            </tr>
                            <tr id="n5" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalNumericField5" runat="server" CssClass="clsLabelBold" Text="Optional Numeric Field 5:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalNumericField5" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                               
                            </tr>
                            <tr id="n6" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalNumericField6" runat="server" CssClass="clsLabelBold" Text="Optional Numeric Field 6:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalNumericField6" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                             
                            </tr>
                            <tr id="n7" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalNumericField7" runat="server" CssClass="clsLabelBold" Text="Optional Numeric Field 7:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalNumericField7" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                                
                            </tr>
                            <tr id="n8" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalNumericField8" runat="server" CssClass="clsLabelBold" Text="Optional Numeric Field 8:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalNumericField8" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                              
                            </tr>
                            <tr id="n9" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalNumericField9" runat="server" CssClass="clsLabelBold" Text="Optional Numeric Field 9:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalNumericField9" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                               
                            </tr>
                            <tr id="n10" style="display:none">
                                <td align="right">
                                    <asp:Label ID="lblOptionalNumericField10" runat="server" CssClass="clsLabelBold" Text="Optional Numeric Field 10:"
                                        Visible="False"></asp:Label></td>
                                <td align="right">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtOptionalNumericField10" runat="server" MaxLength="50" CssClass="clsTextBox" Visible="False"
                                        Width="210px"></asp:TextBox></td>
                              
                            </tr>
                            <tr id="c1" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalCheckboxField1" runat="server" CssClass="clsLabelBold" Text="Optional Checkbox Field 1:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">
                                    <asp:CheckBox ID="chkOptionalCheckboxField1" runat="server" Visible="False" Width="210px"></asp:CheckBox>
                                </td>
                                
                            </tr>
                            <tr id="c2" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalCheckboxField2" runat="server" CssClass="clsLabelBold" Text="Optional Checkbox Field 2:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">
                                    <asp:CheckBox ID="chkOptionalCheckboxField2" runat="server" Visible="False" Width="210px"></asp:CheckBox>
                                </td>
                                
                            </tr>
                            <tr id="c3" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalCheckboxField3" runat="server" CssClass="clsLabelBold" Text="Optional Checkbox Field 3:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">
                                    <asp:CheckBox ID="chkOptionalCheckboxField3" runat="server" Visible="False" Width="210px"></asp:CheckBox>
                                </td>
                                
                            </tr>
                            <tr id="c4" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalCheckboxField4" runat="server" CssClass="clsLabelBold" Text="Optional Checkbox Field 4:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">
                                    <asp:CheckBox ID="chkOptionalCheckboxField4" runat="server" Visible="False" Width="210px"></asp:CheckBox>
                                </td>
                                
                            </tr>
                            <tr id="c5" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalCheckboxField5" runat="server" CssClass="clsLabelBold" Text="Optional Checkbox Field 5:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">
                                    <asp:CheckBox ID="chkOptionalCheckboxField5" runat="server" Visible="False" Width="210px"></asp:CheckBox>
                                </td>
                                
                            </tr>
                            <tr id="c6" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalCheckboxField6" runat="server" CssClass="clsLabelBold" Text="Optional Checkbox Field 6:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">
                                    <asp:CheckBox ID="chkOptionalCheckboxField6" runat="server" Visible="False" Width="210px"></asp:CheckBox>
                                </td>
                                
                            
                            </tr>
                            <tr id="c7" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalCheckboxField7" runat="server" CssClass="clsLabelBold" Text="Optional Checkbox Field 7:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">
                                    <asp:CheckBox ID="chkOptionalCheckboxField7" runat="server" Visible="False" Width="210px"></asp:CheckBox>
                                </td>
                                
                            </tr>
                            <tr id="c8" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalCheckboxField8" runat="server" CssClass="clsLabelBold" Text="Optional Checkbox Field 8:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">
                                    <asp:CheckBox ID="chkOptionalCheckboxField8" runat="server" Visible="False" Width="210px"></asp:CheckBox>
                                </td>
                                
                            </tr>
                            <tr id="c9" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalCheckboxField9" runat="server" CssClass="clsLabelBold" Text="Optional Checkbox Field 9:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">
                                    <asp:CheckBox ID="chkOptionalCheckboxField9" runat="server" Visible="False" Width="210px"></asp:CheckBox>
                                </td>
                               
                            </tr>
                            <tr id="c10" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalCheckboxField10" runat="server" CssClass="clsLabelBold" Text="Optional Checkbox Field 10:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">
                                    <asp:CheckBox ID="chkOptionalCheckboxField10" runat="server" Visible="False" Width="210px"></asp:CheckBox>
                                </td>
                                
                            </tr>
                            <tr id="l1" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalListField1" runat="server" CssClass="clsLabelBold" Text="Optional List Field 1:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">                                   
                                    <asp:DropDownList ID="ddlOptionalListField1" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr id="l2" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalListField2" runat="server" CssClass="clsLabelBold" Text="Optional List Field 2:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">                                   
                                    <asp:DropDownList ID="ddlOptionalListField2" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr id="l3" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalListField3" runat="server" CssClass="clsLabelBold" Text="Optional List Field 3:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">                                   
                                    <asp:DropDownList ID="ddlOptionalListField3" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr id="l4" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalListField4" runat="server" CssClass="clsLabelBold" Text="Optional List Field 4:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">                                   
                                    <asp:DropDownList ID="ddlOptionalListField4" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr id="l5" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalListField5" runat="server" CssClass="clsLabelBold" Text="Optional List Field 5:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">                                   
                                    <asp:DropDownList ID="ddlOptionalListField5" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr id="l6" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalListField6" runat="server" CssClass="clsLabelBold" Text="Optional List Field 6:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">                                   
                                    <asp:DropDownList ID="ddlOptionalListField6" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr id="l7" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalListField7" runat="server" CssClass="clsLabelBold" Text="Optional List Field 7:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">                                   
                                    <asp:DropDownList ID="ddlOptionalListField7" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr id="l8" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalListField8" runat="server" CssClass="clsLabelBold" Text="Optional List Field 8:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">                                   
                                    <asp:DropDownList ID="ddlOptionalListField8" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr id="l9" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalListField9" runat="server" CssClass="clsLabelBold" Text="Optional List Field 9:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">                                   
                                    <asp:DropDownList ID="ddlOptionalListField9" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr id="l10" style="display:none">
                                <td align="right">
                                <asp:Label ID="lblOptionalListField10" runat="server" CssClass="clsLabelBold" Text="Optional List Field 10:"
                                        Visible="False"></asp:Label></td>
                                <td align="right"></td>
                                
                                <td align="left">                                   
                                    <asp:DropDownList ID="ddlOptionalListField10" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="left" style="height:20px" colspan="6" >
                                     <strong>______________________________________________________________________________________________</strong>
                                    </td>
                            </tr>
                           
                            <tr>
                                <td align="left" style="width: 18%">
                                    <asp:Label ID="Label69" runat="server" CssClass="clsSubHeading" Text="Change Log "></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                </td>
                                <td align="right" style="width: 18%">
                                </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label70" runat="server" CssClass="clsLabelBold" Text="Requestor:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 30%">
                                    <asp:DropDownList ID="ddlRequestor" runat="server" CssClass="clsDropdownlist" Width="216px">
                                    </asp:DropDownList></td>
                                <td align="right" style="width: 18%">
                                    </td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" style="width: 199px">
                                    </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%">
                                    <asp:Label ID="Label72" runat="server" CssClass="clsLabelBold" Text="Reason:"></asp:Label></td>
                                <td align="right" style="width: 2%">
                                </td>
                                <td align="left" colspan="4">
                                    <asp:TextBox ID="txtReason" runat="server" CssClass="clsTextBox" Height="66px" TextMode="MultiLine"
                                        Width="581px" MaxLength="200"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 18%;">
                                    <asp:Label ID="Label71" runat="server" CssClass="clsLabelBold" Text="History:"></asp:Label></td>
                                
                                <td ></td>
                                <td align="Left" colspan="4"  style="width:100%" >
                                
                                
                                
                                
                                <asp:GridView ID="GridViewChangeLog" runat="server" AutoGenerateColumns="False" BackColor="White"
                                        BorderColor="Black" BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Names="Verdana"
                                        Width="545px">
                                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                        <Columns>
                                            <asp:BoundField DataField="ChangeDate" DataFormatString="{0:M/dd/yyyy}" HtmlEncode="false" HeaderText="Date">
                                                <ItemStyle HorizontalAlign="left" />
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                            </asp:BoundField> 
                                            <asp:BoundField DataField="fullname" HeaderText="Scheduler" >
                                                <ItemStyle HorizontalAlign="left" />
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                            </asp:BoundField> 
                                            <asp:BoundField DataField="Requestor" HeaderText="Requestor" >
                                                <ItemStyle HorizontalAlign="left" />
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                            </asp:BoundField> 
                                            <asp:BoundField DataField="ChangeNotes" HeaderText="Reason" >
                                                <ItemStyle HorizontalAlign="left" />
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                            </asp:BoundField> 
                                        </Columns>
                                        <RowStyle BackColor="White" Font-Size="Smaller" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#E0E0E0" BorderColor="Gray" Font-Bold="True" ForeColor="Black"
                                            HorizontalAlign="Left" />
                                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="WhiteSmoke" CssClass="clsLabelBold" Font-Underline="False" ForeColor="Black" HorizontalAlign="Center" Wrap="False"  />
                                 </asp:GridView>
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                </td>
                               
                            </tr>
                            <tr>
                                <td align="left" style="height: 19px" colspan="6">

                                </td>
                            </tr>
                                                           

                          </table>
                        </td>
                    </tr>
              </table>
              
              <table width="100%" runat="server" id="Table1" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td style="height: 24px" colspan="2">
                        </td>
                    <td align="right" colspan="4" style="height: 24px">
                        <asp:Button ID="btnSave1" runat="server" Text="Save" CssClass="clsButton" OnClientClick="return funDataValidate('save')" OnClick="btnSave_Click" />
                                  <asp:Button ID="btnSaveAndSTP2" runat="server" Text="Save & Send to Production" CssClass="clsBiggerButton" OnClientClick="return funDataValidate('saveAndSTP')" OnClick="btnSaveAndSTP_Click" />
                                  <asp:Button ID="btnBack3" runat="server" Text="Back" CssClass="clsButton" OnClick="btnBack_Click" />
                                  <asp:Button ID="btnReset4" runat="server" Text="Reset" CssClass="clsButton" OnClick="btnReset_Click" OnClientClick="return confirm('Any Changes made since the last saved will be discarded, are you sure you want to Reset ?')" />
                    </td>
                </tr>
                 
             </table>
             
            
       </td>
     
    </tr>
    <tr>   <td><asp:HiddenField ID="hidSelectedLocations" runat="server" /></td>
        <td><asp:HiddenField ID="hidSelectedIns" runat="server" /></td></tr>
    <tr><td><asp:HiddenField ID="hidAssigenedInstructor" runat="server" /> </td></tr>
    <tr><td><asp:HiddenField ID="hidSessionId" runat="server" /> </td></tr>
    
 </table>





</asp:Content>