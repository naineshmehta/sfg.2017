<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventBooking.ascx.cs" Inherits="BizModules.FlexEvents.EventBooking" %>


<asp:Panel ID="pnlBooked" runat="server" Visible="false" CssClass="bluebox">
    <asp:Label ID="lblBooked" runat="server"></asp:Label>
</asp:Panel>

<asp:Panel ID="pnlRequireBooking" runat="server" class="bookingsection">
    <p class="SubHead"><asp:Label ID="lblBookingRequired" runat="server" resourcekey="BookingRequired"></asp:Label></p>

    <asp:Panel ID="pnlNoBookingPermission" runat="server" CssClass="greybox">
        <asp:Label ID="lblNoBookingPermission" runat="server"></asp:Label>
    </asp:Panel>

    <asp:Panel ID="pnlBooking" runat="server">            
        <div><asp:Label ID="lblCost" runat="server"></asp:Label></div>

        <asp:Panel ID="pnlBookNow" runat="server">
            <ul class="dnnActions dnnClear">
                <li><asp:HyperLink ID="lnkBookNow" runat="server" resourcekey="BookNow" CssClass="dnnPrimaryAction" />
                </li>
            </ul>
        </asp:Panel>
        <asp:Panel ID="pnlNotOpen" runat="server" CssClass="greybox">
            <asp:Label ID="lblNotOpen" runat="server"></asp:Label>
        </asp:Panel>
    </asp:Panel>

</asp:Panel>
