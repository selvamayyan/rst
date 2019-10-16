
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wizardcontrol.aspx.cs" Inherits="execrcise_wizardcontrol" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <asp:wizard ID="Wizard1" runat="server">
    
     <WizardSteps>
      <asp:WizardStep ID="WizardStep1" title="Step 1" runat="server"></asp:WizardStep>
       <asp:WizardStep ID="WizardStep2" title="Step 2" runat="server"></asp:WizardStep>
     </WizardSteps>
     
    </asp:wizard>


        <asp:Wizard ID="Wizard2" runat="server">
            <WizardSteps>
                <asp:WizardStep ID="WizardStep3" runat="server" Title="Step 1">

                ds;flgsdlfg
                dfgdfg
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep4" runat="server" Title="Step 2">
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>

        <asp:MultiView ID="MultiView1" runat="server">


        <asp:View ID="vi" runat="server"></asp:View>
        <asp:View ID="View1" runat="server"></asp:View>
        <asp:View ID="View2" runat="server"></asp:View>
        </asp:MultiView>

    
    </div>
    <asp:Calendar ID="zxcvxcv" runat="server"></asp:Calendar>
    </form>
</body>
</html>
