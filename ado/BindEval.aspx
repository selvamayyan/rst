<%--<%@ page language="c#" autoeventwireup="true" codefile="bindeval.aspx.cs" inherits="ado_bindeval" %>

<!doctype html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


  <asp:gridview id="gridview1" runat="server" autogeneratecolumns="false" datasourceid="sqldatasource1" datakeynames="customerid">
    <columns>
        <asp:templatefield headertext="name" itemstyle-width="150">
            <itemtemplate>
                <asp:textbox id="txtname" runat="server" text='<%# bind("name") %>' />
            </itemtemplate>
        </asp:templatefield>
        <asp:templatefield headertext="country" itemstyle-width="150">
            <itemtemplate>
                <asp:textbox id="txtcountry" runat="server" text='<%# bind("city") %>' />
            </itemtemplate>
        </asp:templatefield>
        <asp:templatefield headertext="" itemstyle-width="100">
            <itemtemplate>
                <asp:linkbutton text="update" runat="server" commandname = "update" />
            </itemtemplate>
        </asp:templatefield>
    </columns>
</asp:gridview>
<asp:sqldatasource id="sqldatasource1" runat="server" connectionstring="<%$ connectionstrings:del_scheduling_toolconnectionstring2 %>"
    selectcommand="select * from [employee]"
    updatecommand="update [employee] set [name] = @name, [city] = @city where [id] = @id" deletecommand="delete from [employee] where [id] = @id" insertcommand="insert into [employee] ([name], [city]) values (@name, @city)">
    <deleteparameters>
        <asp:parameter name="id" type="int32" />
    </deleteparameters>
    <insertparameters>
        <asp:parameter name="name" type="string" />
        <asp:parameter name="city" type="string" />
    </insertparameters>
    <updateparameters>
        <asp:parameter name="name" type="string" />
        <asp:parameter name="city" type="string" />
        <asp:parameter name="id" type="int32" />
    </updateparameters>
</asp:sqldatasource>


        </div>
    </form>
</body>
</html>--%>
