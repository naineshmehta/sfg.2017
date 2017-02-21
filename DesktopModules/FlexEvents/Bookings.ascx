<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Bookings.ascx.cs" Inherits="BizModules.FlexEvents.Bookings" %>

<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>

<uc1:Header ID="Header1" runat="server" />

<h3>
<asp:Label ID="lblTitle" runat="server" resourcekey="SelectAnEventDate"></asp:Label>
</h3>

<div class="bookings">
    <h5 class="summary"><asp:Label ID="lblSummary" runat="server"></asp:Label></h5>

    <table id="Table1" class="flexlist" width="100%" cellspacing="0">
        <asp:ListView ID="lstBookings" runat="server" ItemPlaceholderID="PlaceHolder1" 
            DataKeyNames="ItemId" 
            onpagepropertieschanging="lstEvents_PagePropertiesChanging" EnableViewState="false">

        <LayoutTemplate>
            <tr>
                <th></th>
                <th><asp:Label ID="Label4" runat="server" resourcekey="Name" /></th>
                <th><asp:Label ID="Label2" runat="server" resourcekey="Date" /></th>
                <th><asp:Label ID="Label1" runat="server" resourcekey="Confirmed" /></th>
                <th><asp:Label ID="Label3" runat="server" resourcekey="Actions" /></th>
            </tr>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>

        <ItemTemplate>
            <tr class="<%# Container.DisplayIndex % 2 == 0 ? "" : "alt" %>">
                <td class="textcenter" style="width:60px;">
                    <asp:Label ID="lblItemId" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>' />
                </td>
                <td>
                    <%# DataBinder.Eval(Container,"DataItem.Title")%>
                </td>
                <td>
                    <%# ((DateTime)DataBinder.Eval(Container, "DataItem.OccuranceStartDate")).ToShortDateString() %>
                </td>
                <td>
                    <%# GetRegistrationStatus((BizModules.FlexEvents.EventOccuranceInfo)Container.DataItem)%>
                </td>
                <td>
                    <asp:HyperLink ID="lnkBookings" runat="server" resourcekey="ManageBookings" NavigateUrl='<%#EditUrl("OccuranceId", DataBinder.Eval(Container,"DataItem.OccuranceId").ToString(), "ViewBookings") %>'></asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

    <EmptyDataTemplate>

        <h6><asp:Label ID="Label7" runat="server" resourcekey="NoRecordsFound"></asp:Label></h6>

    </EmptyDataTemplate>

    </asp:ListView>
    </table>

    <div class="pager">
    <asp:DataPager ID="dpBookings" runat="server" PageSize="30" 
        PagedControlID="lstBookings">
        <Fields>
            <asp:NumericPagerField ButtonCount="5" ButtonType="Button" CurrentPageLabelCssClass="current" NumericButtonCssClass="flexbtn"  />
        </Fields>
    </asp:DataPager>
    </div>
</div>

<ul class="dnnActions dnnClear">
    <li class="returnlink">
        <asp:HyperLink ID="lnkReturn" runat="server" cssclass="flexbtn" resourcekey="Return"></asp:HyperLink>
    </li>
</ul>