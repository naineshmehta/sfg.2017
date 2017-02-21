<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListView_Map.ascx.cs" Inherits="BizModules.FlexEvents.Views.ListView_Map" %>

<%@ Register src="../Controls/CategoryPicker.ascx" tagname="CategoryPicker" tagprefix="uc1" %>

<div class="toparea">
<table width="100%">
    <tr>
    <td>
        <asp:panel ID="pnlMonth" runat="server">
            <asp:RadioButtonList ID="rdoMonth" runat="server" 
                CssClass="barstyleradio normalRadioButton bigger green" RepeatLayout="OrderedList">
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

<div id="map_canvas" class="map_canvas loading" style="height:<%=MapHeight.ToString()%>px;"></div>
<script type="text/javascript">
    var defaultEvents = <%=DefaultEvents %>;
</script>