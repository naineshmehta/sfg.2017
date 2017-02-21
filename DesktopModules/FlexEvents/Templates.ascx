<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Templates.ascx.cs" Inherits="BizModules.FlexEvents.Templates" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<uc1:Header ID="Header1" runat="server" />

<table class="flextable" width="100%">
    <tr>
        <td><dnn:label id="Label3" runat="server" resourcekey="TemplateFile" suffix=":"></dnn:label></td>
        <td>
            <asp:DropDownList ID="cboTemplateFile" runat="server" AutoPostBack="true"
                onselectedindexchanged="cboTemplateFile_SelectedIndexChanged" CssClass="templatefile">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td><dnn:label id="Label1" runat="server" resourcekey="Template" suffix=":"></dnn:label></td>
        <td>
            <asp:TextBox ID="txtTemplate" runat="server" Width="100%" 
                style="max-width:500px;" Rows="10" TextMode="MultiLine" CssClass="edittemplates"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td><dnn:label id="Label2" runat="server" resourcekey="Preview" suffix=":"></dnn:label></td>
        <td>
            <div class="previewtemplates"></div>    
        </td>
    </tr>
</table>


<ul class="dnnActions dnnClear">
    <li><asp:LinkButton ID="lnkUpdate" runat="server" resourcekey="cmdUpdate" 
            CssClass="dnnPrimaryAction" onclick="lnkUpdate_Click" /></li>
    <li id="liRestore" runat="server"><asp:LinkButton ID="lnkRestore" runat="server" resourcekey="Restore" onclick="lnkRestore_Click" /></li>
    <li class="returnlink">
        <a href="<%= DotNetNuke.Common.Globals.NavigateURL() %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a>
    </li>
</ul>
