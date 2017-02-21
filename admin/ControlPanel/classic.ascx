<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.ControlPanels.Classic" CodeFile="Classic.ascx.vb" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table width="100%" border="0" summary="Table for design" style="border:#cccccc 1px dotted">
                <tr>
        <td valign="top" style="width:20%;white-space:nowrap;text-align:left">
            <div id="divPage" runat="server">
                <asp:label id="lblAdmin" runat="server" cssclass="SubHead">Page Admin:</asp:label>&nbsp;&nbsp;
                <asp:hyperlink id="cmdAddTab" runat="server" cssclass="CommandButton" >Add</asp:hyperlink>&nbsp;&nbsp;
                <asp:hyperlink id="cmdEditTab" runat="server" cssclass="CommandButton" >Edit</asp:hyperlink>&nbsp;&nbsp;
                <asp:hyperlink id="cmdCopyTab" runat="server" cssclass="CommandButton" >Copy</asp:hyperlink>
            </div>
                    </td>
        <td valign="top" style="width:60%;white-space:nowrap;text-align:center">
			<table cellspacing="1" cellpadding="0" border="0" style="height:100%" id="tblIconBarModule" runat="server">
				<tr>
				    <td>
                        <asp:imagebutton id="cmdHelpShow" imageurl="~/images/help.gif" alternatetext="Show Module Info" runat="server" visible="False" borderwidth="0" ></asp:imagebutton>
                        <asp:imagebutton id="cmdHelpHide" imageurl="~/images/cancel.gif" alternatetext="Hide Module Info" runat="server" visible="False" borderwidth="0" ></asp:imagebutton>
				    </td>
				    <td>&nbsp;</td>
					<td class="SubHead" align="right"><asp:label id="lblModule" runat="server" cssclass="SubHead" >Module:</asp:label>&nbsp;</td>
					<td><asp:dropdownlist id="cboDesktopModules" runat="server" cssclass="Normal" width="150" datavaluefield="DesktopModuleID" datatextfield="FriendlyName"></asp:dropdownlist>&nbsp;&nbsp;</td>
					<td class="SubHead" align="right"><asp:label id="lblPane" runat="server" cssclass="SubHead" >Pane:</asp:label>&nbsp;</td>
					<td><asp:dropdownlist id="cboPanes" runat="server" cssclass="Normal" width="100"></asp:dropdownlist>&nbsp;&nbsp;</td>
					<td class="SubHead" align="right"><asp:label id="lblAlign" runat="server" cssclass="SubHead" >Align:</asp:label>&nbsp;</td>
					<td>
						<asp:dropdownlist id="cboAlign" runat="server" cssclass="Normal" width="100">
						    <asp:listitem value="" resourcekey="Not_Specified" />
							<asp:ListItem Value="left" resourcekey="Left">Left</asp:ListItem>
							<asp:ListItem Value="center" resourcekey="Center">Center</asp:ListItem>
							<asp:ListItem Value="right" resourcekey="Right">Right</asp:ListItem>
						</asp:dropdownlist>&nbsp;&nbsp;
					</td>
					<td width="35" align="center" class="Normal"><asp:linkbutton id="cmdAdd" runat="server" cssclass="CommandButton" causesvalidation="False" >Add</asp:linkbutton></td>
				</tr>
			</table>
        </td>
        <td valign="top" style="width:20%;white-space:nowrap;text-align:right">
            &nbsp;<asp:Label ID="lblMode" Runat="server" CssClass="SubHead" resourceKey="Mode" />
			<asp:radiobuttonlist id="optMode" cssclass="SubHead" runat="server" repeatdirection="Horizontal" repeatlayout="Flow" autopostback="True">
				<asp:listitem value="VIEW" resourcekey="ModeView" />
				<asp:listitem value="EDIT" resourcekey="ModeEdit" />
				<asp:listitem value="LAYOUT" resourcekey="ModeLayout" />
			</asp:radiobuttonlist>
        </td>
    </tr>
    <tr>
        <td></td>
        <td align="center" valign="top"><asp:label id="lblDescription" runat="server" cssclass="Normal" ></asp:label></td>
        <td></td>
    </tr>
</table>
