<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyBookings.ascx.cs" Inherits="BizModules.FlexEvents.MyBookings" %>

<fieldset class="searchfilters">
<legend><asp:Label ID="Label4" runat="server" resourcekey="NarrowResults"></asp:Label></legend>
        <table class="flextable" cellspacing="0" cellpadding="5">
        <tr><td><asp:label id="Label1" runat="server" resourcekey="BookingStatus"></asp:label></td><td>
            <asp:DropDownList ID="cboStatus" runat="server" Width="200px" 
                onselectedindexchanged="cboStatus_SelectedIndexChanged" 
                AutoPostBack="True">
                <asp:ListItem Value="0" Text="All"></asp:ListItem>
                <asp:ListItem Value="1" Text="NotPaid"></asp:ListItem>
                <asp:ListItem Value="2" Text="Pending"></asp:ListItem>
                <asp:ListItem Value="3" Text="Paid"></asp:ListItem>
            </asp:DropDownList>
        </td></tr>
        <tr><td><asp:label id="Label2" runat="server" resourcekey="BookingDateRange"></asp:label></td>
        <td><asp:TextBox ID="txtDateRange" runat="server" Width="200px" CssClass="bookingdate"></asp:TextBox>
            <asp:ImageButton ID="imgSearchByDateRange" runat="server" ImageUrl="~/Images/view.gif" CssClass="datesearch" 
                onclick="imgSearchByDateRange_Click" />
            </td></tr>
        </table>
</fieldset>

    <h5 class="summary"><asp:Label ID="lblSummary" runat="server"></asp:Label></h5>

    <div class="eventslist">

    <asp:repeater id="lstBookings" runat="server">
        <ItemTemplate>
            <div class="event">
                <table width="100%">
                    <tr>
                        <td class="colleft">
                            <asp:Image ID="imgLogo" runat="server" ImageUrl='<%# GetLogo(((BizModules.FlexEvents.EventOccuranceInfo)DataBinder.Eval(Container,"DataItem.EventOccurance")).Logo)%>' />
                        </td>
                        <td class="colright">
                            <div class="title">
                                <%# DataBinder.Eval(Container,"DataItem.EventOccurance.Title")%>
                                <%# ((int)DataBinder.Eval(Container,"DataItem.ItemId")).ToString("0000")%>
                            </div>
                            <div class="duration">
                                <%# GetDuration(((BizModules.FlexEvents.EventOccuranceInfo)DataBinder.Eval(Container,"DataItem.EventOccurance")))%>
                            </div>
                            <div class="location">
                                <%# ((BizModules.FlexEvents.LocationInfo)DataBinder.Eval(Container, "DataItem.EventOccurance.Location")).Name%>
                                <asp:Label ID="lblComma" runat="server" Text=", "></asp:Label>
                                <%# ((BizModules.FlexEvents.LocationInfo)DataBinder.Eval(Container, "DataItem.EventOccurance.Location")).Address%>
                            </div>
                            <span class="admission"><%# GetPaymentStatus((BizModules.FlexEvents.BookingInfo)Container.DataItem)%></span>
                            <div class="lineseparator"></div>
                            <div class="actions">
                            <asp:HyperLink ID="HyperLink2" runat="server" resourcekey="ViewOrder" NavigateUrl='<%#EditUrl("ItemId", DataBinder.Eval(Container,"DataItem.ItemId").ToString(), "Receipt") %>'></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink3" runat="server" resourcekey="ViewEvent" NavigateUrl='<%#GetViewUrl((int)DataBinder.Eval(Container,"DataItem.OccuranceId")) %>'></asp:HyperLink>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:repeater>

    </div>

</table>

<ul class="dnnActions dnnClear">
    <li class="returnlink">
        <a href="<%= DotNetNuke.Common.Globals.NavigateURL() %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a>
    </li>
</ul>