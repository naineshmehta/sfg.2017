<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Control language="vb" CodeBehind="Forum_PMAdd.ascx.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.Modules.Forum.PMAdd" %>
<link href="<%= ForumConfig.Css() %>" type="text/css" rel="stylesheet" />
	<table class="Forum_Container" id="tblMain" cellspacing="0" cellpadding="0" width="100%"
		align="center">
		<tr id="rowOldPost" runat="server">
			<td valign="top" align="left">
				<table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
					<tr>
						<td class="Forum_AltHeader" valign="top" align="left"><dnn:sectionhead id="dshOriginalPost" runat="server" resourcekey="OriginalPost" section="tblOriginalPost"
								isExpanded="True" cssclass="Forum_AltHeaderText"></dnn:sectionhead></td>
					</tr>
				</table>
				<table id="tblOriginalPost" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
					<tr>
						<td>
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
									<td align="left" class="Forum_Row_AdminL" width="200"><span class="Forum_Row_AdminText"><dnn:label id="plAuthor" runat="server" suffix=":" controlname="lblAuthor"></dnn:label>
										</span></td>
									<td valign="top" class="Forum_Row_AdminR" align="left" width="80%"><asp:HyperLink id="hlAuthor" runat="server" CssClass="Forum_Profile" Target="_blank"></asp:HyperLink>
										<asp:textbox id="txtToUserID" runat="server" cssclass="Forum_NormalTextBox" ReadOnly="True" maxlength="100"
											Visible="False"></asp:textbox></td>
								</tr>
                                <tr>
                                    <td align="left" class="Forum_Row_AdminL" width="200" valign="top"><span class="Forum_Row_AdminText">
                                        <dnn:Label ID="plOriginalMessage" runat="server" ControlName="lblMessage" suffix=":" /></span>
                                    </td>
                                    <td align="left" class="Forum_Row_AdminR" valign="top" width="80%">
                                        <asp:label id="lblMessage" runat="server" CssClass="Forum_Normal"></asp:label></td>
                                </tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr id="rowNewPost" runat="server">
			<td valign="top" align="left">
				<table class="Forum_Border" id="tblEditContent" cellspacing="0" cellpadding="0" width="100%"
					border="0">
					<tr>
						<td class="Forum_Row_AdminL" width="200px"><span class="Forum_Row_AdminText">
								<dnn:label id="plRecipient" runat="server" suffix=":" controlname="txtRecipient" resourcekey="plRecipient"></dnn:label>
							</span></td>
						<td class="Forum_Row_AdminR" align="left" width="80%">
							<asp:textbox id="txtRecipient" runat="server" cssclass="Forum_NormalTextBox" maxlength="100"
								width="350px" ReadOnly="True"></asp:textbox></td>
					</tr>
					<tr id="rowSubject" runat="server">
						<td class="Forum_Row_AdminL" width="200px"><span class="Forum_Row_AdminText"><dnn:label id="plSubject" runat="server" suffix=":" controlname="txtSubject"></dnn:label>
							</span></td>
						<td class="Forum_Row_AdminR" align="left" width="80%"><asp:textbox id="txtSubject" runat="server" cssclass="Forum_NormalTextBox" width="350px" maxlength="100"></asp:textbox><asp:requiredfieldvalidator id="valSubject" runat="server" resourcekey="valSubject" CssClass="NormalRed" ControlToValidate="txtSubject"></asp:requiredfieldvalidator></td>
					</tr>
					<tr>
						<td class="Forum_Row_Admin" valign="top" align="left" width="100%" colspan="2"><dnn:texteditor id="teContent" runat="server" width="100%" height="250px"></dnn:texteditor></td>
					</tr>
					<tr>
						<td class="Forum_Row_Admin" valign="middle" align="center" width="100%" colspan="2">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr id="rowPreview" runat="server" visible="false">
			<td valign="top" align="left">
				<table class="Forum_Border" id="tblPreview" cellspacing="0" cellpadding="0" width="100%">
					<tr>
						<td class="Forum_AltHeader" colspan="2">
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td><asp:image id="imgAltHeader" runat="server"></asp:image></td>
									<td align="left" width="100%">&nbsp;<asp:label id="lblPreviewHead" Runat="server" resourcekey="lblPreviewHead" CssClass="Forum_AltHeaderText"></asp:label></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="Forum_Row_Admin"><asp:label id="lblPreview" Runat="server" CssClass="Forum_Normal"></asp:label></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="" valign="top" align="center">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td class="Forum_FooterCapLeft"><asp:image id="imgFootSpacer" runat="server"></asp:image></td>
						<td align="center" class="Forum_Footer">
                            &nbsp;
                        </td>
                        <td class="Forum_FooterCapRight"><asp:image id="imgFootSpacer2" runat="server"></asp:image></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center">
				<asp:label id="lblInfo" CssClass="NormalRed" runat="server"></asp:label></td>
		</tr>
	</table>
	<div align="center">
							<asp:linkbutton Cssclass="CommandButton" id="cmdSubmit" runat="server" resourcekey="cmdSendMsg"></asp:linkbutton>
							<asp:linkbutton Cssclass="CommandButton" id="cmdPreview" runat="server" resourcekey="cmdPreview"></asp:linkbutton>
							<asp:linkbutton Cssclass="CommandButton" id="cmdBackToEdit" runat="server" resourcekey="cmdReturnToEdit" CausesValidation="False"></asp:linkbutton>
							<asp:linkbutton Cssclass="CommandButton" id="cmdCancel" runat="server" resourcekey="cmdCancel" CausesValidation="False"></asp:linkbutton>
	</div>