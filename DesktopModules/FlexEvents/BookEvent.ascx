<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BookEvent.ascx.cs" Inherits="BizModules.FlexEvents.BookEvent" %>

<h2 class="eventtitle">
<asp:Label ID="lblTitle" runat="server"></asp:Label>
</h2>

<div>
    <asp:Label ID="lblWhen" runat="server" CssClass="eventduration"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text=","></asp:Label>
    <asp:Label ID="lblLocationName" runat="server"></asp:Label>
</div>

<div class="lineseparator"></div>

<asp:Panel ID="pnlChooseDate" runat="server">
<p class="Head">
<asp:Label ID="Label5" runat="server" resourcekey="ChooseDate"></asp:Label>
</p>

<div class="datesection">
<asp:RadioButtonList ID="cboChooseDate" runat="server" CssClass="flexradio normalRadioButton date" RepeatLayout="OrderedList"></asp:RadioButtonList>
</div>
<div class="lineseparator"></div>
</asp:Panel>

<div class="billinginfo">
<p class="Head">
    <asp:Label ID="Label4" runat="server" resourcekey="BillingInformation"></asp:Label>
</p>

<div class="namesection yellowbgoff">
<p class="SubHead">
    <asp:Label ID="Label8" runat="server" resourcekey="YourName"></asp:Label>
    <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red"></asp:Label>
</p>
<table cellpadding="2">
    <tr>
        <td width="25%"><asp:TextBox ID="txtFirstName" runat="server" Width="98%"></asp:TextBox></td>
        <td width="25%"><asp:TextBox ID="txtLastName" runat="server" Width="98%"></asp:TextBox></td>
        <td></td>
    </tr>
    <tr class="bottomlabel">
        <td><asp:Label ID="Label6" runat="server" resourcekey="FirstName"></asp:Label>
            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtFirstName" resourcekey="required" ForeColor="Red"></asp:RequiredFieldValidator>
            
                </td>
        <td><asp:Label ID="Label7" runat="server" resourcekey="LastName"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtLastName" resourcekey="required" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td></td>
    </tr>
</table>
</div>

<div class="addresssection yellowbgoff">
<p class="SubHead">
    <asp:Label ID="Label3" runat="server" resourcekey="Address"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
</p>
<table cellpadding="2">
    <tr>
        <td colspan="2"><asp:TextBox ID="txtAddress" runat="server" Width="98%" CssClass="address"></asp:TextBox></td>
    </tr>
    <tr class="bottomlabel">
        <td colspan="2"><asp:Label ID="Label10" runat="server" resourcekey="StreetAddress"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtAddress" resourcekey="required" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td width="50%"><asp:TextBox ID="txtCity" runat="server" Width="98%" CssClass="locality"></asp:TextBox></td>
        <td width="50%">
        <asp:DropDownList ID="cboStates" runat="server" Width="98%" DataTextField="Text" DataValueField="Value" CssClass="region"></asp:DropDownList>
        <asp:TextBox ID="txtState" runat="server" Width="100%" CssClass="region"></asp:TextBox></td>
    </tr>
    <tr class="bottomlabel">
        <td><asp:Label ID="Label11" runat="server" resourcekey="City"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtAddress" resourcekey="required" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td><asp:Label ID="Label12" runat="server" resourcekey="State"></asp:Label></td>
    </tr>
    <tr>
        <td><asp:TextBox ID="txtZipCode" runat="server" Width="98%" CssClass="postalcode"></asp:TextBox></td>
        <td><asp:DropDownList ID="cboCountries" runat="server" Width="98%" DataTextField="Text" DataValueField="Value" AutoPostBack="true" 
                onselectedindexchanged="cboCountries_SelectedIndexChanged" CssClass="country"></asp:DropDownList>
                </td>
    </tr>
    <tr class="bottomlabel">
        <td><asp:Label ID="Label15" runat="server" resourcekey="ZipCode"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtZipCode" resourcekey="required" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td><asp:Label ID="Label17" runat="server" resourcekey="Country"></asp:Label></td>
    </tr>
</table>
</div>

<div class="emailsection yellowbgoff">
<p class="SubHead">
    <asp:Label ID="Label18" runat="server" resourcekey="ContactInformation"></asp:Label>
    <asp:Label ID="Label14" runat="server" Text="*" ForeColor="Red"></asp:Label>
</p>
<table cellpadding="2">
    <tr>
        <td width="50%"><asp:TextBox ID="txtEmail" runat="server" Width="98%"></asp:TextBox></td>
        <td><asp:TextBox ID="txtPhoneNumber" runat="server" Width="98%"></asp:TextBox></td>
    </tr>
    <tr class="bottomlabel">
        <td><asp:Label ID="Label13" runat="server" resourcekey="Email"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtEmail" resourcekey="invalid" ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtEmail" resourcekey="required" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td><asp:Label ID="Label16" runat="server" resourcekey="PhoneNumber"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtPhoneNumber" resourcekey="required" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revUSA" runat="server" 
                ControlToValidate="txtPhoneNumber" resourcekey="invalid"                 
                ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" 
                ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="revOtherCountries" runat="server" 
                ControlToValidate="txtPhoneNumber" resourcekey="invalid" 
                ValidationExpression="^[\+0-9\s\-\(\)]+$" ForeColor="Red"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
