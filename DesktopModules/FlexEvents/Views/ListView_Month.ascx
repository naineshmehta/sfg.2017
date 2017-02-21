<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListView_Month.ascx.cs" Inherits="BizModules.FlexEvents.Views.ListView_Month" %>

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

        <uc1:CategoryPicker ID="CategoryPicker1" runat="server" AutoPostBack="True" onPickedCategory="PickedCategory" />

    </td>
    </tr>
</table>
</div>

<div class="listview monthview">
    <h5 class="summary"><asp:Label ID="lblSummary" runat="server"></asp:Label></h5>

    <asp:ListView ID="lstEvents" runat="server" ItemPlaceholderID="PlaceHolder1" 
        DataKeyNames="OccuranceId" onitemdatabound="lstEvents_ItemDataBound" 
        onpagepropertieschanging="lstEvents_PagePropertiesChanging" EnableViewState="false">

    <LayoutTemplate>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </LayoutTemplate>

    <ItemTemplate>

    </ItemTemplate>

    <EmptyDataTemplate>

        <h6><asp:Label ID="Label7" runat="server" resourcekey="NoRecordsFound"></asp:Label></h6>

    </EmptyDataTemplate>

</asp:ListView>

    <div class="pager">
    <asp:DataPager ID="dpEvents" runat="server" 
        PagedControlID="lstEvents">
        <Fields>
            <asp:NumericPagerField ButtonCount="5" ButtonType="Button" CurrentPageLabelCssClass="current" NumericButtonCssClass="flexbtn"  />
        </Fields>
    </asp:DataPager>
    </div>
</div>