<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RolePicker.ascx.cs" Inherits="BizModules.FlexEvents.Controls.RolePicker" %>
<asp:datalist id="rptRoles" runat="server" RepeatColumns="3" RepeatDirection="horizontal" CellPadding="0" CellSpacintg="0" CssClass="rolepicker">
	<ItemTemplate>
		<td class="Normal" style="vertical-align:top;">
			<asp:CheckBox ID="chkPermission" Runat="server" Text='<%# Container.DataItem %>'>
			</asp:CheckBox>
		</td>
	</ItemTemplate>
</asp:datalist>