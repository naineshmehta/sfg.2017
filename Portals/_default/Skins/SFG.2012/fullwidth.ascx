<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TEXT" Src="~/Admin/Skins/Text.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKS" Src="~/Admin/Skins/Links.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CONTROLPANEL" Src="~/Admin/Skins/controlpanel.ascx" %>

<div id="DNN6">
    <div id="ContentBG">
        <div id="ControlPanelWrapper">
            <dnn:CONTROLPANEL runat="server" id="cp"  IsDockable="True" Visible="true" />
	    </div>
    </div>
    <div id="Header">
         <div id="LogoRow">
		    <dnn:LOGO id="dnnLogo" runat="server" />
	    </div> 
	    <div id="AdSlot">
	        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<!-- Leaderboard -->
			<ins class="adsbygoogle"
				 style="display:inline-block;width:728px;height:90px"
				 data-ad-client="ca-pub-5229385428048486"
				 data-ad-slot="2352874227"></ins>
			<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
	    </div>
	</div>
	<div id="MenuBar">
	    <div id="SearchPanel">
	        <dnn:SEARCH ID="dnnSearch" runat="server" UseDropDownList="true" EnableTheming="true" SiteText="Search SFG" WebText="Search Google" ShowSite="true" ShowWeb="false" SiteIconURL="/Portals/_default/Skins/SFG.2012/images/sfg_search_icon.gif" Submit="<img src='images/SearchButton.png' alt='Search' />" />
	    </div>
	    <div id="Nav">
	        <dnn:MENU ID="MENU2" MenuStyle="Mega2DNN" runat="server" Visible="true" >
	        </dnn:MENU>	        
	    </div>  
	</div>
    <div id="Content">
        <div id="Panes">
            <div id="Breadcrumb"><dnn:TEXT runat="server" id="dnnTEXT"  CssClass="Intro" Text="You are here:" ResourceKey="Breadcrumb" /><dnn:BREADCRUMB ID="dnnBreadcrumb" runat="server" RootLevel="0" Separator="<span class='Sep'>></span>" /></div>
            <div id="Login"><dnn:LOGIN ID="LOGIN1" CssClass="LoginLink" runat="server" />&nbsp;|&nbsp;<dnn:USER ID="USER1" runat="server" /></div>
            
            <div id="ContentFullWidth">
                <div id="ContentPane" runat="server"></div>
            </div>
        </div>
    </div>
    <div id="Footer" class="footerback">
        <div id="FooterText">
            <ul>
                <li><asp:HyperLink  NavigateUrl="~/Event-Calendar.aspx" Text="Event Calendar" runat="server"></asp:HyperLink></li>
				<li>|</li>
                <li><asp:HyperLink  NavigateUrl="~/Forum.aspx" Text="Forum" runat="server"></asp:HyperLink></li>
				<li>|</li>
                <li><asp:HyperLink  NavigateUrl="~/Competitions.aspx" Text="Competitions" runat="server"></asp:HyperLink></li>
				<li>|</li>
                <li><asp:HyperLink  NavigateUrl="~/Jobs-at-Summer-Festival-Guide.aspx" Text="Jobs / Vacancies" runat="server"></asp:HyperLink></li>                    
				<li>|</li>
                <li><asp:HyperLink NavigateUrl="~/Festival-News.aspx" Text="Latest Festival News" runat="server"></asp:HyperLink></li>
				<li>|</li>
				<li><asp:HyperLink NavigateUrl="~/Who-are-we.aspx" Text="Who Are We" runat="server"></asp:HyperLink></li>                   
            </ul>
            <div style="clear:both;" />     
            <div id="copy_style" class="footer">
                <dnn:COPYRIGHT runat="server" ID="COPYRIGHT1" CssClass="footer" />
            </div>
            <br />
            Your online portal to the world of UK and Europe Summer Festivals
            <br />
            <br />
            <div class="bot_pad">
                <div id="terms_style" class="footer">
                    <dnn:PRIVACY runat="server" ID="PRIVACY1" CssClass="footer" />
                    &nbsp;&nbsp;|&nbsp;&nbsp;<dnn:TERMS runat="server" ID="TERMS1" CssClass="footer" />
                    &nbsp;&nbsp;|&nbsp;&nbsp;<asp:HyperLink ID="HyperLink6" NavigateUrl="~/Cookies.aspx" Text="Cookie Info" runat="server" CssClass="footer"></asp:HyperLink>
                </div>
            </div>
            This site was designed by Sydney based designer Liz Laughton - portfolio at <a href="http://www.pixelchicken.com"
                class="green" target="_blank">pixelchicken design</a>
        </div>
        <!--  END footer -->
    </div>    
</div>

<script runat="server">
  'for mega menu we need to register hoverIntent plugin, but avoid duplicate registrations
  Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
    Page.ClientScript.RegisterClientScriptInclude("hoverintent", ResolveUrl("~/Resources/Shared/Scripts/jquery/jquery.hoverIntent.min.js"))
  End Sub
</script>

<dnn:STYLES runat="server" ID="StylesIE6" Name="IE6Minus" StyleSheet="css/ie6skin.css"
    Condition="LT IE 7" UseSkinPath="true" />
