<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Locations.ascx.cs" Inherits="BizModules.FlexEvents.Locations" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>

<uc1:Header ID="Header1" runat="server" />

<h3><asp:Label ID="Label1" runat="server" resourcekey="ManageLocations" /></h3>
<table id="tblLocations" class="flexlist" width="100%" cellspacing="0" cellpadding="5">
    <tr>
        <th></th>
        <th><asp:Label ID="Label4" runat="server" resourcekey="Name" /></th>
        <th><asp:Label ID="Label2" runat="server" resourcekey="Address" /></th>
        <th><asp:Label ID="Label3" runat="server" resourcekey="Actions" /></th>
    </tr>
    <asp:repeater id="lstLocations" runat="server">
        <ItemTemplate>
            <tr id='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>' class="<%# Container.ItemIndex % 2 == 0 ? "" : "alt" %>">
                <td class="updown textcenter" style="width:60px;">
                    <asp:Label ID="lblItemId" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>' />
                </td>
                <td>
                    <%# DataBinder.Eval(Container,"DataItem.Name")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container,"DataItem.Address")%>
                </td>
                <td>
                    <asp:Panel ID="pnlActions" runat="server" CssClass="actions" Visible='<%# (int)DataBinder.Eval(Container, "DataItem.CreatedBy") == UserInfo.UserID || UserPermission >= BizModules.FlexEvents.FXEPermission.Manage %>'>
                    <asp:HyperLink ID="lnkEdit" runat="server" resourcekey="Edit" NavigateUrl='<%#EditUrl("ItemId", DataBinder.Eval(Container,"DataItem.ItemId").ToString(), "EditLocation") %>'></asp:HyperLink>
                    -
                    <asp:LinkButton ID="lnkDelete" runat="server" resourcekey="Delete" OnClick="lnkDelete_Click" CssClass='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>' OnClientClick='<%# string.Format("return window.confirm(\"{0}\");", Localize("DeleteConfirm.Text")) %>' />
                    </asp:Panel>
                </td>
            </tr>
        </ItemTemplate>
    </asp:repeater>
</table>
<asp:textbox id="txtApplyDrag" runat="server" CssClass="txtApplyDrag" style="display: none;" />

<ul class="dnnActions dnnClear">
    <li><asp:HyperLink ID="lnkAddNew" runat="server" resourcekey="AddNew" 
            CssClass="dnnPrimaryAction" /></li>
     <li class="returnlink"><a href="<%= DotNetNuke.Common.Globals.NavigateURL() %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a></li>
</ul>
