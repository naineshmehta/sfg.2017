<%@ Control AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>


<dnn:DnnCssInclude ID="DnnCssInclude1" runat="server" FilePath="css/slick.css" />
<dnn:DnnJsInclude ID="DnnJsInclude4" runat="server" FilePath="js/slick.js" PathNameAlias="SkinPath" />


<div class="DnnF_slider">
	<div id="ContentPane" runat="server"></div>
	<div class="clear"></div>
</div>



<dnn:DnnJsInclude ID="DnnJsInclude1" runat="server" FilePath="js/foundation/foundation.orbit.js" PathNameAlias="SkinPath" />



