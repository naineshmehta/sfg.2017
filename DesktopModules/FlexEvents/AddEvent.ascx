<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddEvent.ascx.cs" Inherits="BizModules.FlexEvents.AddEvent" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="Controls/RolePicker.ascx" tagname="RolePicker" tagprefix="uc3" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Url" Src="~/controls/URLControl.ascx" %> 

<uc1:Header ID="Header1" runat="server" />

<h1><asp:Label ID="lblTitle" runat="server"></asp:Label></h1>

<asp:ValidationSummary ID="valSummary" runat="server" EnableClientScript="true" 
        DisplayMode="BulletList" CssClass="redbox" />

<asp:Panel ID="pnlAddEvent" runat="server">
<div id="addevent" class="dnnForm addevent">
    <ul class="dnnAdminTabNav dnnClear">
        <li><a href="#divBasic"><asp:Label ID="Label12" runat="server" resourcekey="Basic"></asp:Label></a></li>
        <li><a href="#divDescription"><asp:Label ID="Label40" runat="server" resourcekey="Description"></asp:Label></a></li>
        <li><a href="#divRecurring"><asp:Label ID="Label41" runat="server" resourcekey="Recurring"></asp:Label></a></li>
        <li><a href="#divRegistration"><asp:Label ID="Label42" runat="server" resourcekey="Registration"></asp:Label></a></li>
        <li><a href="#divOther"><asp:Label ID="Label46" runat="server" resourcekey="OtherOptions"></asp:Label></a></li>
    </ul>
    <div id="divBasic">
        <table class="flextable">
            <tr>
                <td><dnn:label id="Label3" runat="server" resourcekey="Category" suffix=":"></dnn:label></td>
                <td>
                    <asp:DropDownList ID="cboCategory" runat="server" DataTextField="Category" DataValueField="ItemId" Width="300px">
                    </asp:DropDownList>
                    <asp:CheckBoxList ID="chkCategories" runat="server" DataTextField="Category" DataValueField="ItemId" RepeatColumns="3" CssClass="multicat"></asp:CheckBoxList>
                    <asp:CustomValidator ID="CustomValidator4" runat="server" resourcekey="CategoryRequired" Display="none" ClientValidationFunction="validatecategories"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label10" runat="server" resourcekey="Location" suffix=":"></dnn:label></td>
                <td>
                    <asp:DropDownList ID="cboLocations" runat="server" DataTextField="Name" DataValueField="ItemId" Width="300px" CssClass="locationlist">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="cboLocations" Display="None" resourcekey="LocationRequired"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label5" runat="server" resourcekey="EventName" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtEventName" runat="server" Width="300px" CssClass="required"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtEventName" Display="None" resourcekey="EventNameRequired"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label6" runat="server" resourcekey="Summary" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtSummary" runat="server" TextMode="MultiLine" CssClass="NormalTextBox" Width="300px" Height="80px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><dnn:label id="Label19" runat="server" resourcekey="StartDateTime" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtEventStartDate" runat="server" Width="150px" suffix=":" CssClass="startdate"></asp:TextBox>
                    <asp:TextBox ID="txtStartTime" runat="server" Width="70" CssClass="starttime"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtEventStartDate" Display="None" resourcekey="StartDateRequired"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label16" runat="server" resourcekey="EndDateTime" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtEventEndDate" runat="server" Width="150px" CssClass="enddate"></asp:TextBox>
                    <asp:TextBox ID="txtEndTime" runat="server" Width="70" class="endtime"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtEventEndDate" Display="None" resourcekey="EndDateRequired"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label15" runat="server" resourcekey="EventLasts" suffix="?"></dnn:label></td>
                <td><asp:CheckBox ID="chkLastAllDay" runat="server" CssClass="flextoggle normalCheckBox allday" resourcekey="YesNo" Checked="true" /></td>
                <asp:CustomValidator ID="CustomValidator3" runat="server" resourcekey="EventTimeRequired" Display="none" ClientValidationFunction="validatetimes"></asp:CustomValidator>
            </tr>
            <tr>
                <td><dnn:label id="Label9" runat="server" resourcekey="Featured" suffix=":"></dnn:label></td>
                <td><asp:CheckBox ID="chkFeatured" runat="server" CssClass="flextoggle normalCheckBox" resourcekey="YesNo" /></td>
            </tr>
            <tr id="trPending" runat="server">
                <td><dnn:label id="Label11" runat="server" resourcekey="Pending" suffix=":"></dnn:label></td>
                <td><asp:CheckBox ID="chkPending" runat="server" CssClass="flextoggle normalCheckBox" resourcekey="YesNo" /></td>
            </tr>
        </table>
    </div>
    <div id="divDescription">
        <dnn:TextEditor ID="txtDescription" runat="server" DefaultMode="Rich" ChooseMode="False" HtmlEncode="False"/>
    </div>
    <div id="divRecurring">
        <table class="flextable">
            <tr>
                <td><dnn:label id="Label18" runat="server" resourcekey="RecurringEvent" suffix=":"></dnn:label></td>
                <td><asp:CheckBox ID="chkRecurring" runat="server" CssClass="flextoggle normalCheckBox recurring" resourcekey="YesNo" /></td>
            </tr>
            <tr id="trpattern" class="recurringoptions">
                <td><dnn:label id="Label20" runat="server" resourcekey="RecurringPattern" suffix=":"></dnn:label></td>
                <td>
                    <asp:RadioButtonList ID="rdoRecurringPattern" runat="server" RepeatLayout="OrderedList" CssClass="barstyleradio normalRadioButton recurringpattern">
                        <asp:ListItem Text="Periodically" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Weekly" Value="3" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Monthly" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Annually" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr id="trperiodic" class="recurringoptions">
                <td><dnn:label id="Label21" runat="server" resourcekey="Every" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtFrequency" runat="server" Width="60" CssClass="required"></asp:TextBox><asp:label id="Label22" runat="server" resourcekey="days"></asp:label>
                    <asp:RequiredFieldValidator ID="rfv4" runat="server" 
                        ControlToValidate="txtFrequency" Display="None" ValidationGroup="frequency" 
                        resourcekey="FrequencyRequired"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rev1" runat="server" 
                        ControlToValidate="txtFrequency" Display="None" ValidationGroup="frequency" resourcekey="InvalidFrequency" 
                        ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr id="trweek" class="recurringoptions">
                <td><dnn:label id="Label25" runat="server" resourcekey="Every" suffix=":"></dnn:label></td>
                <td>
                    <asp:CheckBoxList ID="rdoDaysOfWeek" runat="server" RepeatDirection="Horizontal" CssClass="dayofweek">
                        <asp:ListItem Text="Sun" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Mon" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Tue" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Wed" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Thu" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Fri" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Sat" Value="6"></asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr id="trmonth" class="recurringoptions">
                <td><dnn:label id="Label23" runat="server" resourcekey="Every" suffix=":"></dnn:label></td>
                <td><asp:RadioButtonList ID="rdoMonthlyPattern" runat="server" RepeatLayout="OrderedList" CssClass="barstyleradio normalRadioButton monthlypattern">
                        <asp:ListItem Value="dayofweekofmonth" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="dayofmonth"></asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
            </tr>
            <tr id="trannual" class="recurringoptions">
                <td><dnn:label id="Label24" runat="server" resourcekey="Every" suffix=":"></dnn:label></td>
                <td><asp:RadioButtonList ID="rdoAnnualPattern" runat="server" RepeatLayout="OrderedList" CssClass="barstyleradio normalRadioButton annualpattern">
                        <asp:ListItem Value="dayofyear" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="dayofweekofyear"></asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
            </tr>
            <tr class="recurringoptions">
                <td><dnn:label id="Label28" runat="server" resourcekey="StopAfter" suffix=":"></dnn:label></td>
                <td>
                    <asp:TextBox ID="txtLastRecurring" runat="server" Width="150px" suffix=":" CssClass="lastrecurring"></asp:TextBox>
                </td>
            </tr>
            <tr id="trwhitelist" class="recurringoptions">
                <td><dnn:label id="Label26" runat="server" resourcekey="SpecialRecurringDates" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="TextBox4" runat="server" Width="150px" CssClass="specialdates"></asp:TextBox>
                        <asp:TextBox ID="txtWhiteList" runat="server" CssClass="whitelist" style="display: none;"></asp:TextBox>
                </td>
            </tr>
            <tr id="trblacklist" class="recurringoptions">
                <td><dnn:label id="Label27" runat="server" resourcekey="BlackoutDates" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="TextBox10" runat="server" Width="150px" CssClass="specialdates"></asp:TextBox>
                        <asp:TextBox ID="txtBlackList" runat="server" CssClass="blacklist" style="display: none;"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <div id="divRegistration">
        <table class="flextable">
            <tr>
                <td><dnn:label id="Label4" runat="server" resourcekey="RequireRegistration" suffix=":"></dnn:label></td>
                <td><asp:CheckBox ID="chkRequireBooking" runat="server" CssClass="flextoggle normalCheckBox requireregistration" resourcekey="YesNo" /></td>
            </tr>
            <tr class="registrationoptions">
                <td><dnn:label id="Label44" runat="server" resourcekey="RolesCanBook" suffix=":"></dnn:label></td>
                <td>
                    <uc3:RolePicker ID="RolePicker2" runat="server" DisplayAllUsers="True" DefaultRoles="Registered Users" />
                </td>
            </tr>
            <tr class="registrationoptions">
                <td><dnn:label id="Label29" runat="server" resourcekey="MaxAttendeesPerBooking" suffix=":"></dnn:label></td>
                <td><asp:DropDownList ID="cboMaxAttendeesPerBooking" runat="server" Width="80px">
                        <asp:ListItem Value="1"></asp:ListItem>
                        <asp:ListItem Value="2"></asp:ListItem>
                        <asp:ListItem Value="3"></asp:ListItem>
                        <asp:ListItem Value="4"></asp:ListItem>
                        <asp:ListItem Value="5"></asp:ListItem>
                        <asp:ListItem Value="6"></asp:ListItem>
                        <asp:ListItem Value="7"></asp:ListItem>
                        <asp:ListItem Value="8"></asp:ListItem>
                        <asp:ListItem Value="9"></asp:ListItem>
                        <asp:ListItem Value="10"></asp:ListItem>
                        <asp:ListItem Value="12"></asp:ListItem>
                        <asp:ListItem Value="15"></asp:ListItem>
                        <asp:ListItem Value="20"></asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr class="registrationoptions">
                <td><dnn:label id="Label8" runat="server" resourcekey="MaxOccupancy" suffix=":"></dnn:label></td>
                <td>
                <table cellpadding="0" cellspacing="0"><tr><td>
                    <asp:TextBox ID="txtMaxOccupancy" runat="server" Width="80px" CssClass="required"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtMaxOccupancy" Display="None" ValidationGroup="occupancy" resourcekey="InvalidOccurpancy" 
                        ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                </td><td>
                    <asp:RadioButtonList ID="rdoOccupancyType" runat="server" RepeatLayout="OrderedList" CssClass="barstyleradio normalRadioButton">
                        <asp:ListItem Text="Attendees" Value="False" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Bookings" Value="True"></asp:ListItem>
                        </asp:RadioButtonList>
                </td></tr></table>
                </td>
            </tr>
            <tr class="registrationoptions">
                <td><dnn:label id="Label30" runat="server" resourcekey="ChargeBy" suffix=":"></dnn:label></td>
                <td><asp:RadioButtonList ID="rdoChargeBy" runat="server" RepeatLayout="OrderedList" CssClass="barstyleradio normalRadioButton chargeby">
                        <asp:ListItem Value="Free"></asp:ListItem>
                        <asp:ListItem Value="Attendee" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="Booking"></asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
            </tr>
            <tr id="trcostperbooking" class="registrationoptions">
                <td><dnn:label id="Label31" runat="server" resourcekey="CostPerBooking" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtCostPerBooking" runat="server" Width="80px" CssClass="required" />
                    <asp:RequiredFieldValidator ID="rfv5" runat="server" 
                        ControlToValidate="txtCostPerBooking" Display="None" ValidationGroup="flatcost" 
                        resourcekey="FlatCostRequired"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rev2" runat="server" 
                        ControlToValidate="txtCostPerBooking" Display="None" 
                        ValidationGroup="flatcost" resourcekey="InvalidFlatCost" 
                        ValidationExpression="^-*[0-9,\.]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr id="trcostperattendee" class="registrationoptions">
                <td><dnn:label id="Label32" runat="server" resourcekey="CostPerAttendee" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtPricingTiers" runat="server" CssClass="pricingtiers" style="display: none;" />
                <table id="tblPriceTiers" class="flexlist" width="360" cellspacing="0" cellpadding="5">
                    <tr class="th nodrop nodrag">
                        <th></th>
                        <th><asp:label id="Label33" runat="server" resourcekey="TierName"></asp:label></th>
                        <th><asp:label id="Label36" runat="server" resourcekey="Cost"></asp:label></th>
                    </tr>
                    <tr id="1">
                        <td class="updown textcenter" style="width:20px;"></td>
                        <td><input type="text" value="Adults" style="width:150px;" class="tiername" />
                        <asp:CustomValidator ID="CustomValidator1" runat="server" resourcekey="FirstTierRequired" Display="none" ClientValidationFunction="serializepriceingtiers"></asp:CustomValidator>
                        </td>
                        <td><input type="text" value="" style="width:60px;" class="price" /></td>
                    </tr>
                    <tr id="2" class="alt">
                        <td class="updown textcenter"></td>
                        <td><input type="text" value="" style="width:150px;" class="tiername" /></td>
                        <td><input type="text" value="" style="width:60px;" class="price" /></td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr id="trbulkdiscount" class="registrationoptions">
                <td><dnn:label id="Label37" runat="server" resourcekey="BulkDiscount" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtBulkDiscount" runat="server" CssClass="bulkdiscount" style="display: none;" />
                <table id="tblDiscounts" class="flexlist" width="360" cellspacing="0" cellpadding="5">
                    <tr class="th nodrop nodrag">
                        <th><asp:label id="Label38" runat="server" resourcekey="Attendees"></asp:label></th>
                        <th><asp:label id="Label39" runat="server" resourcekey="Discount"></asp:label></th>
                    </tr>
                    <tr>
                        <td>2+</td>
                        <td><input type="text" value="" style="width:60px;" /></td>
                    </tr>
                    <tr class="alt">
                        <td>3+</td>
                        <td><input type="text" value="" style="width:60px;" /></td>
                    </tr>
                    <tr>
                        <td>4+</td>
                        <td><input type="text" value="" style="width:60px;" /></td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>
    </div>
    <div id="divOther">
        <table class="flextable">
            <tr>
                <td><dnn:label id="Label45" runat="server" resourcekey="EventLogo" suffix=":"></dnn:label></td>
                <td>
                    <div class="urlcontrol">
                        <dnn:Url ID="urlLogo" runat="server" FileFilter="jpg,gif,png,jpeg" ShowUrls="False" ShowTabs="False" ShowLog="False" ShowTrack="False" Required="False" UrlType="F" />
                    </div>
                </td>
            </tr>
            <tr id="trAdvancedReminder" runat="server" class="eventreminder">
                <td><dnn:label id="Label34" runat="server" resourcekey="AdvanedReminder" suffix=":"></dnn:label></td>
                <td>
                    <asp:DropDownList ID="cboAdvancedReminder" runat="server" Width="300px">
                        <asp:ListItem Text="2HourAgo" Value="2"></asp:ListItem>
                        <asp:ListItem Text="4HourAgo" Value="4"></asp:ListItem>
                        <asp:ListItem Text="6HourAgo" Value="6"></asp:ListItem>
                        <asp:ListItem Text="8HourAgo" Value="8"></asp:ListItem>
                        <asp:ListItem Text="12HourAgo" Value="12"></asp:ListItem>
                        <asp:ListItem Text="1DayAgo" Value="24" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="2DayAgo" Value="48"></asp:ListItem>
                        <asp:ListItem Text="3DayAgo" Value="72"></asp:ListItem>
                        <asp:ListItem Text="5DayAgo" Value="120"></asp:ListItem>
                        <asp:ListItem Text="7DayAgo" Value="168"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr id="trVisibleTo" runat="server">
                <td><dnn:label id="Label1" runat="server" resourcekey="VisibleTo" suffix=":"></dnn:label></td>
                <td>
                    <uc3:RolePicker ID="RolePicker1" runat="server" DisplayAllUsers="True" DefaultRoles="All Users" />
                    <asp:CustomValidator ID="CustomValidator2" runat="server" resourcekey="ViewRolesRequired" Display="none" ClientValidationFunction="validateviewrolesandothers"></asp:CustomValidator>
                </td>
            </tr>
            <tr id="trPostToGroup" runat="server">
                <td><dnn:label id="Label49" runat="server" resourcekey="PostToGroup" suffix=":"></dnn:label></td>
                <td>
                    <asp:CheckBoxList ID="chkSocialGroups" runat="server" DataTextField="RoleName" DataValueField="RoleID" CssClass="Normal" RepeatColumns="3"></asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td><dnn:label id="Label14" runat="server" resourcekey="PhoneNumber" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtPhoneNumber" runat="server" Width="300px" CssClass="placephone"></asp:TextBox></td>
            </tr>
            <tr>
                <td><dnn:label id="Label13" runat="server" resourcekey="EmailAddress" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtEmailAddress" runat="server" Width="300px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><dnn:label id="Label7" runat="server" resourcekey="Facebook" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtFacebook" runat="server" Width="300px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><dnn:label id="Label17" runat="server" resourcekey="Twitter" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtTwitter" runat="server" Width="300px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><dnn:label id="Label2" runat="server" resourcekey="SEOKeywords" suffix=":"></dnn:label></td>
                <td><asp:TextBox ID="txtSEOKeywords" runat="server" TextMode="MultiLine" Width="300px" Height="50px"></asp:TextBox></td>
            </tr>
        </table>
    </div>
</div>

<ul class="dnnActions dnnClear">
    <li><asp:LinkButton ID="lnkUpdate" runat="server" resourcekey="cmdUpdate" 
            CssClass="dnnPrimaryAction" onclick="lnkUpdate_Click" /></li>
    <li id="liDelete" runat="server"><asp:LinkButton ID="lnkDelete" runat="server" resourcekey="cmdDelete" 
            CssClass="dnnSecondaryAction" onclick="lnkDelete_Click" CausesValidation="false" /></li>
    <li class="returnlink">
        <asp:PlaceHolder ID="phReturn" runat="server">
        <a href="<%= EditUrl("Events") %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a>
        </asp:PlaceHolder>
    </li>
</ul>
</asp:Panel>