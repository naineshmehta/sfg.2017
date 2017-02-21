<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CrossModuleBrowser.ascx.cs" Inherits="BizModules.FlexEvents.CrossModuleBrowser" %>

<asp:Panel ID="pnlXBrowser" runat="server">
<div id="xbrowserfilter">

    <div class="searchevent">
    <asp:TextBox id="txtKeyword" runat="server"></asp:TextBox>
    <asp:Image ID="imgSearch" runat="server" ImageUrl="~/Images/view.gif" CssClass="search" />
    <asp:Image ID="imgClearSearch" runat="server" ImageUrl="~/DesktopModules/FlexEvents/Images/close.png" CssClass="clearsearch" />
    </div>

    <asp:Panel ID="pnlCategoryFilter" runat="server" CssClass="categoryfilter">
        <h5>
            <input type="checkbox" class="agroup" value='<%# DataBinder.Eval(Container,"DataItem.Key").ToString()%>' id="chkCategories" checked="checked" />
            <label for="chkCategories"><asp:Label ID="Label3" runat="server" resourcekey="Categories"></asp:Label></label>
        </h5>
        <ul>
            <asp:Repeater ID="rptCategories" runat="server">
                <ItemTemplate>
                    <li>
                        <!--The first 1 lables are for server side use-->
                        <asp:Label ID="lblCategory" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Key")%>' Visible="false" />
                        <asp:CheckBox ID="chkCategory" runat="server" AutoPostBack="false" Text='<%# DataBinder.Eval(Container,"DataItem.Value.Item2")%>' />
                        <asp:Label ID="lblLabel" AssociatedControlID="chkCategory" runat="server" Text='<%# "<span style=\"background-color:#" + DataBinder.Eval(Container,"DataItem.Value.Item3").ToString() + ";\"></span>" + DataBinder.Eval(Container,"DataItem.Key")%>'>
                        </asp:Label>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </asp:Panel>

    <asp:Panel ID="pnlLocationFilter" runat="server" CssClass="locationfilter">
        <h5>
            <input type="checkbox" class="agroup" value='<%# DataBinder.Eval(Container,"DataItem.Key").ToString()%>' id="chkLocations" checked="checked" />
            <label for="chkLocations"><asp:Label ID="lblLocations" runat="server" resourcekey="Locations"></asp:Label></label>
        </h5>
        <ul>
            <asp:Repeater ID="rptLocations" runat="server">
                <ItemTemplate>
                    <li>
                        <input type="checkbox" value='<%# DataBinder.Eval(Container,"DataItem.ItemId").ToString()%>' id="chkLocation<%# DataBinder.Eval(Container,"DataItem.ItemId").ToString()%>"  checked="checked" />
                        <label for="chkLocation<%# DataBinder.Eval(Container,"DataItem.ItemId").ToString()%>"><%# DataBinder.Eval(Container,"DataItem.Name")%></label>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </asp:Panel>
    
    <asp:Panel ID="pnlDateFilter" runat="server" CssClass="datefilter">
        <h5>
            <asp:Label ID="lblDateFilter" runat="server" resourcekey="DateFilter" CssClass="selecteddate"></asp:Label>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/FlexEvents/Images/calendar.png" class="filterlogo" />
        </h5>
        <div class="xmodulecalendar">
        <div>

        <asp:Repeater ID="rptCalendar" runat="server">
            <ItemTemplate>
                <div class="month has<%# DataBinder.Eval(Container,"DataItem.Weeks")%>weeks" data-offset="<%# DataBinder.Eval(Container,"DataItem.Offset")%>">
                <div class="monthinner">
                    <table width="100%" cellpadding="0" cellspacing="1">
                    <tr>
                        <th colspan="7" class="monthname"><%# DataBinder.Eval(Container,"DataItem.Name")%></th>
                    </tr>
                    <tr>
                        <th><asp:label id="Label1" runat="server" resourcekey="Sun"></asp:label></th>
                        <th><asp:label id="Label2" runat="server" resourcekey="Mon"></asp:label></th>
                        <th><asp:label id="Label4" runat="server" resourcekey="Tue"></asp:label></th>
                        <th><asp:label id="Label5" runat="server" resourcekey="Wed"></asp:label></th>
                        <th><asp:label id="Label6" runat="server" resourcekey="Thu"></asp:label></th>
                        <th><asp:label id="Label7" runat="server" resourcekey="Fri"></asp:label></th>
                        <th><asp:label id="Label8" runat="server" resourcekey="Sat"></asp:label></th>
                    </tr>

                    <%# DataBinder.Eval(Container,"DataItem.Body")%>
                    </table>
                </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        </div>
        <asp:Image ID="imgPrevious" runat="server" ImageUrl="~/DesktopModules/FlexEvents/Images/previous.png" CssClass="previousmonth" />
        <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/FlexEvents/Images/next.png" CssClass="nextmonth" />
        </div>
    </asp:Panel>
</div>

<div id="xbrowserlist">
    <div class="simplelistview">
    <%=FirstPage %>
    </div>

    <asp:Panel ID="pnlLoadMore" runat="server" CssClass="loadmore">
    <asp:HyperLink ID="lblLoadMore" runat="server" NavigateUrl="javascript:void(0);" resourcekey="LoadMore"></asp:HyperLink>
    </asp:Panel>
    
</div>
</asp:Panel>