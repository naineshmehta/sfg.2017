<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListView_SimpleList.ascx.cs" Inherits="BizModules.FlexEvents.Views.ListView_Grid" %>

<h5 class="title"><asp:Label ID="Label1" runat="server" resourcekey="Upcoming"></asp:Label></h5>

<div class="simplelistview">
    <%=FirstPage %>

    <asp:Panel ID="pnlLoadMore" runat="server" CssClass="loadmore">
    <asp:HyperLink ID="lblLoadMore" runat="server" NavigateUrl="javascript:void(0);" resourcekey="LoadMore"></asp:HyperLink>
    </asp:Panel>
</div>