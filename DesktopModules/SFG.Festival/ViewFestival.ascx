<%@ Control Language="C#" Inherits="SFG.Modules.Festival.ViewFestival"
    AutoEventWireup="true" CodeBehind="ViewFestival.ascx.cs" %>
<asp:DataList ID="lstContent" DataKeyField="FestivalID" runat="server" CellPadding="4"
    OnItemDataBound="lstContent_ItemDataBound">
    <ItemTemplate>
        <table cellpadding="4" width="100%">
            <tr>
                <td valign="top" width="150px">
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# EditUrl("FestivalID",DataBinder.Eval(Container.DataItem,"FestivalID").ToString()) %>' Visible="<%# IsEditable %>" runat="server">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit" Visible="<%#IsEditable%>" resourcekey="Edit" />
                    </asp:HyperLink>
                    <img src='<%# GetBlogImage(DataBinder.Eval(Container.DataItem, "LogoBlog").ToString())%>' width="120px" />
                </td>
                <td>
                    <asp:HyperLink ID="lnkFestivalCat" runat="server" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "NewsURL") %>' Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'></asp:HyperLink>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>