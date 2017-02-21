<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewCount.ascx.cs" Inherits="DesktopModules_CountDownUp_ViewCount" %>
<table id="table1" cellspacing="0" cellpadding="0" width="100%"  style="height:46px" border="0">
	<tr valign="top">
		<td style="vertical-align:middle"><asp:label id="lbldays" runat="server">Days</asp:label></td>
		<td></td>
		<td style="vertical-align:middle"><asp:label id="lblHrs" runat="server">Hours</asp:label></td>
		<td></td>
		<td style="vertical-align:middle"><asp:label id="lblMins" runat="server">Min</asp:label></td>
		<td></td>
		<td style="vertical-align:middle"><asp:label id="lblSecs" runat="server">Sec</asp:label></td>
	</tr>
	<tr style="background-color:#000000">
		<td style="vertical-align:middle"><asp:label id="cdDay2" runat="server"></asp:label><asp:label id="cdDay1" runat="server"></asp:label><asp:label id="cdDay0" runat="server"></asp:label></td>
		<td>&nbsp;</td>
		<td style="vertical-align:middle"><asp:label id="cdHour1" runat="server"></asp:label><asp:label id="cdHour0" runat="server"></asp:label></td>
		<td>&nbsp;</td>
		<td style="vertical-align:middle"><asp:label id="cdMinute1" runat="server"></asp:label><asp:label id="cdMinute0" runat="server"></asp:label></td>
		<td>&nbsp;</td>
		<td style="vertical-align:middle"><asp:label id="cdSecond1" runat="server"></asp:label><asp:label id="cdSecond0" runat="server"></asp:label></td>
	</tr>
</table>
<p><asp:label id="lblCountdownText" runat="server"></asp:label><br />
<asp:label id="lblErrorMessage" runat="server"></asp:label><asp:label id="lblScript" runat="server"></asp:label></p>
