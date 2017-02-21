<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Events.ascx.cs" Inherits="BizModules.FlexEvents.Events" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>
<uc1:Header ID="Header1" runat="server" />

<h3><asp:Label ID="lblTitle" runat="server" resourcekey="EventsManagement"></asp:Label></h3>

<fieldset class="searchfilters">
<legend><asp:Label ID="Label4" runat="server" resourcekey="NarrowResults"></asp:Label></legend>
        <table class="flextable" cellspacing="0" cellpadding="5">
        <tr><td><asp:label id="Label3" runat="server" resourcekey="Category"></asp:label></td><td>
            <asp:DropDownList ID="cboCategory" runat="server" DataTextField="Category" 
                DataValueField="ItemId" Width="200px" 
                onselectedindexchanged="cboCategory_SelectedIndexChanged" 
                AutoPostBack="True">
            </asp:DropDownList>
        </td></tr>
        <tr><td><asp:label id="Label1" runat="server" resourcekey="Status"></asp:label></td><td>
            <asp:DropDownList ID="cboStatus" runat="server" DataTextField="Name" 
                DataValueField="ItemId" Width="200px" 
                onselectedindexchanged="cboCategory_SelectedIndexChanged" 
                AutoPostBack="True">
                <asp:ListItem Value="Ongoing"></asp:ListItem>
                <asp:ListItem Value="Today" style="margin-left:1em;"></asp:ListItem>
                <asp:ListItem Value="AWeek" style="margin-left:1em;"></asp:ListItem>
                <asp:ListItem Value="AMonth" style="margin-left:1em;"></asp:ListItem>
                <asp:ListItem Value="Finsihed"></asp:ListItem>
                <asp:ListItem Value="Pending"></asp:ListItem>
                <asp:ListItem Value="Archived"></asp:ListItem>
            </asp:DropDownList>
        </td></tr>
        <tr><td><asp:label id="Label2" runat="server" resourcekey="EventName"></asp:label></td><td>
            <asp:TextBox ID="txtEventName" runat="server" Width="200px" CssClass="eventname"></asp:TextBox>
            <asp:TextBox ID="txtEventId" runat="server" CssClass="eventid" style="display: none;"></asp:TextBox>
            <asp:ImageButton ID="imgSearch" runat="server" ImageUrl="~/Images/view.gif" CssClass="searchevent" 
                onclick="imgSearch_Click" />
        </td></tr>
        </table>
</fieldset>

    <h5 class="summary"><asp:Label ID="lblSummary" runat="server"></asp:Label></h5>

    <div class="eventslist">
        <asp:ListView ID="lstEvents" runat="server" ItemPlaceholderID="PlaceHolder1" 
            DataKeyNames="ItemId" 
            onpagepropertieschanging="lstEvents_PagePropertiesChanging" 
            onitemcommand="lstEvents_ItemCommand" 
            onitemdeleting="lstEvents_ItemDeleting">

        <LayoutTemplate>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>

        <ItemTemplate>
            <div class="event">
                <table width="100%">
                    <tr>
                        <td class="colleft">
                            <asp:Image ID="imgLogo" runat="server" ImageUrl='<%# GetLogo((string)DataBinder.Eval(Container,"DataItem.Logo"))%>' />
                        </td>
                        <td class="colright">
                            <div class="title">
                                <asp:HyperLink ID="lnkTitle" runat="server" Target="_blank" Text='<%# DataBinder.Eval(Container,"DataItem.Title")%>' NavigateUrl='<%# GetViewUrl((int)DataBinder.Eval(Container,"DataItem.ItemId"))%>'></asp:HyperLink>
                            </div>
                            <div class="duration">
                                <%# ((BizModules.FlexEvents.LocationInfo)DataBinder.Eval(Container, "DataItem.Location")).Name%>
                                @
                                <%# GetDuration((BizModules.FlexEvents.EventInfo)Container.DataItem)%>
                            </div>
                            <div class="summary pconly">
                                <%# DataBinder.Eval(Container,"DataItem.Summary")%>
                            </div>
                            <%# GetAdmission((BizModules.FlexEvents.EventInfo)Container.DataItem)%>
                            <div class="lineseparator"></div>
                            <div class="actions">
                            <asp:HyperLink ID="lnkEdit" runat="server" resourcekey="Edit" NavigateUrl='<%#EditUrl("ItemId", DataBinder.Eval(Container,"DataItem.ItemId").ToString(), "EditEvent") %>'></asp:HyperLink>
                            <asp:HyperLink ID="lnkAttachedFiles" runat="server" resourcekey="AttachedFiles" NavigateUrl='<%#EditUrl("ItemId", DataBinder.Eval(Container,"DataItem.ItemId").ToString(), "AttachedFile") %>'></asp:HyperLink>
                            <asp:HyperLink ID="lnkBookings" runat="server" resourcekey="Bookings" NavigateUrl='<%#EditUrl("EventId", DataBinder.Eval(Container,"DataItem.ItemId").ToString(), "Bookings") %>' Visible='<%# DataBinder.Eval(Container,"DataItem.RequireBooking")%>'></asp:HyperLink>
                            <asp:LinkButton ID="lnkCopy" runat="server" resourcekey="Copy" CommandName="Copy" CommandArgument='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>'  />
                            <asp:LinkButton ID="lnkDelete" runat="server" resourcekey="Delete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>' OnClientClick='<%# string.Format("return window.confirm(\"{0}\");", Localize("DeleteConfirm.Text")) %>'  />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>

    <EmptyDataTemplate>

        <h6><asp:Label ID="Label7" runat="server" resourcekey="NoRecordsFound"></asp:Label></h6>

    </EmptyDataTemplate>

    </asp:ListView>
    </div>

    <div class="pager">
    <asp:DataPager ID="dpEvents" runat="server" PageSize="30" 
        PagedControlID="lstEvents">
        <Fields>
            <asp:NumericPagerField ButtonCount="5" ButtonType="Button" CurrentPageLabelCssClass="current" NumericButtonCssClass="flexbtn"  />
        </Fields>
    </asp:DataPager>
    </div>
</div>

<ul class="dnnActions dnnClear">
    <li><asp:HyperLink ID="lnkAddNew" runat="server" resourcekey="AddNew" 
            CssClass="dnnPrimaryAction" /></li>
    <li class="returnlink">
        <a href="<%= DotNetNuke.Common.Globals.NavigateURL() %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a>
    </li>
</ul>
