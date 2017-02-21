<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListView_Grid.ascx.cs" Inherits="BizModules.FlexEvents.Views.ListView_Grid" %>

<asp:panel ID="pnlGridView" runat="server" CssClass="gridview">
    <%=FirstPage %>

    <asp:Panel ID="pnlLoadMore" runat="server" CssClass="loadmore">
    <asp:HyperLink ID="lblLoadMore" runat="server" NavigateUrl="javascript:void(0);" resourcekey="LoadMore"></asp:HyperLink>
    </asp:Panel>
</asp:panel>