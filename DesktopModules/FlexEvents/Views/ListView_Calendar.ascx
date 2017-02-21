<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListView_Calendar.ascx.cs" Inherits="BizModules.FlexEvents.Views.ListView_Calendar" %>

<%@ Register src="../Controls/CategoryPicker.ascx" tagname="CategoryPicker" tagprefix="uc1" %>

<div class="toparea">
<table width="100%">
    <tr>
    <td>
        <asp:panel ID="pnlMonth" runat="server">
            <asp:RadioButtonList ID="rdoMonth" runat="server" 
                CssClass="barstyleradio normalRadioButton bigger green" RepeatLayout="OrderedList" 
                AutoPostBack="true" onselectedindexchanged="rdoMonth_SelectedIndexChanged">
                <asp:ListItem Value="0" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1"></asp:ListItem>
                <asp:ListItem Value="2"></asp:ListItem>
                <asp:ListItem Value="3"></asp:ListItem>
            </asp:RadioButtonList>
        </asp:panel>
    </td>
    <td>
        
        <uc1:CategoryPicker ID="CategoryPicker1" runat="server" />
        
    </td>
    </tr>
</table>
</div>

<p class="summary">
<asp:Label ID="lblSummary" runat="server"></asp:Label>
</p>

<table width="100%" cellpadding="0" cellspacing="0" class="calendarview" border="1">
<tr>
    <th><asp:label id="Label1" runat="server" resourcekey="Sunday"></asp:label></th>
    <th><asp:label id="Label2" runat="server" resourcekey="Monday"></asp:label></th>
    <th><asp:label id="Label4" runat="server" resourcekey="Tuesday"></asp:label></th>
    <th><asp:label id="Label5" runat="server" resourcekey="Wednesday"></asp:label></th>
    <th><asp:label id="Label6" runat="server" resourcekey="Thursday"></asp:label></th>
    <th><asp:label id="Label7" runat="server" resourcekey="Friday"></asp:label></th>
    <th><asp:label id="Label8" runat="server" resourcekey="Saturday"></asp:label></th>
</tr>

<%=CalendarBody %>
</table>

<div>
<asp:LinkButton ID="lnkPrevious" runat="server" Text="" CssClass="flexbtn"
        onclick="lnkPrevious_Click"></asp:LinkButton>
<span style="float:right;">
<asp:LinkButton ID="lnkNextMonth" runat="server" Text=""  CssClass="flexbtn"
        onclick="lnkPrevious_Click"></asp:LinkButton>
</span>
</div>