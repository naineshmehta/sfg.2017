<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Receipt.ascx.cs" Inherits="BizModules.FlexEvents.Receipt" %>

<h2 class="eventtitle">
<asp:Label ID="lblTitle" runat="server"></asp:Label>
<asp:Label ID="lblStatus" runat="server"></asp:Label>
</h2>

<div class="receipt" style="max-width:768px;">
<p class="Head">
    <asp:Label ID="Label19" runat="server" resourcekey="BookingDetails"></asp:Label>
</p>

<table cellpadding="2" width="100%">
    <tr>
        <td width="18%"><asp:Label ID="Label20" runat="server" resourcekey="Booking#" CssClass="SubHead"></asp:Label></td>
        <td width="32%"><asp:Label ID="lblBookingId" runat="server"></asp:Label></td>
        <td width="18%"><asp:Label ID="lblDateLabel" runat="server" CssClass="SubHead"></asp:Label></td>
        <td><asp:Label ID="lblPaymentDate" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td width="18%">
            <asp:Label ID="Label4" runat="server" resourcekey="Event" CssClass="SubHead"></asp:Label>
        </td>
        <td width="32%">
            <asp:Label ID="lblEventName" runat="server"></asp:Label>
        </td>
        <td width="18%">
            <asp:Label ID="Label7" runat="server" resourcekey="Location" CssClass="SubHead"></asp:Label>
        </td>
        <td width="32%">
            <asp:Label ID="lblLocation" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td width="18%">
            <asp:Label ID="Label6" runat="server" resourcekey="Date/Time" CssClass="SubHead"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblDuration" runat="server"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Label9" runat="server" resourcekey="Address" CssClass="SubHead"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblAddress" runat="server"></asp:Label>
        </td>
    </tr>
</table>

<div class="lineseparator"></div>

<p class="Head">
    <asp:Label ID="Label8" runat="server" resourcekey="BillingInformation"></asp:Label>
</p>

<table cellpadding="0" cellspacing="0" width="100%">
<tr>
    <td width="50%">
        <p><asp:Label ID="lblCustomerName" runat="server"></asp:Label></p>
        <p><asp:Label ID="lblCustomerAddress" runat="server"></asp:Label></p>
        <p><asp:Label ID="lblEmail" runat="server"></asp:Label></p>
        <p><asp:Label ID="lblPhone" runat="server"></asp:Label></p>
    </td>
    <td>
        <table cellpadding="2" width="100%">
        <asp:Repeater ID="rptTierCost" runat="server">
        <ItemTemplate>
            <tr>
            <td width="18%" class="SubHead"><%# DataBinder.Eval(Container, "DataItem.Key") %></td>
            <td><%# "x " + DataBinder.Eval(Container, "DataItem.Value")%></td>
            </tr>
        </ItemTemplate>
        </asp:Repeater>
        <tr><td><asp:Label ID="Label13" runat="server" resourcekey="TotalCost" CssClass="SubHead"></asp:Label></td>
        <td><asp:Label ID="lblTotalCost" runat="server"></asp:Label></td>
        </tr>
        </table>
    </td>
</tr>
</table>

<asp:Panel ID="pnlAdditionalMessage" runat="server">
<div class="lineseparator"></div>
<p class="Head">
    <asp:Label ID="Label2" runat="server" resourcekey="AdditionalMessage"></asp:Label>
</p>
<asp:Label ID="lblAdditionalMessage" runat="server"></asp:Label>
</asp:Panel>

<asp:Panel ID="pnlPaymentRequired" runat="server">
<div class="lineseparator"></div>
<p class="Head">
    <asp:Label ID="Label1" runat="server" resourcekey="PaymentRequired"></asp:Label>
</p>

    <asp:Panel ID="pnlManualPayment" runat="server" class="manualpayment">
    <asp:Label ID="lblManualPaymentInstructions" runat="server"></asp:Label>
    </asp:Panel>

    <asp:panel ID="pnlOtherPaymentOptions" runat="server">
        <asp:Label ID="lblOrPayWith" runat="server" resourcekey="OrPayWith"></asp:Label>
        <asp:Label ID="lblPayWith" runat="server" resourcekey="PayWith" Visible="false"></asp:Label>
        <asp:HyperLink ID="lnkPaypal" runat="server" Text="Paypal"></asp:HyperLink>
        <asp:HyperLink ID="lnkAuthorize" runat="server" Text="Authorize.Net"></asp:HyperLink>
    </asp:panel>
</asp:Panel>

<asp:Panel ID="pnlButtons" runat="server">
<ul class="dnnActions dnnClear">
    <li id="liModifyMyOrder" runat="server"><asp:HyperLink ID="lnkModifyMyOrder" runat="server"
            CssClass="dnnPrimaryAction" resourcekey="ModifyMyOrder" /></li>
    <li id="liPrint" runat="server"><asp:HyperLink ID="lnkPrint" runat="server" Target="_blank" resourcekey="Print" CssClass="dnnPrimaryAction" /></li>
    <li class="returnlink"><asp:HyperLink ID="lnkReturn" runat="server" cssclass="flexbtn" resourcekey="Return"></asp:HyperLink></li>
</ul>
</asp:Panel>

<asp:Panel ID="pnlMarkAsPaid" runat="server">
<div class="lineseparator"></div>
<p class="Head">
    <asp:Label ID="Label3" runat="server" resourcekey="OfflinePayment"></asp:Label>
</p>
<asp:Label ID="lblAdminComment" runat="server"></asp:Label>
<asp:TextBox ID="txtAdminComment" runat="server" TextMode="MultiLine" CssClass="NormalTextBox" Width="50%"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtAdminComment" ForeColor="Red" resourcekey="required"></asp:RequiredFieldValidator>
</asp:Panel>

<asp:Panel ID="pnlViewOrderButtons" runat="server">
<ul class="dnnActions dnnClear">
    <li id="liDelete" runat="server"><asp:LinkButton ID="lnkDelete" runat="server"
            CssClass="dnnPrimaryAction" resourcekey="Delete" 
            onclick="lnkDelete_Click" /></li>
    <li id="liMarkAsPaid" runat="server"><asp:LinkButton ID="lnkMarkAsPaid" runat="server"
            CssClass="dnnPrimaryAction" resourcekey="MarkAsPaid" 
            onclick="lnkMarkAsPaid_Click" /></li>
    <li class="returnlink"><asp:HyperLink ID="lnkViewOrderReturn" runat="server" cssclass="flexbtn" resourcekey="Return"></asp:HyperLink></li>
</ul>
</asp:Panel>

</div>
