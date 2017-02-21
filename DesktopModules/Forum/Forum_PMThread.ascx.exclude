<%@ Register TagPrefix="dnnforum" Namespace="DotNetNuke.Modules.Forum.WebControls" Assembly="DotNetNuke.Modules.Forum" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Control Language="vb" Codebehind="Forum_PMThread.ascx.vb" AutoEventWireup="false" Inherits="DotNetNuke.Modules.Forum.PMThread" %>
<link href="<%= ForumConfig.Css() %>" type="text/css" rel="stylesheet" />
<table id="tblMain" cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td valign="top" align="center" width="100%">
            <asp:DataList ID="lstPost" runat="server" DataKeyField="PMID" CellPadding="0" width="100%">
                <ItemTemplate>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0" runat="server" id="tblPostList">
                        <tr>
                            <td width="100%">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" id="tblPostHeader">
                                    <tr>
                                        <td class="Forum_AltHeader" width="100%">
                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                <tr>
                                                    <td valign="middle">
                                                        <asp:Image runat="server" ID="imgPostRead" />
                                                    </td>
                                                    <td align="left" width="70%" valign="middle">
                                                        &nbsp;<asp:Label CssClass="Forum_AltHeaderText" runat="server" ID="lblCreatedDate" />
                                                    </td>
                                                    <td align="right" width="30%">
                                                        <asp:Label CssClass="Forum_AltHeaderText" runat="server" ID="Label1" resourcekey="To"/>&nbsp;
                                                        <asp:HyperLink CssClass="Forum_Profile" runat="server" ID="hlToUser" Target="_blank" />&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="1%">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" id="tblPost">
                                    <tr>
                                        <td class="Forum_Avatar" width="25%" align="center" valign="top">
                                            <table cellpadding="0" cellspacing="0" border="0" width="100%" id="tblAvatar">
                                                <tr>
                                                    <td width="100%" align="center">
                                                        <asp:HyperLink CssClass="Forum_Profile" runat="server" ID="lblAlias" Target="_blank" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:Label CssClass="Forum_Normal" Text='Member Since' runat="server" ID="lblMemberSince"
                                                            resourcekey="lblMemberSince" /><br>
                                                        <asp:Label CssClass="Forum_Normal" runat="server" ID="lblUserJoinedDate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:Image id="userAvatar" runat="server" /><br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="Forum_PostBody_Container" width="75%" align="left" valign="top">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td id="cellSubject" class="Forum_PostDetails">
                                                        <asp:Label CssClass="Forum_NormalBold" runat="server" ID="lblPMSubject" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="PostCreatedDetails" class="Forum_PostButtons" align="right">
                                                        <table cellpadding="0" cellspacing="4" border="0" id="tblButtons">
                                                            <tr>
                                                                <td class="Forum_ReplyCell">
                                                                    <asp:LinkButton ID="cmdReply" runat="server" CommandName="Reply" Text="Reply" CssClass="Forum_Link" /></td>
                                                                <td class="Forum_ReplyCell">
                                                                    <asp:LinkButton ID="cmdQuote" runat="server" CommandName="Quote" Text="Quote" CssClass="Forum_Link" /></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Forum_PostBody">
                                                        <asp:Label CssClass="Forum_Normal" Text='<%# FormatBody(DataBinder.Eval(Container.DataItem,"Body")) %>'
                                                            runat="server" ID="lblPostBody" />
                                                    </td>
                                                </tr>
                                             </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                     </table>
                </ItemTemplate>
            </asp:DataList>
         </td>
    </tr>
	<tr>
	    <td width="100%" class="">
			<table cellspacing="0" cellpadding="0" width="100%" border="0">
	            <tr>
	                <td class="Forum_FooterCapLeft"><asp:Image ID="imgFootSpacer" runat="server" /></td>
	                <td class="Forum_Footer">
	                    <dnnforum:pagingcontrol id="ctlPagingControl" runat="server"></dnnforum:pagingcontrol>
	                </td>
	                <td class="Forum_FooterCapRight"><asp:Image ID="imgFootSpacer2" runat="server" /></td>
	            </tr>
	        </table>
	    </td>
    </tr>
    <tr>
        <td width="100%" valign="middle" align="center">
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td valign="middle" align="center" width="100%">
                        <asp:LinkButton ID="cmdInbox" runat="server" CssClass="CommandButton" resourcekey="cmdInbox"></asp:LinkButton></td>
                 </tr>
                 <tr>
                     <td id="rowDeleted" runat="server" valign="middle" align="center">
                        <asp:Label CssClass="NormalRed" runat="server" ID="lblDeleted" />
                     </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
