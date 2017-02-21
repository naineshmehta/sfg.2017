<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="BizModules.FlexEvents.Controls.Header" %>

<asp:Panel ID="pnlQuickTasks" runat="server"  CssClass="quicktasks">
    <div class="groups">
        <asp:Panel ID="pnlMetadata" runat="server">
            <div><asp:label ID="lblMetaData" runat="server" resourcekey="Metadata"></asp:label><asp:label ID="lblCategories" runat="server" resourcekey="Categories" Visible="false"></asp:label></div>
            <ul>
                <li><asp:HyperLink ID="lnkAddCategory" runat="server" resourcekey="AddCategory" CssClass="add"></asp:HyperLink></li>
                <li id="liManageCategories" runat="server"><asp:HyperLink ID="lnkCategories" runat="server" resourcekey="ManageCategories" CssClass="categories"></asp:HyperLink></li>
                
                <asp:PlaceHolder ID="phNewColumn" runat="server" Visible="false">
                </ul>
                </div>
                <div>
                <div><asp:label ID="Label3" runat="server" resourcekey="Locations"></asp:label></div>
                <ul>
                </asp:PlaceHolder>
                
                <li><asp:HyperLink ID="lnkAddLocation" runat="server" resourcekey="AddLocation" CssClass="add"></asp:HyperLink></li>
                <li id="liManageLocations" runat="server"><asp:HyperLink ID="lnkLocations" runat="server" resourcekey="ManageLocations" CssClass="locations"></asp:HyperLink></li>
            </ul>
        </asp:Panel>
        <div>
            <div><asp:label ID="Label2" runat="server" resourcekey="Events"></asp:label></div>
            <ul>
                <li><asp:HyperLink ID="lnkAddEvent" runat="server" resourcekey="AddEvent" CssClass="add"></asp:HyperLink></li>
                <li><asp:HyperLink ID="lnkEvents" runat="server" resourcekey="ManageEvents" CssClass="events"></asp:HyperLink></li>
                <li id="liEditLatest" runat="server"><asp:HyperLink ID="lnkEditLatest" runat="server"></asp:HyperLink></li>
                <li id="liReviewPending" runat="server"><asp:HyperLink ID="lnkReviewPending" runat="server"></asp:HyperLink></li>
            </ul>
        </div>
        <div>
            <div><asp:label ID="Label1" runat="server" resourcekey="Miscellaneous"></asp:label></div>
            <ul>
                <li><asp:HyperLink ID="lnkReviews" runat="server" resourcekey="Reviews" CssClass="reviews"></asp:HyperLink></li>
                <li id="liBookings" runat="server"><asp:HyperLink ID="lnkBookings" runat="server" resourcekey="Bookings" CssClass="bookings"></asp:HyperLink></li>
                <li id="liMyBookings" runat="server"><asp:HyperLink ID="lnkMyBookings2" runat="server" resourcekey="MyBookings"></asp:HyperLink></li>
                <li id="liLoadDummyData" runat="server"><asp:HyperLink ID="lnkLoadDummyData" 
                        runat="server" resourcekey="LoadDummyData" CssClass="loaddummy" 
                        Font-Bold="true"></asp:HyperLink></li>
            </ul>
        </div>
        <asp:Panel ID="pnlConfiguration" runat="server">
            <div><asp:label ID="lblConfiguration" runat="server" resourcekey="Configuration"></asp:label></div>
            <ul>
                <li><asp:HyperLink ID="lnkModuleSettings" runat="server" resourcekey="ModuleSettings" CssClass="modulesettings"></asp:HyperLink></li>
                <li id="liTemplates" runat="server"><asp:HyperLink ID="lnkTemplates" runat="server" resourcekey="TextTemplates"></asp:HyperLink></li>
                <li id="liLicense" runat="server"><asp:HyperLink ID="lnkLicense" runat="server" resourcekey="LicenseStatus" CssClass="modulesettings"></asp:HyperLink></li>
                <li id="liUpgrade" runat="server"><asp:HyperLink ID="lnkUpgrade" runat="server" NavigateUrl="http://www.bizmodules.net/tabid/141/Default.aspx" Target="_blank"></asp:HyperLink></li>
            </ul>
        </asp:Panel>
    </div>
</asp:Panel>

<asp:Panel ID="pnlCustomer" runat="server" Visible="false"  CssClass="quicktasks">
    <asp:HyperLink ID="lnkMyBookings" runat="server" resourcekey="MyBookings"></asp:HyperLink>
</asp:Panel>