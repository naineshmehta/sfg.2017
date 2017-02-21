<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttachedFile.ascx.cs" Inherits="BizModules.FlexEvents.AttachedFile" %>
<%@ Register src="Controls/Header.ascx" tagname="Header" tagprefix="uc1" %>

<uc1:Header ID="Header1" runat="server" />

<fieldset class="searchfilters">
<legend>Drop files to upload, or click</legend>

<table class="flextable">
    <tr>
        <td style="width:50%;">
            <h6><asp:Label ID="lblPublicFiles" runat="server" resourcekey="PublicFiles"></asp:Label></h6>
            <div id="publicfiles" class="dropzone">
                <div class="fallback">
                <input name="file" type="file" multiple />
                </div>
        <script type="text/javascript">
        //Dropbox
            $(document).ready(function () {

                if (typeof (Sys) != "undefined") {
                    var req = Sys.WebForms.PageRequestManager.getInstance();
                    if (req)
                        req.add_endRequest(initDropzone);
                }

                initDropzone();

            });

            function initDropzone() {
                var uploaded = 0;
                var dzfield = $("div.dropzone");
                var publicfiles = $("div#publicfiles");
                var privatefiles = $("div#privatefiles");

                dzfield.dropzone({ url: "<%=Uploader %>", acceptedFiles: "<%="."+AllowedFileTypes.Replace(",",",.") %>" });

                var sendingHandler = function (file, xhr, formData) {
                    formData.append('session', '<%=GetScriptData(false)%>');
                };
                var sendingHandler2 = function (file, xhr, formData) {
                    formData.append('session', '<%=GetScriptData(true)%>');
                };
                var completedHandler = function (file) {
                   uploaded += 1;
                }
                var queueCompletedHandler = function (file) {
                    if (uploaded > 0)
                    {
                        setTimeout(function () { __doPostBack("<%=btnRefresh.ClientID %>", ""); }, 2000);
                    }
                }

                Dropzone.forElement(dzfield[0]).on('sending', sendingHandler);
                Dropzone.forElement(dzfield[0]).on('queuecomplete', queueCompletedHandler);
                Dropzone.forElement(dzfield[0]).on('success', completedHandler);
                Dropzone.forElement(dzfield[1]).on('sending', sendingHandler2);
                Dropzone.forElement(dzfield[1]).on('queuecomplete', queueCompletedHandler);
                Dropzone.forElement(dzfield[1]).on('success', completedHandler);
            }
        </script>

            </div>
        </td>
        <td>
            <h6><asp:Label ID="Label2" runat="server" resourcekey="PrivateFiles"></asp:Label></h6>
            <div id="privatefiles" class="dropzone">
                <div class="fallback">
                <input name="file" type="file" multiple />
                </div>
            </div>
        </td>
    </tr>
</table>
<asp:Button ID="btnRefresh" runat="server" style="display:none;"/>
</fieldset>


<h3>
    Attached Files</h3>
<table id="tblLocations" class="flexlist" width="100%" cellspacing="0" cellpadding="5">
    <tr>
        <th></th>
        <th>Path</th>
        <th>CustomerOnly</th>
        <th>Actions</th>
    </tr>
    <asp:repeater id="lstLocations" runat="server">
        <ItemTemplate>
            <tr class="<%# Container.ItemIndex % 2 == 0 ? "" : "alt" %>">
                <td class="textcenter" style="width:60px;">
                    <asp:Label ID="lblItemId" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>' />
                </td>
                <td>
                    <a href='<%# ResolveUrl("~/"+(string)DataBinder.Eval(Container,"DataItem.Path"))%>'><%# System.IO.Path.GetFileName((string)DataBinder.Eval(Container,"DataItem.Path"))%></a>
                </td>
                <td>
                    <%# DataBinder.Eval(Container,"DataItem.CustomersOnly")%>
                </td>
                <td>
                    <asp:LinkButton ID="lnkDelete" runat="server" resourcekey="Delete" OnClick="lnkDelete_Click" CssClass='<%# DataBinder.Eval(Container,"DataItem.ItemId")%>' OnClientClick='<%# string.Format("return window.confirm(\"{0}\");", Localize("DeleteEvent.Text")) %>'   />
                </td>
            </tr>
        </ItemTemplate>
    </asp:repeater>
</table>

<ul class="dnnActions dnnClear">
    <li class="returnlink">
        <a href="<%= EditUrl("Events") %>"><asp:Label ID="Label1" runat="server" resourcekey="Return"></asp:Label></a>
    </li>
</ul>