<%@ Control AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" Src="~/Admin/Containers/Visibility.ascx" %>

<div class="DnnF_Title_h6 SpacingBottom">
    <h6><dnn:TITLE runat="server" id="dnnTITLE" CssClass="TitleH6" /></h6>
    <div id="ContentPane" runat="server"></div>
	<div class="clear"></div>
</div>



