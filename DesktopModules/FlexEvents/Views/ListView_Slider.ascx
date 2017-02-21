<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListView_Slider.ascx.cs" Inherits="BizModules.FlexEvents.Views.ListView_Slider" %>

<div class="sliderviewtop">
    <table width="100%">
        <tr><td><asp:Label ID="Label2" runat="server" resourcekey="FindRace"></asp:Label></td><td  class="rightalign">
            <asp:Label ID="Label1" runat="server" resourcekey="MilesKM" CssClass="rightalign"></asp:Label>
        </td></tr>
        <tr><td colspan="2"><div id="categoryslider"></div></td></tr>
        <tr><td class="range"><asp:Label ID="Label4" runat="server" resourcekey="LowRange"></asp:Label></td>
        <td class="rightalign range"><asp:Label ID="Label5" runat="server" resourcekey="HighRange"></asp:Label></td>
        </tr>
        <tr><td colspan="2" class="textcenter">

            <table class="categories">
            <tr>
            <asp:Repeater ID="lstCategories" runat="server">
                <ItemTemplate>
                    <td>
                    <asp:HyperLink ID="lnkCategory" runat="server" NavigateUrl='#' CssClass="category" rel='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>'>
                        <span class="categorytitle"><%# DataBinder.Eval(Container,"DataItem.Category")%></span>
                        <span class="categorydesc"><%# ((string)DataBinder.Eval(Container,"DataItem.Description")).Replace("\n","<br/>")%></span>
                    </asp:HyperLink>
                    </td>
                </ItemTemplate>
                <SeparatorTemplate><td><div class="separator">|</div></td></SeparatorTemplate>
            </asp:Repeater>
            </tr>
            </table>

        </td></tr>
    </table>
</div>

<div class="sliderviewbody">
    <div class="filter">
        <table width="100%">
        <tr><td class="verticalMiddle">
            <asp:Label ID="Label3" runat="server" resourcekey="Participant" CssClass="participant" style="margin-right:2em;"></asp:Label>
            <asp:Label ID="Label6" runat="server" resourcekey="FilterBy" CssClass="filterby"></asp:Label>
            <asp:CheckBox ID="chkRegion" runat="server" resourcekey="Region" CssClass="regionfilter" />
            <asp:CheckBox ID="chkCountry" runat="server" resourcekey="Country" CssClass="countryfilter" />
        </td><td  class="rightalign">
            <asp:DropDownList ID="cboCountires" runat="server" CssClass="countrylist" style="display:none;"></asp:DropDownList>
            <asp:DropDownList ID="cboRegions" runat="server" CssClass="regionlist" style="display:none;"></asp:DropDownList>
        </td>
        </tr></table>
    </div>
    <div class="sliderview">
    </div>
        <script type="text/javascript">
            var defaultEvents = <%=DefaultEvents %>;
            var sliderViewInterval = <%=SliderViewInterval %>;
        </script>
</div>