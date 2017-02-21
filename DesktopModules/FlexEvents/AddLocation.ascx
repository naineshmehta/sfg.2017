<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddLocation.ascx.cs" Inherits="BizModules.FlexEvents.AddLocation" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>

<uc1:Header ID="Header1" runat="server" />

<h3>
<asp:Label ID="lblTitle" runat="server"></asp:Label>
</h3>

<table class="flextable">
    <tr>
        <td><asp:label id="Label3" runat="server" resourcekey="TimeZone"></asp:label>:</td>
        <td>
            <asp:DropDownList ID="cboTimeZone" runat="server" Width="300px" DataTextField="DisplayName" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td><asp:label id="Label1" runat="server" resourcekey="Address"></asp:label>:</td>
        <td>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="mapaddress" Width="300px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAddress"
                                            resourcekey="required"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td><asp:label id="lblName" runat="server" resourcekey="Name"></asp:label>:</td>
        <td><asp:TextBox ID="txtName" runat="server" Width="300px" CssClass="mapname"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtName"
                                            resourcekey="required"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td><asp:label id="Label2" runat="server" resourcekey="Coordinates"></asp:label>:</td>
        <td>
            <div id="map_canvas" class="map_canvas loading" runat="server"></div>
            <asp:textbox id="txtLocationHolder" runat="server" CssClass="locationholder" style="display: none;" />
            <asp:textbox id="txtDetailHolder" runat="server" CssClass="detailholder" style="display: none;" />
            <asp:textbox id="txtTypeHolder" runat="server" CssClass="typeholder" style="display: none;" />
            <asp:textbox id="txtCountry" runat="server" CssClass="countryholder" style="display: none;" />
            <asp:textbox id="txtRegion" runat="server" CssClass="regionholder" style="display: none;" />
        </td>
    </tr>
</table>

<ul class="dnnActions dnnClear">
    <li><asp:LinkButton ID="lnkUpdate" runat="server" resourcekey="cmdUpdate" 
            CssClass="dnnPrimaryAction" onclick="lnkUpdate_Click" /></li>
    <li id="liDelete" runat="server"><asp:LinkButton ID="lnkDelete" runat="server" resourcekey="cmdDelete" onclick="lnkDelete_Click" /></li>
    <li class="returnlink"><a href="<%= EditUrl("Locations") %>"><asp:Label ID="lblReturn" runat="server" resourcekey="Return"></asp:Label></a></li>
 </ul>
