<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventDocuments.ascx.cs" Inherits="BizModules.FlexEvents.EventDocuments" %>

        <asp:Panel ID="pnlDocuments" runat="server" CssClass="eventdocuments">
        <ul class="attchedfiles">
        <asp:Repeater ID="rptDocuments" runat="server">
            <ItemTemplate>
                <li>
                <asp:HyperLink ID="lnkDocument" runat="server" NavigateUrl='<%# ResolveUrl("~/"+(string)DataBinder.Eval(Container,"DataItem.Path"))%>' ToolTip='<%# System.IO.Path.GetFileName((string)DataBinder.Eval(Container,"DataItem.Path"))%>' CssClass='<%# ((bool)DataBinder.Eval(Container,"DataItem.CustomersOnly")) ? "private" : "public"%>'>
                    <img src='<%# GetIcon((string)DataBinder.Eval(Container,"DataItem.Path"))%>' />
                    <span><%# System.IO.Path.GetFileName((string)DataBinder.Eval(Container, "DataItem.Path"))%></span>
                </asp:HyperLink>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
        </asp:Panel>
