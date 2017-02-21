<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditFestival.ascx.cs" Inherits="SFG.Modules.Festival.EditFestival" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<table width="650" cellspacing="0" cellpadding="0" border="0" summary="Edit Table">
	<tr valign="top">
		<td class="SubHead" width="125"><dnn:Label id="lblNewsURL" runat="server" controlname="lblNewsURL" suffix=":"></dnn:Label></td>
		<td>
		    <asp:DropDownList ID="drpNewsCat" runat="server" Width="200"></asp:DropDownList>
			<asp:TextBox id="txtNewsURL" runat="server"/>
		</td>
	</tr>
	<tr valign="top">
		<td class="SubHead" width="125"><dnn:Label id="lblContent" runat="server" controlname="lblContent" suffix=":"></dnn:Label></td>
		<td>
			<asp:TextBox id="txtName" runat="server" Width="500" />
			<asp:RequiredFieldValidator ID="valContent" resourcekey="valContent.ErrorMessage" ControlToValidate="txtName"
				CssClass="NormalRed" Display="Dynamic" ErrorMessage="<br>Festival Name is required" Runat="server" />
		</td>
	</tr>
	<tr valign="top">
		<td class="SubHead" width="125"><dnn:Label id="lblLogoBlog" runat="server" controlname="lblLogoBlog" suffix=":"></dnn:Label></td>
		<td>
		    <asp:DropDownList ID="drpLogoBlog" runat="server" Width="300"></asp:DropDownList>
		</td>
	</tr>
	<tr valign="top">
		<td class="SubHead" width="125"><dnn:Label id="lblFestivalURL" runat="server" controlname="lblFestivalURL" suffix=":"></dnn:Label></td>
		<td>
			<asp:TextBox id="txtFestivalURL" runat="server"  Width="500"/>
		</td>
	</tr>
</table>
<p>
    <asp:linkbutton cssclass="CommandButton" id="cmdUpdate" resourcekey="cmdUpdate" runat="server" borderstyle="none" text="Update" OnClick="cmdUpdate_Click"></asp:linkbutton>&nbsp;
    <asp:linkbutton cssclass="CommandButton" id="cmdCancel" resourcekey="cmdCancel" runat="server" borderstyle="none" text="Cancel" causesvalidation="False" OnClick="cmdCancel_Click"></asp:linkbutton>&nbsp;
    <asp:linkbutton cssclass="CommandButton" id="cmdDelete" resourcekey="cmdDelete" runat="server" borderstyle="none" text="Delete" causesvalidation="False" OnClick="cmdDelete_Click"></asp:linkbutton>&nbsp;
</p>
<dnn:Audit id="ctlAudit" runat="server" />
