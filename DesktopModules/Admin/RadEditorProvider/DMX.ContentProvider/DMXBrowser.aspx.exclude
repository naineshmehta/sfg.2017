<%@ Page Language="vb" AutoEventWireup="false" Inherits="Bring2mind.DNN.Modules.DMX.RadEditorDMXBrowserDialog.DMXBrowser" CodeBehind="DMXBrowser.aspx.vb" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title><asp:Literal ID="lblTitle" runat="server"></asp:Literal></title>
    <meta http-equiv="PAGE-ENTER" content="RevealTrans(Duration=0,Transition=1)" />    
    <base target="_self" />
    <style type="text/css">
        body {margin:0;padding:0;}
    </style>    
</head>
<body>
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">

            if (window.attachEvent) {
                window.attachEvent("onload", InitDialog);
            }
            else if (window.addEventListener) {
                window.addEventListener("load", InitDialog, false);
            }

            var dmxLink = null;

            function GetRadWindow() {
                if (window.radWindow)
                    return window.radWindow;
                if (window.frameElement && window.frameElement.radWindow)
                    return window.frameElement.radWindow;
                return null;
            }
          
            function InitDialog() {
                var clientParameters = GetRadWindow().ClientParameters; //return the arguments supplied from the parent page
                dmxLink = clientParameters;
                if (dmxLink == null) 
                {
                    dmxLink = document.createElement("A");
                }
            }

            function OnClientGridDblClick(sender, args) {
                var item = args.get_item();
                //If file (and not a folder) is selected then...
                if (item.get_type() == Telerik.Web.UI.FileExplorerItemType.File) {
                    args.set_cancel(true);
                    //set link argument
                    dmxLink.href = item.get_url();
                    dmxLink.title = item.get_name();
                    if (dmxLink.name == '') {
                        dmxLink.innerHTML = item.get_name();
                    }
                    //Close window, pass link argument
                    GetRadWindow().close(dmxLink);
                }
            }            
        </script>    
    </telerik:RadScriptBlock>

    <form id="frmBrowser" runat="server">
        <asp:scriptmanager id="scriptmanager" runat="server"></asp:scriptmanager>
        <div>
            <telerik:RadFileExplorer ID="ctlFiles" runat="server"                  
                OnClientFileOpen="OnClientGridDblClick" 
                Skin="Default">
                <Configuration SearchPatterns="*.*" maxuploadfilesize="20480000"></Configuration>
            </telerik:RadFileExplorer>    
	    </div>
    </form>
</body>
</html>
