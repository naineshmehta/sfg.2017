<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventDetail.ascx.cs" Inherits="BizModules.FlexEvents.EventDetail" %>

<div class="topreturn">
    <asp:HyperLink ID="lnkAllEvents" runat="server"  CssClass="flexbtn" resourcekey="&lt;&lt;AllEvents"></asp:HyperLink>
</div>

<asp:Panel ID="pnlStatus" runat="server">
    <asp:Label ID="lblStatus" runat="server"></asp:Label>
</asp:Panel>

<h3>
    <asp:Label ID="lblTitle" runat="server"></asp:Label>
</h3>

<h5>
    <asp:Label ID="lblDuration" runat="server"></asp:Label>
</h5>

<div class="lineseparator"></div>

<asp:Panel ID="pnlEventSummary" runat="server" CssClass="eventsummary">
    <asp:Label ID="lblSummary" runat="server"></asp:Label>
</asp:Panel>
<div class="eventdescription">
    <asp:Image ID="imgLogo" runat="server" CssClass="eventlogo" />
    <asp:Literal ID="ltDescription" runat="server"></asp:Literal>
</div>