</div>

</div>

<div class="lineseparator"></div>

<div class="attendeesinfo">
<p class="Head">
    <asp:Label ID="Label19" runat="server" resourcekey="AttendeesAndCost"></asp:Label>
</p>

<table cellpadding="2">
    <tr>
        <td width="50%">
            <asp:Panel ID="pnlFlatCost" runat="server">
            <div class="SubHead">
                <asp:Label ID="Label20" runat="server" resourcekey="NumberOfAttendees"></asp:Label>
                <asp:Label ID="Label21" runat="server" Text="*" ForeColor="Red"></asp:Label>
            </div>
            <div class="noofattendees">
            <asp:RadioButtonList ID="rdoAttendees" runat="server" CssClass="barstyleradio normalRadioButton green" RepeatLayout="OrderedList"></asp:RadioButtonList>
            </div>
            </asp:Panel>

            <asp:Panel ID="pnlPricingTier" runat="server" Visible="false" CssClass="pricingtier">
            <asp:Repeater ID="rptPricingTier" runat="server" OnItemDataBound="rptPricingTier_ItemDataBound">
                <ItemTemplate>
                    <div>
                    <div class="SubHead">
                        <asp:Label ID="lblTier" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Key")%>'></asp:Label>
                        <asp:Label ID="Label24" runat="server" Text="/"></asp:Label>
                        <asp:Label ID="Label22" runat="server" CssClass="tierprice" Text='<%# FormatMoney(BizModules.FlexEvents.Utility.SafeToDecimal((string)DataBinder.Eval(Container, "DataItem.Value")))%>' data-price='<%# (string)DataBinder.Eval(Container, "DataItem.Value")%>'></asp:Label>
                    </div>

                    <div class="noofattendees">
                    <asp:RadioButtonList ID="rdoAttendees" runat="server" CssClass="barstyleradio normalRadioButton green" RepeatLayout="OrderedList"></asp:RadioButtonList>
                    </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            </asp:Panel>
        </td>
        <td style="vertical-align:top;">
        <table cellpadding="2">
        <tr>
            <td width="50%"><asp:Label ID="Label26" runat="server" resourcekey="SubTotal"></asp:Label></td>
            <td><asp:Label ID="lblSubTotal" runat="server" Text="0" CssClass="totalcost"></asp:Label></td>
        </tr>
        <tr id="trdiscount" runat="server">
            <td><asp:Label ID="Label25" runat="server" resourcekey="Discount"></asp:Label></td>
            <td>
            <asp:Label ID="lblDiscountPolicy" runat="server" Text="0" CssClass="discountpolicy" style="display:none;"></asp:Label>
            <asp:Label ID="lblDiscount" runat="server" Text="0" CssClass="bulkdiscount"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label28" runat="server" resourcekey="SalesTax"></asp:Label>
            </td>
            <td><asp:Label ID="lblSalesTax" runat="server" Text="0" CssClass="salestax"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label29" runat="server" resourcekey="Total"></asp:Label></td>
            <td><asp:Label ID="lblBillTotal" runat="server" Text="0" CssClass="billtotal"></asp:Label></td>
        </tr>
        </table>
        </td>
    </tr>
</table>

<asp:Panel ID="pnlPaymentOptions" runat="server">
<p class="SubHead">
    <asp:Label ID="Label27" runat="server" resourcekey="PaymentOptions"></asp:Label>
</p>

<div class="gatewaysection">
    <asp:RadioButtonList ID="rdoPaymentOptions" runat="server" CssClass="barstyleradio normalRadioButton green" RepeatLayout="OrderedList">
        <asp:ListItem Value="Paypal" Selected="True"></asp:ListItem>
        <asp:ListItem Text="Authorize.Net" Value="AuthorizeDotNet"></asp:ListItem>
        <asp:ListItem Value="Offline"></asp:ListItem>
    </asp:RadioButtonList>
</div>
</asp:Panel>
</div>

<div class="messagesection yellowbgoff">
<p class="SubHead">
    <asp:Label ID="Label23" runat="server" resourcekey="AdditionalMessage"></asp:Label>
</p>
<table cellpadding="2">
    <tr>
        <td><asp:TextBox ID="txtAdditionalMessage" runat="server" TextMode="MultiLine" CssClass="NormalTextBox" Width="98%"></asp:TextBox></td>
    </tr>
</table>
</div>

<ul class="dnnActions dnnClear">
    <li><asp:LinkButton ID="lnkBook" runat="server"
            CssClass="dnnPrimaryAction" resourcekey="BookMe" onclick="lnkBook_Click" /></li>
    <li class="returnlink"><asp:HyperLink ID="lnkReturn" runat="server" cssclass="flexbtn" resourcekey="Return"></asp:HyperLink></li>
</ul>
