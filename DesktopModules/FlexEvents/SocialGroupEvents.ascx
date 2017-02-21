<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SocialGroupEvents.ascx.cs" Inherits="BizModules.FlexEvents.SocialGroupEvents" %>

<asp:Panel ID="pnlFreeEventList" runat="server" CssClass="listview freeeventlist">
    <asp:ListView ID="lstEvents" runat="server" ItemPlaceholderID="PlaceHolder1" 
        DataKeyNames="OccuranceId" onitemdatabound="lstEvents_ItemDataBound" 
    EnableViewState="false">

    <LayoutTemplate>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </LayoutTemplate>

    <ItemTemplate>

    </ItemTemplate>

    <EmptyDataTemplate>

        <h6><asp:Label ID="Label7" runat="server" resourcekey="NoRecordsFound"></asp:Label></h6>

    </EmptyDataTemplate>

    </asp:ListView>
</asp:Panel>