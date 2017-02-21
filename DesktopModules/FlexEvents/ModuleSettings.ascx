<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModuleSettings.ascx.cs" Inherits="BizModules.FlexEvents.ModuleSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>

<%@ Register src="Controls/RolePicker.ascx" tagname="RolePicker" tagprefix="uc2" %>

<uc1:Header ID="Header1" runat="server" />

<asp:ValidationSummary ID="valSummary" runat="server" EnableClientScript="true" 
        DisplayMode="BulletList" CssClass="redbox" />

<div id="modulesettings" class="dnnForm modulesettings">
    <ul class="dnnAdminTabNav dnnClear">
        <li><a href="#divBasic"><asp:label id="Label17" runat="server" resourcekey="GeneralOptions"></asp:label></a></li>
        <li><a href="#divPermission"><asp:label id="Label3" runat="server" resourcekey="Permission"></asp:label></a></li>
        <li><a href="#divPayment"><asp:label id="Label18" runat="server" resourcekey="PaymentOptions"></asp:label></a></li>
        <li><a href="#divSubCalendar"><asp:label id="Label1" runat="server" resourcekey="SubCalendar"></asp:label></a></li>
    </ul>
    <div id="divBasic">
        <table class="flextable">
            <tr>
                <td><dnn:label id="Label21" runat="server" resourcekey="ListView" suffix=":"></dnn:label></td>
                <td>
                    <asp:DropDownList id="rdoListView" runat="server" CssClass="barstyleradio normalRadioButton" 
                        RepeatLayout="OrderedList" AutoPostBack="True" 
                        onselectedindexchanged="rdoListView_SelectedIndexChanged" >
                                </asp:DropDownList>
                </td>
            </tr>
            <tr id="trListViewPageSize" runat="server">
                <td><dnn:label id="Label2" runat="server" resourcekey="ListViewPageSize" suffix=":"></dnn:label></td>
                <td>
                    <asp:TextBox ID="txtListViewPageSize" runat="server" Width="100px" type="number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" 
                        ControlToValidate="txtListViewPageSize" resourcekey="PageSizeRequired" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rev2" runat="server" 
                        ControlToValidate="txtListViewPageSize" resourcekey="PageSizeInvalid" Display="None" 
                        ValidationExpression="^-*[0-9,\.]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr id="trMaxColumns" runat="server">
                <td><dnn:label id="Label23" runat="server" resourcekey="MaxColumns" suffix=":"></dnn:label></td>
                <td>
                    <asp:DropDownList id="rdoMaxColumns" runat="server" CssClass="barstyleradio normalRadioButton" RepeatLayout="OrderedList" >
                                    <asp:ListItem Value="1"></asp:ListItem>
                                    <asp:ListItem Value="2"></asp:ListItem>
                                    <asp:ListItem Value="3" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="4"></asp:ListItem>
                                </asp:DropDownList>
                </td>
            </tr>
            <tr id="trMonthFilter" runat="server">
                <td><dnn:label id="lblMonthFilter" runat="server" resourcekey="MonthFilter" suffix=":"></dnn:label></td>
                <td>
                    <asp:CheckBox ID="chkMonthFilter" runat="server" resourcekey="YesNo" 
                        CssClass="flextoggle normalCheckBox"  AutoPostBack="true" />
                </td>
            </tr>
            <tr>
                <td><dnn:label id="lblCustomViewEventPage" runat="server" resourcekey="CustomViewEventPage" suffix=":"></dnn:label></td>
                <td>
                    <asp:CheckBox ID="chkCustomViewEventPage" runat="server" resourcekey="YesNo" 
                        CssClass="flextoggle normalCheckBox"  AutoPostBack="true" 
                        oncheckedchanged="chkCustomViewEventPage_CheckedChanged"/>
                </td>
            </tr>
            <tr id="trViewEventPage" runat="server">
                <td><dnn:label id="lblViewEventPage" runat="server" resourcekey="ViewEventPage" suffix=":"></dnn:label></td>
                <td>
                    <asp:dropdownlist id="cboViewEventPage" runat="server" Width="300px">
                    </asp:dropdownlist></td>
            </tr>
            <tr>
                <td><dnn:label id="Label6" runat="server" resourcekey="AllowReviews" suffix=":"></dnn:label></td>
                <td>
                    <asp:DropDownList ID="rdoAllowReviews" runat="server" RepeatLayout="OrderedList" CssClass="barstyleradio normalRadioButton acceptreviews">
                        <asp:ListItem Value="AllUsers" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="RegisteredUsers"></asp:ListItem>
                        <asp:ListItem Value="CustomersOnly"></asp:ListItem>
                        <asp:ListItem Value="Nobody"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="lblReviewNeedApproval" runat="server" resourcekey="ReviewNeedApproval" suffix=":"></dnn:label></td>
                <td>
                    <asp:CheckBox ID="chkReviewNeedApproval" runat="server" resourcekey="YesNo" 
                        CssClass="flextoggle normalCheckBox"  />
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label44" runat="server" resourcekey="MaxCategories" suffix=":"></dnn:label></td>
                <td>
                    <asp:DropDownList id="cboMaxCategories" runat="server" CssClass="barstyleradio normalRadioButton" 
                        RepeatLayout="OrderedList" >
                                    <asp:ListItem Value="1"></asp:ListItem>
                                    <asp:ListItem Value="2"></asp:ListItem>
                                    <asp:ListItem Value="3"></asp:ListItem>
                                    <asp:ListItem Value="4"></asp:ListItem>
                                    <asp:ListItem Value="5"></asp:ListItem>
                                </asp:DropDownList>
                </td>
            </tr>
            <tr id="trFriendlyURL" runat="server">
                <td><dnn:label id="lblFriendlyURL" runat="server" resourcekey="FriendlyURL" suffix=":"></dnn:label></td>
                <td>
                    <asp:CheckBox ID="chkFriendlyURL" runat="server" resourcekey="YesNo" 
                        CssClass="flextoggle normalCheckBox"  />
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label5" runat="server" resourcekey="BookingOpens" suffix=":"></dnn:label></td>
                <td>
                    <asp:TextBox ID="txtBookingOpens" runat="server" Width="100px" type="number"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="txtBookingOpens" resourcekey="BookingOpensInvalid" Display="None" 
                        ValidationExpression="^-*[0-9,\.]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label24" runat="server" resourcekey="MapViewHeight" suffix=":"></dnn:label></td>
                <td>
                    <asp:TextBox ID="txtMapViewHeight" runat="server" Width="100px" type="number"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtMapViewHeight" resourcekey="MapViewHeightInvalid" Display="None" 
                        ValidationExpression="^-*[0-9,\.]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label4" runat="server" resourcekey="Currency" suffix=":"></dnn:label></td>
                <td>
                    <asp:DropDownList id="cboCurrency" runat="server" CssClass="barstyleradio normalRadioButton" 
                        RepeatLayout="OrderedList" >
                                    <asp:ListItem Value="USD"></asp:ListItem>
                                    <asp:ListItem Value="EUR"></asp:ListItem>
                                    <asp:ListItem Value="CAD"></asp:ListItem>
                                    <asp:ListItem Value="GBP"></asp:ListItem>
                                    <asp:ListItem Value="JPY"></asp:ListItem>
                                    <asp:ListItem Value="AUD"></asp:ListItem>
                                </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label8" runat="server" resourcekey="SalesTax" suffix=":"></dnn:label></td>
                <td>
                    <asp:DropDownList id="rdoSalesTax" runat="server" CssClass="barstyleradio normalRadioButton" 
                        RepeatLayout="OrderedList" 
                        onselectedindexchanged="rdoSalesTax_SelectedIndexChanged" 
                        AutoPostBack="True">
                                    <asp:ListItem Value="No" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="Yes"></asp:ListItem>
                                    <asp:ListItem Value="HomeStateOnly"></asp:ListItem>
                                </asp:DropDownList>
                </td>
            </tr>
            <tr id="trHomeCountry" runat="server">
                <td><dnn:label id="Label9" runat="server" resourcekey="HomeCountry" suffix=":"></dnn:label></td>
                <td>
                    <asp:DropDownList ID="cboCountries" runat="server" Width="300px" DataTextField="Text" DataValueField="Value" AutoPostBack="true" 
                        onselectedindexchanged="cboCountries_SelectedIndexChanged" CssClass="country"></asp:DropDownList>
            
                </td>
            </tr>
            <tr id="trHomeState" runat="server">
                <td><dnn:label id="Label10" runat="server" resourcekey="HomeState" suffix=":"></dnn:label></td>
                <td>
                    <asp:DropDownList ID="cboStates" runat="server" Width="300px" 
                        DataTextField="Text" DataValueField="Value" CssClass="region" ></asp:DropDownList>
                    <asp:TextBox ID="txtState" runat="server" Width="100%" CssClass="region"></asp:TextBox>
                </td>
            </tr>
            <tr id="trTaxRate" runat="server">
                <td><dnn:label id="Label7" runat="server" resourcekey="TaxRate" suffix=":"></dnn:label></td>
                <td>
            
                    <asp:TextBox ID="txtTaxRate" runat="server" Width="100px"></asp:TextBox>
                    %<asp:RequiredFieldValidator ID="rfv1" runat="server" 
                        ControlToValidate="txtTaxRate" ErrorMessage="*" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rev1" runat="server" 
                        ControlToValidate="txtTaxRate" ErrorMessage="*" Display="None" 
                        ValidationExpression="^-*[0-9,\.]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
    </div>
    <div id="divPermission">
        <table class="flextable">
            <tr>
                <td><dnn:label id="lblViewPermission" runat="server" resourcekey="ViewPermission" suffix=":"></dnn:label></td>
                <td>
                    <asp:CheckBox ID="chkViewPermission" runat="server" resourcekey="YesNo" 
                        CssClass="flextoggle normalCheckBox"  />
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label22" runat="server" resourcekey="AddEventRoles"></dnn:label></td>
                <td>
                    <uc2:RolePicker ID="rpAddEventRoles" runat="server" />
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label31" runat="server" resourcekey="AddMetadata" suffix=":"></dnn:label></td>
                <td><asp:CheckBox ID="chkAddMetadata" runat="server" resourcekey="YesNo" 
                        CssClass="flextoggle normalCheckBox" /></td>
            </tr>
            <tr>
                <td><dnn:label id="Label29" runat="server" resourcekey="ShareLocations" suffix=":"></dnn:label></td>
                <td><asp:CheckBox ID="chkShareLocations" runat="server" resourcekey="EnableDisable" 
                        CssClass="flextoggle normalCheckBox" /></td>
            </tr>
            <tr>
                <td><dnn:label id="Label30" runat="server" resourcekey="ShowRegistrationTab" suffix=":"></dnn:label></td>
                <td><asp:CheckBox ID="chkShowRegistrationTab" runat="server" resourcekey="YesNo" 
                        CssClass="flextoggle normalCheckBox" /></td>
            </tr>
            <tr>
                <td><dnn:label id="Label25" runat="server" resourcekey="ManageRoles"></dnn:label></td>
                <td>
                    <uc2:RolePicker ID="rpManageRoles" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <div id="divPayment">
        <table class="flextable">
            <tr>
                <td><dnn:label id="Label19" runat="server" resourcekey="Paypal" suffix=":"></dnn:label></td>
                <td><asp:CheckBox ID="chkPaypal" runat="server" resourcekey="EnableDisable" 
                        CssClass="flextoggle normalCheckBox"  AutoPostBack="true" 
                        oncheckedchanged="chkPaypal_CheckedChanged"/></td>
            </tr>
            <tr id="trpaypalprocessor" runat="server">
                <td><dnn:label id="Label12" runat="server" resourcekey="PaypalProcessor" suffix=":"></dnn:label></td>
                <td>
                    <asp:TextBox ID="txtProcessId" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtProcessId" resourcekey="ProcessorIdInvalid" Display="None" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtProcessId" resourcekey="ProcessorIdRequired" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label20" runat="server" resourcekey="AuthorizeNet" suffix=":"></dnn:label></td>
                <td><asp:CheckBox ID="chkAuthorizeDotNet" runat="server" resourcekey="EnableDisable" 
                        CssClass="flextoggle normalCheckBox"  AutoPostBack="true" 
                        oncheckedchanged="chkAuthorizeDotNet_CheckedChanged" /></td>
            </tr>
            <tr id="trapilogin" runat="server">
                <td><dnn:label id="Label13" runat="server" resourcekey="ApiLogin" suffix=":"></dnn:label></td>
                <td>
                    <asp:TextBox ID="txtApiLogin" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtApiLogin" resourcekey="ApiLoginRequired" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr id="trtransactionkey" runat="server">
                <td><dnn:label id="Label14" runat="server" resourcekey="TransactionKey" suffix=":"></dnn:label></td>
                <td>
                    <asp:TextBox ID="txtTransactionKey" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="txtTransactionKey" resourcekey="TransactionKeyRequired" 
                        Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr id="trmerchanthash" runat="server">
                <td><dnn:label id="Label15" runat="server" resourcekey="MerchantHash" suffix=":"></dnn:label></td>
                <td>
                    <asp:TextBox ID="txtMerchantHash" runat="server" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtMerchantHash" resourcekey="MerchantHashRequired" 
                        Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label11" runat="server" resourcekey="ManualPayment" suffix=":"></dnn:label></td>
                <td>
                    <asp:CheckBox ID="chkManualPayment" runat="server" resourcekey="EnableDisable" 
                        CssClass="flextoggle normalCheckBox"  AutoPostBack="true" 
                        oncheckedchanged="chkManualPayment_CheckedChanged" />
                </td>
            </tr>
            <tr id="trmanualoptions" runat="server">
                <td><dnn:label id="Label16" runat="server" resourcekey="PaymentInstructions" suffix=":"></dnn:label></td>
                <td>
                    <asp:TextBox ID="txtPaymentInstructions" runat="server" TextMode="MultiLine" CssClass="NormalTextBox" Width="300px" Height="50px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="txtPaymentInstructions" resourcekey="PaymentInstructionsRequired" 
                        Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
    <div id="divSubCalendar">
        <table class="flextable">
        <tr id="trsubcalendars" runat="server">
            <td><dnn:label id="Label34" runat="server" resourcekey="EventModules" suffix=":"></dnn:label></td>
            <td>
                <asp:DropDownList ID="cboEventModules" runat="server" DataTextField="ModuleTitle" DataValueField="ModuleId"></asp:DropDownList>
                <ul id="selectedCategories">
                </ul>
            </td>
        </tr>
        <tr id="trparentcalendar" runat="server">
                <td><dnn:label id="Label35" runat="server" resourcekey="ParentCalendar" suffix=":"></dnn:label></td>
                <td>
                    <asp:Label ID="lblParentCalendar" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</div>

<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery("#<%=cboEventModules.ClientID %>").categorypicker({ max: 10 });
    });
</script>


<ul class="dnnActions dnnClear">
    <li><asp:LinkButton ID="lnkUpdate" runat="server" resourcekey="cmdUpdate" 
            CssClass="dnnPrimaryAction" onclick="lnkUpdate_Click" /></li>
    <li class="returnlink">
        <a href="<%= DotNetNuke.Common.Globals.NavigateURL() %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a>
    </li>
</ul>
