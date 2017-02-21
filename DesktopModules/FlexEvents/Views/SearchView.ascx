<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchView.ascx.cs" Inherits="BizModules.FlexEvents.Views.SearchView" %>

<div class="searchview listview">

    <h5 class="summary">
        <asp:Label ID="lblSummary" runat="server"></asp:Label>
        <asp:HyperLink ID="lnkAllEvents" runat="server" resourcekey="AllEvents" CssClass="allevents"></asp:HyperLink>
    </h5>

    <asp:ListView ID="lstEvents" runat="server" ItemPlaceholderID="PlaceHolder1" 
        DataKeyNames="OccuranceId" onitemdatabound="lstEvents_ItemDataBound" >

    <LayoutTemplate>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </LayoutTemplate>

    <ItemTemplate>

    </ItemTemplate>

    <EmptyDataTemplate>

        <h6><asp:Label ID="Label7" runat="server" resourcekey="NoRecordsFound"></asp:Label></h6>

    </EmptyDataTemplate>

</asp:ListView>

</div>
