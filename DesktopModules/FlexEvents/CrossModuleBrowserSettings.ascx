<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CrossModuleBrowserSettings.ascx.cs" Inherits="BizModules.FlexEvents.CrossModuleBrowserSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<h3>
<asp:Label ID="lblTitle" runat="server" resourcekey="ModuleSettings"></asp:Label>
</h3>

<table class="flextable">
    <tr>
        <td><dnn:label id="Label1" runat="server" resourcekey="CategoryFilter" suffix=":"></dnn:label></td>
        <td>
            <asp:CheckBox ID="chkCategoryFilter" runat="server" resourcekey="YesNo" 
                        CssClass="flextoggle normalCheckBox" />
        </td>
    </tr>
    <tr>
        <td><dnn:label id="Label2" runat="server" resourcekey="LocationFilter" suffix=":"></dnn:label></td>
        <td>
            <asp:CheckBox ID="chkLocationFilter" runat="server" resourcekey="YesNo" 
                        CssClass="flextoggle normalCheckBox" />
        </td>
    </tr>
    <tr>
        <td><dnn:label id="Label3" runat="server" resourcekey="DateFilter" suffix=":"></dnn:label></td>
        <td>
            <asp:CheckBox ID="chkDateFilter" runat="server" resourcekey="YesNo" 
                        CssClass="flextoggle normalCheckBox" />
        </td>
    </tr>
    <tr>
        <td><dnn:label id="Label4" runat="server" resourcekey="EventModules" suffix=":"></dnn:label></td>
        <td>
            <asp:DropDownList ID="cboEventModules" runat="server" DataTextField="ModuleTitle" DataValueField="ModuleId"></asp:DropDownList>
            <ul id="selectedCategories">
            </ul>
        </td>
    </tr>
    <tr>
        <td><dnn:label id="Label5" runat="server" resourcekey="ListViewPageSize" suffix=":"></dnn:label></td>
        <td>
            <asp:TextBox ID="txtListViewPageSize" runat="server" Width="150px" type="number"></asp:TextBox>
            <asp:RegularExpressionValidator ID="rev2" runat="server" 
                ControlToValidate="txtListViewPageSize" resourcekey="invalid" ForeColor="Red" 
                ValidationExpression="^-*[0-9,\.]+$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td><dnn:label id="Label6" runat="server" resourcekey="DefaultCategory" suffix=":"></dnn:label></td>
        <td>
            <asp:TextBox ID="txtDefaultCategory" runat="server" Width="150px"></asp:TextBox>
        </td>
    </tr>
</table>

<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery("#<%=cboEventModules.ClientID %>").categorypicker({max:5});
    });
</script>


<ul class="dnnActions dnnClear">
    <li><asp:LinkButton ID="lnkUpdate" runat="server" resourcekey="cmdUpdate" 
            CssClass="dnnPrimaryAction" onclick="lnkUpdate_Click" /></li>
    <li class="returnlink">
        <a href="<%= DotNetNuke.Common.Globals.NavigateURL() %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a>
    </li>
</ul>
