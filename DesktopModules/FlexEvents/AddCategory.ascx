<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.ascx.cs" Inherits="BizModules.FlexEvents.AddCategory" %>
<%@ Register src="Controls/ColorPicker.ascx" tagname="ColorPicker" tagprefix="uc2" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>

<uc1:Header ID="Header1" runat="server" />

<h3>
<asp:Label ID="lblTitle" runat="server"></asp:Label>
</h3>

<table class="flextable">
    <tr>
        <td><asp:label id="lblCategory" runat="server" resourcekey="Category"></asp:label>:</td>
        <td><asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategory"
                                            resourcekey="required"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td><asp:label id="Label2" runat="server" resourcekey="BackgroundColor"></asp:label>:</td>
        <td>
            <uc2:ColorPicker ID="ucColor2" runat="server" />
        </td>
    </tr>
    <tr>
        <td><asp:label id="Label1" runat="server" resourcekey="Description"></asp:label>:</td>
        <td>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
        </td>
    </tr>
</table>

<ul class="dnnActions dnnClear">
    <li><asp:LinkButton ID="lnkUpdate" runat="server" resourcekey="cmdUpdate" 
            CssClass="dnnPrimaryAction" onclick="lnkUpdate_Click" /></li>
    <li id="liDelete" runat="server"><asp:LinkButton ID="lnkDelete" runat="server" resourcekey="cmdDelete" onclick="lnkDelete_Click" /></li>
    <li class="returnlink">
        <a href="<%= EditUrl("Categories") %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a>
    </li>
</ul>
