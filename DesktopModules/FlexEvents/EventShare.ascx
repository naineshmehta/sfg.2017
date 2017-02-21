<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventShare.ascx.cs" Inherits="BizModules.FlexEvents.EventShare" %>

<div class="eventshare">

<asp:Panel ID="pnlPhone" runat="server" CssClass="verticalMiddle">
    <asp:Image ID="imgPhone" runat="server" ImageUrl="~/DesktopModules/FlexEvents/Images/phone.png" />&nbsp;
    <asp:Label ID="lblPhone" runat="server"></asp:Label>
</asp:Panel>

<asp:Panel ID="pnlFacebook" runat="server" CssClass="verticalMiddle">
    <asp:HyperLink ID="lnkFacebook" runat="server">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/FlexEvents/Images/facebook.png" />&nbsp;
        <asp:Label ID="lblFacebook" runat="server"></asp:Label>
    </asp:HyperLink>
</asp:Panel>

<asp:Panel ID="pnlIcal" runat="server" CssClass="verticalMiddle">
    <asp:HyperLink ID="lnkICal" runat="server">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/DesktopModules/FlexEvents/Images/ical.png" />&nbsp;
        <asp:Label ID="Label1" runat="server" resourcekey="Export"></asp:Label>
    </asp:HyperLink>
</asp:Panel>

<asp:Panel ID="pnlTwitter" runat="server" CssClass="verticalMiddle">
    <asp:HyperLink ID="lnkTwitter" runat="server">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/FlexEvents/Images/twitter.png" />&nbsp;
        <asp:Label ID="lblTwitter" runat="server"></asp:Label>
    </asp:HyperLink>
</asp:Panel>

            <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
            <script type="text/javascript">
                var addthis_config = {
                    pubid: "ur-b6e6ce6-7d0d-d427-5885-c9b624010b1"
                }
            </script>
            <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>

            <a class="addthis_button_preferred_1"></a>
            <a class="addthis_button_preferred_2"></a>
            <a class="addthis_button_preferred_3"></a>
            <a class="addthis_button_preferred_4"></a>
            <a class="addthis_button_compact"></a>
            </div>

</div>