<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchSettings.ascx.cs" Inherits="BizModules.FlexEvents.SearchSettings" %>
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
        <td><dnn:label id="Label3" runat="server" resourcekey="AdditionalViews" suffix=":"></dnn:label></td>
        <td>
            <asp:textbox ID="txtAdditionalViews" runat="server" Width="300px"></asp:textbox>
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
