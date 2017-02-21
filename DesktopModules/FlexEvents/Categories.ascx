<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Categories.ascx.cs" Inherits="BizModules.FlexEvents.Categories" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>

<uc1:Header ID="Header1" runat="server" />

<h3><asp:Label ID="Label1" runat="server" resourcekey="ManageCategories" /></h3>
<table id="tblCategories" class="flexlist" width="100%" cellspacing="0" cellpadding="5">
    <tr class="th">
        <th></th>
        <th><asp:Label ID="Label2" runat="server" resourcekey="Category" /></th>
        <th><asp:Label ID="Label3" runat="server" resourcekey="Actions" /></th>
    </tr>
    <asp:repeater id="lstCategories" runat="server">
        <ItemTemplate>
            <tr id='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>' class="<%# Container.ItemIndex % 2 == 0 ? "" : "alt" %>">
                <td class="updown textcenter" style="width:60px;">
                    <asp:Label ID="lblItemId" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>' />
                    <asp:Label ID="lblSortOrder" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.SortOrder")%>' Visible="false" />
                </td>
                <td>
                    <span class="category" style="background-color:#<%# DataBinder.Eval(Container,"DataItem.BackgroundColor")%>;">
                    <%# DataBinder.Eval(Container,"DataItem.Category")%></span>
                </td>
                <td>
                    <asp:Panel ID="pnlActions" runat="server" CssClass="actions" Visible='<%# (int)DataBinder.Eval(Container, "DataItem.CreatedBy") == UserInfo.UserID || UserPermission >= BizModules.FlexEvents.FXEPermission.Manage %>'>
                    <asp:HyperLink ID="lnkEdit" runat="server" resourcekey="Edit" NavigateUrl='<%#EditUrl("ItemId", DataBinder.Eval(Container,"DataItem.ItemId").ToString(), "EditCategory") %>'></asp:HyperLink>
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
    <li class="returnlink">
        <a href="<%= DotNetNuke.Common.Globals.NavigateURL() %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a>
    </li>

 </ul>