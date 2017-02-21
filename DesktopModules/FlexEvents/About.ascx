<%@ Control Language="C#" AutoEventWireup="True" Inherits="BizModules.FlexEvents.About" Codebehind="About.ascx.cs" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>
<uc1:Header ID="Header1" runat="server" />

<table class="flextable">
    <tr>
        <td><asp:Label ID="Label11" runat="server" resourcekey="ProductName"></asp:Label></td>
        <td><asp:Label ID="lblProductName" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label12" runat="server" resourcekey="ProductVersion"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblProductVersion" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td><asp:Label ID="Label13" runat="server" resourcekey="Activated"></asp:Label></td>
        <td><asp:Label ID="lblActivated" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label14" runat="server" resourcekey="RunMode"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblRunMode" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td><asp:Label ID="Label2" runat="server" resourcekey="SupportForum"></asp:Label>
        </td>
        <td>
            <asp:hyperlink id="Hyperlink1" runat="server" NavigateUrl="http://www.bizmodules.net/tabid/55/Default.aspx" resourcekey="Visit" target="_blank" />
        </td>
    </tr>
    <tr>
        <td><asp:Label ID="Label1" runat="server" resourcekey="UserGuide"></asp:Label>
        </td>
        <td>
            <asp:hyperlink id="lnkUserGuide" runat="server" NavigateUrl="http://www.bizmodules.net/tabid/141/Default.aspx" resourcekey="Download" target="_blank" />
        </td>
    </tr>
</table>
      
  <ul class="dnnActions dnnClear">
    <li><asp:LinkButton id="lnkActivate" runat="server" cssclass="dnnPrimaryAction" 
            onclick="lnkActivate_Click"></asp:LinkButton></li>
    <li class="returnlink">
        <a href="<%= DotNetNuke.Common.Globals.NavigateURL() %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a>
    </li>
  </ul>



<asp:Panel ID="pnlActivate" runat="server" Visible="false">
<p />

<div class="warning">
    <p>You should receive a serial number by email to activate this product after buying it on DNN Store, visit below URL to re-send if it failed to arrive: </p>
    <p>http://www.bizmodules.net/DesktopModules/BizModules - IONConnecter/Resend.aspx?sku=FXE&email=<span class='updatefield'>Your Email Address</span></p>
    <p>Click manual activate if your server is behind a firewall.</p> 
</div>

<table class="flextable">
    <tr>
        <td><asp:Label ID="plSerialNo" runat="server" resourcekey="SerialNo" ControlName="txtSerialNo"></asp:Label></td>
        <td><asp:TextBox ID="txtSerialNo" runat="server" Width="300px" CssClass="NormalTextBox"></asp:TextBox></td>
    </tr>
    <tr id="trActivationCode" runat="server" visible="false">
        <td>Activation Code</td>
        <td>
            <asp:TextBox ID="txtActivationCode" runat="server" TextMode="MultiLine" Width="300px" Height="80px" onclick='this.select();'></asp:TextBox>
        </td>
    </tr>
    <tr id="trManualActivationUrl" runat="server" visible="false">
        <td>Manual Activation Url</td>
        <td>
            <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" NavigateUrl="http://www.bizmodules.net/desktopmodules/bizmodules - ionconnecter/manualactivate.aspx" text="http://www.bizmodules.net/desktopmodules/bizmodules - ionconnecter/manualactivate.aspx"></asp:HyperLink>
        </td>
    </tr>
</table>
      
  <ul class="dnnActions dnnClear">
    <li><asp:LinkButton id="cmdUpdate" runat="server" cssclass="dnnPrimaryAction" resourcekey="Validate" OnClick="cmdUpdate_Click"></asp:LinkButton></li>
    <li><asp:LinkButton class="dnnSecondaryAction" ID="cmdManual" runat="server" resourcekey="cmdManual" OnClick="cmdManual_Click"></asp:LinkButton></li>
  </ul>
</asp:Panel>