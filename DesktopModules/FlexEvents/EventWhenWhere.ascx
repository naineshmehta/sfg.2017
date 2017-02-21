<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventWhenWhere.ascx.cs" Inherits="BizModules.FlexEvents.EventWhenWhere" %>

<div class="whenwhere">
    <div class="when">
        <h5><asp:Label ID="Label7" runat="server" resourcekey="When?"></asp:Label></h5>
        <div><asp:Label ID="lblDuration2" runat="server"></asp:Label></div>
        <div><asp:Label ID="lblTimeZone" runat="server"></asp:Label></div>
    </div>
    <asp:Panel ID="pnlRecurring" runat="server">
        <h5><asp:Label ID="Label2" runat="server" resourcekey="Recurring"></asp:Label></h5>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/FlexEvents/images/recurring.png" ToolTip="recurring" style='vertical-align:middle;' />
        <asp:Label ID="lblRecurring" runat="server"></asp:Label>
    </asp:Panel>
    <div class="where">
        <h5><asp:Label ID="Label5" runat="server" resourcekey="Where?"></asp:Label></h5>
        <div>
            <asp:HyperLink ID="lnkLocation" runat="server"></asp:HyperLink>
            <asp:Label ID="lblLocationName" runat="server"></asp:Label></div>
        <div class="grey"><asp:Label ID="lblLocationAddress" runat="server"></asp:Label></div>
    </div>
</div>