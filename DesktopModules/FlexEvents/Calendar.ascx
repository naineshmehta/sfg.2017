<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Calendar.ascx.cs" Inherits="BizModules.FlexEvents.Calendar" %>

<div class="fxecalendar col<%=GetModuleSetting(BizModules.FlexEvents.FXESetting.MaxColumns) %>">

<asp:Repeater ID="rptCalendar" runat="server">
    <ItemTemplate>
        <div class="month has<%# DataBinder.Eval(Container,"DataItem.Weeks")%>weeks">
        <div class="monthinner">
            <table width="100%" cellpadding="0" cellspacing="1">
            <tr>
                <th colspan="7" class="monthname"><%# DataBinder.Eval(Container,"DataItem.Name")%></th>
            </tr>
            <tr>
                <th><asp:label id="Label1" runat="server" resourcekey="Sun"></asp:label></th>
                <th><asp:label id="Label2" runat="server" resourcekey="Mon"></asp:label></th>
                <th><asp:label id="Label4" runat="server" resourcekey="Tue"></asp:label></th>
                <th><asp:label id="Label5" runat="server" resourcekey="Wed"></asp:label></th>
                <th><asp:label id="Label6" runat="server" resourcekey="Thu"></asp:label></th>
                <th><asp:label id="Label7" runat="server" resourcekey="Fri"></asp:label></th>
                <th><asp:label id="Label8" runat="server" resourcekey="Sat"></asp:label></th>
            </tr>

            <%# DataBinder.Eval(Container,"DataItem.Body")%>
            </table>
        </div>
        </div>
    </ItemTemplate>
</asp:Repeater>


    <asp:panel ID="pnlLegend" runat="server" CssClass="legend">
        <ul>
            <asp:Repeater ID="rptCategories" runat="server">
                <ItemTemplate>
                    <li><a href="javascript:void(0);" rel='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>'><span style='background-color:#<%# DataBinder.Eval(Container,"DataItem.BackgroundColor")%>;'></span><%# DataBinder.Eval(Container,"DataItem.Category")%></a></li>
                </ItemTemplate>
            </asp:Repeater>

            <li class="reset"><a href="javascript:void(0);" rel='0'><span></span><%=Localize("AllEvents") %></a></li>
        </ul>
    </asp:panel>

</div>