<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" EnableViewStateMac="false"
    AutoEventWireup="true" CodeFile="Course.aspx.cs" Inherits="course" %>

<asp:Content ID="cnt5" runat="server" ContentPlaceHolderID="Main">
    <script type="text/javascript">



        function RedirectNext(Mode) {


            if (Mode == 'Add') {

                location.href = "CourseForm.aspx?mode=add";
                return false;
            }

            else {
                var elem = document.getElementById('aspnetForm').elements;
                var chkflag = false;
                var CourseId = "";

                for (var i = 0; i < elem.length; i++) {
                    if (elem[i].type == "radio") {

                        if (elem[i].checked) {

                            CourseId = elem[i].value;
                            chkflag = true;
                        }

                    }

                }

                if (chkflag) {

                    location.href = "CourseForm.aspx?mode=edit&coursePk=" + CourseId;
                    return false;
                }
                else {

                    alert("Select Course to Edit");
                    return true;

                }

            }

        }

    </script>
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="4" valign="top">
                <asp:Label ID="lblHeading" Font-Bold="true" CssClass="clsHeaderTitle1" Text="Course Management"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 10%">
                <asp:Label ID="lbl1" CssClass="clsLabel" Text="Status:" runat="server"></asp:Label>
            </td>
            <td colspan="3" align="left">
                <asp:DropDownList CssClass="CssDropDown" ID="drpStatus" runat="server">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>InActive</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 10%">
                <asp:Label ID="Label1" CssClass="clsLabel" Text="Course Name:" runat="server"></asp:Label>
            </td>
            <td colspan="3" align="left">
                <asp:DropDownList EnableViewState="true" CssClass="CssDropDown" ID="drpName" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 10%">
                <asp:Label ID="Label2" CssClass="clsLabel" Text="Course Code:" runat="server"></asp:Label>
            </td>
            <td colspan="3" align="left">
                <asp:TextBox ID="TxtCourseCode" CssClass="CssTextBox" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClientClick="return RedirectNext('Add')"
                    OnClick="btnAdd_Click" />
                &nbsp;
                <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClientClick="return RedirectNext('Edit')"
                    OnClick="btnEdit_Click" />&nbsp;
                <asp:Button ID="Search" runat="server" Text="Search" OnClick="Search_Click" />
            </td>
        </tr>
        <%-- <tr>
   <td><asp:Button ID="btnAdd" runat ="server" CssClass ="CssButton" Text="Add" OnClientClick ="return RedirectNext('Add')" />&nbsp;
       <asp:Button ID="BtnEdit" runat ="server" CssClass ="CssButton"  Text="Edit" OnClientClick ="return RedirectNext('Edit')" />&nbsp;
       <asp:Button ID="BtnSearch" runat ="server" CssClass ="CssButton" Text="Search"  OnClick="BtnSearch_Click1" /></td>
  <td colspan="3" align="right" ><asp:ImageButton ID="btnExel"  ImageUrl="~Common/Image/icon_excel.gif" runat="server" /></td>
   </tr>--%>
    </table>
    <table style="width: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <asp:GridView AutoGenerateColumns="false" ID="grdCourse" runat="server" AllowPaging="true"
                    PageSize="10" OnPageIndexChanging="grdCourse_pageIndexChanging" AllowSorting="true"
                    OnSorting="grdCourse_sorting">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <input id="Radio1" type="radio" runat="server" value='<% #Eval("coursepk") %>' /></ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataTextField="CourseName" DataNavigateUrlFields="CoursePk" DataNavigateUrlFormatString="CourseForm.aspx?mode=Edit&Coursepk={0}"
                            HeaderText=" Course Name" SortExpression="CourseName" />
                        <asp:BoundField DataField="CourseCode" SortExpression="CourseCode" HeaderText="CourseCode"
                            HtmlEncode="false" />
                        <asp:BoundField DataField="CourseStatus" HeaderText="CourseStatus" SortExpression="CourseStatus"
                            HtmlEncode="false" />
                        <asp:BoundField DataField="CourseDuration" HeaderText="CourseDuration" SortExpression="CourseDuration"
                            HtmlEncode="false" />
                        <asp:BoundField DataField="MaxClassSize" HeaderText="MaxClassSize" SortExpression="MaxClassSize"
                            HtmlEncode="false" />
                        <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" DataFormatString="{0:t}"
                            SortExpression="DateCreated" HtmlEncode="false" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dLst" runat="server">
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Repeater ID="rptr" runat="server">
                </asp:Repeater>
            </td>
        </tr>
    </table>
</asp:Content>
