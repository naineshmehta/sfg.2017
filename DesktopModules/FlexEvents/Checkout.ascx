<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Checkout.ascx.cs" Inherits="BizModules.FlexEvents.Checkout" %>


<h2 class="eventtitle">
<asp:Label ID="lblTitle" runat="server"></asp:Label>
</h2>

<div>
    <asp:Label ID="lblWhen" runat="server" CssClass="eventduration"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text=","></asp:Label>
    <asp:Label ID="lblLocationName" runat="server"></asp:Label>
</div>

<div class="lineseparator"></div>

<div class="billinginfo">
<p class="Head">
    <asp:Label ID="Label4" runat="server" resourcekey="BillingInformation"></asp:Label>
</p>
<p><asp:Label ID="lblYourName" runat="server"></asp:Label></p>
<p><asp:Label ID="lblAddress" runat="server"></asp:Label></p>
<p><asp:Label ID="lblContactInformation" runat="server"></asp:Label></p>


<p class="Head">
    <asp:Label ID="Label19" runat="server" resourcekey="AttendeesAndCost"></asp:Label>
</p>
<p><asp:Label ID="lblNumberOfAttendees" runat="server" CssClass="SubHead"></asp:Label> <asp:Label ID="Label3" runat="server" resourcekey="Attendees"></asp:Label>
<asp:Label ID="Label5" runat="server" Text=" / "></asp:Label>
<asp:Label ID="lblTotal" runat="server" CssClass="SubHead"></asp:Label>
</p>

</div>

<div class="lineseparator"></div>

<div id="authorizeform">
<iframe id="checkoutform" allowtransparency="true" src="<%=AuthorizeAspx %>" frameborder="0" style="width:100%; height:200px; border:none;" scrolling="no"></iframe>
</div>