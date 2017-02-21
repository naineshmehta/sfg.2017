<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventReviews.ascx.cs" Inherits="BizModules.FlexEvents.EventReviews" %>
<%@ Register TagPrefix="dnn" TagName="login" Src="~/admin/skins/login.ascx" %>

<asp:Panel ID="pnlPost" runat="server" class="newcomment">
<table width="100%">
	<tr>
		<td class='avatar'>
			<asp:Image ID="imgAvatar" runat="server" ImageUrl="~/DesktopModules/FlexEvents/Images/Avatar.png" />
		</td>
		<td class="postcomment">
			<div class='commentbody'><textarea style="" class="NormalTextbox" placeholder='<%=Localize("YourReview") %>'></textarea></div>
			<div class='footer'>
                <div class="postingas">
                    <asp:label id="Label1" runat="server" resourcekey="PostingAs"></asp:label> <asp:Label ID="lblPostingAs" runat="server" Text=""></asp:Label>
                    <dnn:login id="ctlLogin" runat="server"></dnn:login>
                </div>
                <div class="postbutton">
                    <asp:HyperLink ID="lnkPost" runat="server" NavigateUrl="javascript:void(0);" resourcekey="Post" CssClass="roundbtn post"></asp:HyperLink>
                </div>
            </div>
		</td>
	</tr>
</table>
</asp:Panel>

<asp:Panel ID="pnlLogin" runat="server" class="greybox">
    <asp:Label ID="lblNeedLogin" runat="server"></asp:Label>
</asp:Panel>

<div class="comments">
    <asp:TextBox ID="txtEventId" runat="server" CssClass="eventid" style="display:none;"></asp:TextBox>
    <div class="list"></div>

    <div class="loadmore">
        <asp:HyperLink ID="lnkLoadMore" runat="server" NavigateUrl="javascript:void(0);" resourcekey="LoadMore"></asp:HyperLink>
    </div>
</div>