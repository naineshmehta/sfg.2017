<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewEvent.ascx.cs" Inherits="BizModules.FlexEvents.ViewEvent" %>

<%@ Register src="EventDetail.ascx" tagname="EventDetail" tagprefix="uc1" %>
<%@ Register src="EventReviews.ascx" tagname="EventReviews" tagprefix="uc2" %>
<%@ Register src="EventWhenWhere.ascx" tagname="EventWhenWhere" tagprefix="uc3" %>
<%@ Register src="EventMap.ascx" tagname="EventMap" tagprefix="uc4" %>
<%@ Register src="EventShare.ascx" tagname="EventShare" tagprefix="uc5" %>
<%@ Register src="EventBooking.ascx" tagname="EventBooking" tagprefix="uc6" %>
<%@ Register src="EventDocuments.ascx" tagname="EventDocuments" tagprefix="uc7" %>


<div id="page-content-wrapper">

        <asp:Panel ID="pnlEventSummary" runat="server">
            <uc1:EventDetail ID="EventDetail1" runat="server" />
        </asp:Panel>

        <asp:Panel ID="Panel3" runat="server" CssClass="vieweventsection">
            <h5 class="title"><asp:Label ID="Label1" runat="server" resourcekey="BookThisEvent"></asp:Label></h5>
            <uc6:EventBooking ID="EventBooking1" runat="server" />
        </asp:Panel>
        <asp:Panel ID="Panel4" runat="server" CssClass="vieweventsection">
            <h5 class="title"><asp:Label ID="Label2" runat="server" resourcekey="Reviews"></asp:Label></h5>
            <uc2:EventReviews ID="EventReviews1" runat="server" />
        </asp:Panel>
    
</div>

<div id="sidebar-wrapper">
    <div class="sidebar-inner">
        <asp:Panel ID="Panel6" runat="server" CssClass="vieweventsection">
            <h5 class="title"><asp:Label ID="Label6" runat="server" resourcekey="WhenAndWhere"></asp:Label></h5>
            <uc3:EventWhenWhere ID="EventWhenWhere1" runat="server" />
        </asp:Panel>

        <asp:Panel ID="Panel5" runat="server" CssClass="vieweventsection">
            <h5 class="title"><asp:Label ID="Label5" runat="server" resourcekey="Map"></asp:Label></h5>
            <uc4:EventMap ID="EventMap1" runat="server" />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" CssClass="vieweventsection">
            <h5 class="title"><asp:Label ID="Label3" runat="server" resourcekey="Downloads"></asp:Label></h5>
            <uc7:EventDocuments ID="EventDocuments1" runat="server" />
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" CssClass="vieweventsection">
            <h5 class="title"><asp:Label ID="Label4" runat="server" resourcekey="Share"></asp:Label></h5>
            <uc5:EventShare ID="EventShare1" runat="server" />
        </asp:Panel>
    </div>
</div>


