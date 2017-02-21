<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="BizModules.FlexEvents.Search" %>

<div class="divsearch">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
    <td class="searchoptions">
        <div class="location">
        <div>
            <asp:label id="Label3" runat="server" resourcekey="Location"></asp:label>
            <div class="styledlocation">
            <asp:DropDownList ID="cboLocations" runat="server" CssClass="locationlist" 
                    DataTextField="Name" DataValueField="ItemId">
                </asp:DropDownList>
                </div>
        </div>
        </div>
        <div class="daterange">
        <div>
            <asp:label id="lblDateRange" runat="server"></asp:label>
            <asp:TextBox ID="txtDateRange" runat="server" CssClass="runningdate"></asp:TextBox>
        </div>
        </div>
        <div class="keyword">
        <div>
            <asp:label id="Label4" runat="server" resourcekey="OrByKeyword"></asp:label>
            <asp:TextBox ID="txtEventName" runat="server" CssClass="eventname"></asp:TextBox>
            <asp:TextBox ID="txtEventId" runat="server" CssClass="eventid" style="display: none;"></asp:TextBox>
        </div>
        </div>
        <div class="search">
        <div>
            <asp:Button ID="btnSearch" runat="server" resourcekey="FindEvents" 
                onclick="btnSearch_Click" />
        </div>
        </div>
    </td>
    <td id="tdViewSwitch" runat="server" class="viewswitch">
            <ul class="viewswitch">
                    <asp:Repeater ID="rptViewOptions" runat="server">
                        <ItemTemplate>
                            <li><a <%# string.IsNullOrEmpty((string)DataBinder.Eval(Container,"DataItem.Url")) ? " class='active'" : "href='"+(string)DataBinder.Eval(Container,"DataItem.Url")+"'"%>><img alt='' src='<%#(string)DataBinder.Eval(Container,"DataItem.Icon")%>' /><span><%# DataBinder.Eval(Container,"DataItem.Name")%></span></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
            </ul>
    </td>
    </tr>
</table>

</div>