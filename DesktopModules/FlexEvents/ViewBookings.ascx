<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewBookings.ascx.cs" Inherits="BizModules.FlexEvents.ViewBookings" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>

<uc1:Header ID="Header1" runat="server" />

<h3>
<asp:Label ID="lblTitle" runat="server"></asp:Label>
</h3>
<p><asp:Label ID="lblEventDate" runat="server"></asp:Label>
</p>

<div class="toparea">
<table width="100%">
    <tr>
    <td>
        <asp:RadioButtonList ID="rdoBookingStatus" runat="server" 
                        CssClass="barstyleradio normalRadioButton" RepeatLayout="OrderedList" AutoPostBack="true" 
                        onselectedindexchanged="rdoBookingStatus_SelectedIndexChanged" >
                        <asp:ListItem Value="Paid" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="Pending"></asp:ListItem>
                        <asp:ListItem Value="NotPaid"></asp:ListItem>
                    </asp:RadioButtonList>
    </td>
    <td style="text-align:right;">
        <div class="searchswitch">
            <asp:Label ID="lblHideSearch" runat="server" CssClass="ontext" resourcekey="HideSearch"></asp:Label>
            <asp:Label ID="Label1" runat="server" CssClass="offtext" resourcekey="Search"></asp:Label>
        </div>
    </td>
    </tr>
</table>
</div>

<asp:Panel ID="pnlFilters" runat="server" cssclass="searchfilters hideindefault">
        <table cellpadding="5" cellspacing="0" class="flextable">
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" resourcekey="ByBookingId"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBookingId" runat="server" 
                        Width="200px"></asp:TextBox>
                    <asp:ImageButton ID="imgBookingId" runat="server" ImageUrl="~/Images/view.gif" 
                onclick="imgSearch_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" resourcekey="ByCustomerName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCustomerName" runat="server" 
                        Width="200px"></asp:TextBox>
                    <asp:ImageButton ID="imgCustomerName" runat="server" ImageUrl="~/Images/view.gif" 
                onclick="imgSearch_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" resourcekey="ByPhoneNumber"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" 
                        Width="200px"></asp:TextBox>
                    <asp:ImageButton ID="imgPhoneNumber" runat="server" ImageUrl="~/Images/view.gif" 
                onclick="imgSearch_Click" />
                </td>
            </tr>
         </table>
</asp:Panel>

<div class="bookings">
    <h5 class="summary"><asp:Label ID="lblSummary" runat="server"></asp:Label></h5>

    <table id="Table1" class="flexlist" width="100%" cellspacing="0">
        <asp:ListView ID="lstBookings" runat="server" ItemPlaceholderID="PlaceHolder1" 
            DataKeyNames="ItemId" 
            onpagepropertieschanging="lstEvents_PagePropertiesChanging" EnableViewState="false">

        <LayoutTemplate>
            <tr>
                <th><asp:Label ID="Label11" runat="server" resourcekey="BookingId" /></th>
                <th><asp:Label ID="Label10" runat="server" resourcekey="Customer" /></th>
                <th><asp:Label ID="Label9" runat="server" resourcekey="From" /></th>
                <th><asp:Label ID="Label5" runat="server" resourcekey="Attendees" /></th>
                <th><asp:Label ID="Label4" runat="server" resourcekey="Total" /></th>
                <th><asp:Label ID="Label2" runat="server" resourcekey="Status" /></th>
                <th><asp:Label ID="Label3" runat="server" resourcekey="Actions" /></th>
            </tr>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>

        <ItemTemplate>
            <tr class="<%# Container.DisplayIndex % 2 == 0 ? "" : "alt" %>">
                <td class="textcenter" style="width:60px;">
                    <asp:Label ID="lblItemId" runat="server" Text='<%# ((int)DataBinder.Eval(Container,"DataItem.ItemId")).ToString("0000")%>' />
                </td>
                <td>
                    <%# ((BizModules.FlexEvents.BookingInfo)Container.DataItem).FirstName + " " + ((BizModules.FlexEvents.BookingInfo)Container.DataItem).LastName %>
                </td>
                <td>
                    <%# ((BizModules.FlexEvents.BookingInfo)Container.DataItem).City + ", " + ((BizModules.FlexEvents.BookingInfo)Container.DataItem).State %>
                </td>
                <td>
                    <%# ((BizModules.FlexEvents.BookingInfo)Container.DataItem).Attendees.ToString()%>
                </td>
                <td>
                    <%# FormatMoney(((BizModules.FlexEvents.BookingInfo)Container.DataItem).Total)%>
                </td>
                <td>
                    <%# GetPaymentStatus((BizModules.FlexEvents.BookingInfo)Container.DataItem)%>
                </td>
                <td>
                    <asp:HyperLink ID="lnkEdit" runat="server" resourcekey="View" NavigateUrl='<%#EditUrl("ItemId", DataBinder.Eval(Container,"DataItem.ItemId").ToString(), "ViewOrder") %>'></asp:HyperLink>
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
    <li><asp:HyperLink ID="lnkDownloadPdf" runat="server" resourcekey="PDFVersion" Visible="false" CssClass="dnnPrimaryAction" /></li>
    <li class="returnlink"><asp:HyperLink ID="lnkReturn" runat="server" cssclass="flexbtn" resourcekey="Return"></asp:HyperLink></li>
 </ul>