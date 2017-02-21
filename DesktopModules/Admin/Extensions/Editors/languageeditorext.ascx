<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Control Language="vb" AutoEventWireup="false" CodeFile="LanguageEditorExt.ascx.vb" Inherits="DotNetNuke.Services.Localization.LanguageEditorExt" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<table cellspacing="2" cellpadding="2" border="0">
	<tr>
		<td class="SubHead"><asp:Label id="Label1" runat="server" resourcekey="Name" /></td>
	</tr>
	<tr>
		<td class="Normal"><asp:Label id="lblName" runat="server" /></td>
	</tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td class="SubHead"><asp:Label id="Label3" runat="server" resourcekey="DefaultValue" /></td>
	</tr>
	<tr>
		<td class="Normal"><asp:Label id="lblDefault" runat="server" /></td>
	</tr>
	<tr valign="top">
		<td><dnn:texteditor id="teContent" runat="server" height="400" width="600" /></td>
	</tr>
</table>
<p>
    <dnn:CommandButton ID="cmdUpdate" runat="server" CssClass="CommandButton" resourcekey="cmdUpdate" ImageUrl="~/images/save.gif" />&nbsp;
    <dnn:CommandButton ID="cmdCancel" runat="server" CssClass="CommandButton" resourcekey="cmdCancel" ImageUrl="~/images/lt.gif" CausesValidation="false" />
</p>
