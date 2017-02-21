<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FreeEventListSettings.ascx.cs" Inherits="BizModules.FlexEvents.FreeEventListSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<h3>
<asp:Label ID="lblTitle" runat="server" resourcekey="ModuleSettings"></asp:Label>
</h3>

<table class="flextable">
    <tr>
        <td><dnn:label id="Label1" runat="server" resourcekey="LinkedModule" suffix=":"></dnn:label></td>
        <td>
            <asp:DropDownList ID="cboLinkedModule" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td><dnn:label id="Label4" runat="server" resourcekey="ListType" suffix=":"></dnn:label></td>
        <td>
            <asp:DropDownList ID="cboListType" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td><dnn:label id="Label3" runat="server" resourcekey="MaxRecords" suffix=":"></dnn:label></td>
        <td>
            <asp:TextBox ID="txtMaxRecords" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtMaxRecords" resourcekey="required" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtMaxRecords" ErrorMessage="RegularExpressionValidator" 
                ForeColor="Red" ValidationExpression="^[1-9]\d*$" resourcekey="invalid"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td><dnn:label id="Label2" runat="server" resourcekey="MaxColumns" suffix=":"></dnn:label></td>
        <td>
            <asp:RadioButtonList ID="rdoMaxColumns" runat="server" CssClass="barstyleradio normalRadioButton" RepeatLayout="OrderedList">
                <asp:ListItem Value="1"></asp:ListItem>
                <asp:ListItem Value="2"></asp:ListItem>
                <asp:ListItem Value="3"></asp:ListItem>
                <asp:ListItem Value="4"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>


<ul class="dnnActions dnnClear">
    <li><asp:LinkButton ID="lnkUpdate" runat="server" resourcekey="cmdUpdate" 
            CssClass="dnnPrimaryAction" onclick="lnkUpdate_Click" /></li>
    <li class="returnlink">
        <a href="<%= DotNetNuke.Common.Globals.NavigateURL() %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a>
    </li>
</ul>
