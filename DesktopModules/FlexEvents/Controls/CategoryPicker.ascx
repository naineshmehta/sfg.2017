<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryPicker.ascx.cs" Inherits="BizModules.FlexEvents.Controls.CategoryPicker" %>
<div id="categories" class="dropdown">
<div class="acontainer"><a href="javascript:void(0);"><span></span><%=Localize("AllEvents") %></a></div>
    <div class="ulcontainer">
        <ul>
            <asp:Repeater ID="rptCategories" runat="server">
                <ItemTemplate>
                    <li><a href="javascript:void(0);" rel='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>'><span style='background-color:#<%# DataBinder.Eval(Container,"DataItem.BackgroundColor")%>;'></span><%# DataBinder.Eval(Container,"DataItem.Category")%></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <asp:TextBox ID="txtCategoryId" runat="server" 
            CssClass="pickedcategory" style="display:none;" 
            ontextchanged="txtCategoryId_TextChanged"></asp:TextBox>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            if (typeof (Sys) != "undefined") {
                var req = Sys.WebForms.PageRequestManager.getInstance();
                if (req)
                    req.add_endRequest(initlegend);
            }
            initlegend();
        });

        function initlegend() {
            $("div.dropdown").dropdownselection();
        }
    </script>
</div>

