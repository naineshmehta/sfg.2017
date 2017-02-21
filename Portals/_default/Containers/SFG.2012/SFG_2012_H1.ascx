<%@ Control Language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="ICON" Src="~/Admin/Containers/Icon.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" Src="~/Admin/Containers/Visibility.ascx" %>

<div class="c_container c_head_white">
    <div class="cont_top_content">
        <h1 class="c_title">
            <dnn:TITLE runat="server" ID="dnnTITLE" />
        </h1>
        <div class="title_vis">
            <dnn:VISIBILITY runat="server" ID="dnnVISIBILITY" minIcon="images/DNN-minus.gif"
                MaxIcon="images/DNN-plus.gif" />
        </div>
        <div class="clear_float">
        </div>
    </div>
    <div class="rbcontent">
        <div class="c_content">
            <div id="ContentPane" runat="server" class="c_contentpane">
            </div>
        </div>
        <div class="c_footer">
        </div>        
    </div>
</div>