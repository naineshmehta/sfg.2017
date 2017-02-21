<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageReviews.ascx.cs" Inherits="BizModules.FlexEvents.ManageReviews" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>
<uc1:Header ID="Header1" runat="server" />

<h3><asp:Label ID="lblTitle" runat="server" resourcekey="ManagementReviews"></asp:Label></h3>

<fieldset class="searchfilters">
<legend><asp:Label ID="Label4" runat="server" resourcekey="NarrowResults"></asp:Label></legend>
        <table class="flextable" cellspacing="0" cellpadding="5">
        <tr><td><asp:label id="Label1" runat="server" resourcekey="Status"></asp:label></td><td>
            <asp:DropDownList ID="cboStatus" runat="server" Width="200px" 
                AutoPostBack="True" 
                onselectedindexchanged="cboStatus_SelectedIndexChanged">
                <asp:ListItem Value="Approved"></asp:ListItem>
                <asp:ListItem Value="Pending"></asp:ListItem>
            </asp:DropDownList>
        </td></tr>
        <tr><td><asp:label id="Label3" runat="server" resourcekey="Event"></asp:label></td><td>
            <asp:DropDownList ID="cboEvent" runat="server" DataTextField="Title" 
                DataValueField="ItemId" Width="200px" 
                AutoPostBack="True" onselectedindexchanged="cboEvent_SelectedIndexChanged">
            </asp:DropDownList>
        </td></tr>
        <tr><td><asp:label id="Label2" runat="server" resourcekey="Keyword"></asp:label></td><td>
            <asp:TextBox ID="txtKeyword" runat="server" Width="200px" CssClass="eventname"></asp:TextBox>
            <asp:ImageButton ID="imgSearch" runat="server" ImageUrl="~/Images/view.gif" CssClass="searchreview" 
                onclick="imgSearch_Click" />
        </td></tr>
        </table>
</fieldset>

    <h5 class="summary"><asp:Label ID="lblSummary" runat="server"></asp:Label></h5>

    <div class="comments reviewslist">
        <asp:ListView ID="lstReviews" runat="server" ItemPlaceholderID="PlaceHolder1" 
            DataKeyNames="ItemId" 
            onpagepropertieschanging="lstReviews_PagePropertiesChanging" 
            onitemcommand="lstReviews_ItemCommand" 
            onitemdeleting="lstReviews_ItemDeleting">

        <LayoutTemplate>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>

        <ItemTemplate>
            <div class="review">
                <table width="100%">
                    <tr>
                        <td class='avatar'>
                            <asp:Image ID="imgLogo" runat="server" ImageUrl='<%# ProfilePhoto((int)DataBinder.Eval(Container,"DataItem.UserId"))%>' />
                        </td>
                        <td class="colright">
                            <div class='title'><%# EventLInk((int)DataBinder.Eval(Container,"DataItem.EventId"))%></div>
                            <div class='commentbody'>
                            <%# DataBinder.Eval(Container,"DataItem.Comment")%></div>
                            <div class='header'><span class='author'><%# DataBinder.Eval(Container,"DataItem.UserFullName")%></span><asp:Label ID="lblUserFrom" runat="server" CssClass='userfrom' Text='<%# DataBinder.Eval(Container,"DataItem.UserFrom")%>' Visible='<%# !string.IsNullOrEmpty((string)DataBinder.Eval(Container,"DataItem.UserFrom"))%>'></asp:label><span class='timeago'><%# HowLongAgo((DateTime)DataBinder.Eval(Container,"DataItem.CreatedDate"))%></span></div>
                            <div class="lineseparator"></div>
                            <div class='actions'>
				                <asp:LinkButton ID="lnkDelete" runat="server" resourcekey="Delete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>' OnClientClick='<%# string.Format("return window.confirm(\"{0}\");", Localize("DeleteConfirm.Text")) %>'  />
				                <asp:LinkButton ID="lnkApprove" runat="server" resourcekey="Show" CommandName="Show" CommandArgument='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>' Visible='<%# DataBinder.Eval(Container,"DataItem.Pending")%>' />
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
    <asp:DataPager ID="dpReviews" runat="server" PageSize="25"
        PagedControlID="lstReviews">
        <Fields>
            <asp:NumericPagerField ButtonCount="5" ButtonType="Button" CurrentPageLabelCssClass="current" NumericButtonCssClass="flexbtn"  />
        </Fields>
    </asp:DataPager>
    </div>
</div>

<ul class="dnnActions dnnClear">
    <li class="returnlink">
        <a href="<%= DotNetNuke.Common.Globals.NavigateURL() %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a>
    </li>
</ul>
