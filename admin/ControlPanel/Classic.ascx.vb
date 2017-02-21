'
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2009
' by DotNetNuke Corporation
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
'
Imports DotNetNuke.Entities.Modules
Imports DotNetNuke.Entities.Modules.Definitions
Imports DotNetNuke.Entities.Portals.PortalSettings

Namespace DotNetNuke.UI.ControlPanels
    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' The Classic ControlPanel provides athe Classic Page/Module manager
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' -----------------------------------------------------------------------------
    Partial Class Classic
        Inherits ControlPanelBase

#Region "Private Methods"
        Private Sub SetMode(ByVal Update As Boolean)
            If Update Then
                SetUserMode(optMode.SelectedValue)
            End If

            If Not PortalSecurity.IsPageAdmin() Then
                optMode.Items.Remove(optMode.Items.FindByValue("LAYOUT"))
            End If

            Select Case UserMode
                Case Mode.View
                    optMode.Items.FindByValue("VIEW").Selected = True
                Case Mode.Edit
                    optMode.Items.FindByValue("EDIT").Selected = True
                Case Mode.Layout
                    optMode.Items.FindByValue("LAYOUT").Selected = True
            End Select
        End Sub
#End Region

#Region "Event Handlers"
        Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
            Me.ID = "Classic.ascx"
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' Page_Load runs when the control is loaded.
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	10/06/2004	Updated to reflect design changes for Help, 508 support
        '''                       and localisation
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            Try

                If Not Page.IsPostBack Then
                    'Localization
                    lblAdmin.Text = Localization.GetString("Admin", Me.LocalResourceFile)
                    cmdAddTab.Text = Localization.GetString("AddTab", Me.LocalResourceFile)
                    cmdAddTab.ToolTip = Localization.GetString("AddTab.ToolTip", Me.LocalResourceFile)
                    cmdEditTab.Text = Localization.GetString("EditTab", Me.LocalResourceFile)
                    cmdEditTab.ToolTip = Localization.GetString("EditTab.ToolTip", Me.LocalResourceFile)
                    cmdCopyTab.Text = Localization.GetString("CopyTab", Me.LocalResourceFile)
                    cmdCopyTab.ToolTip = Localization.GetString("CopyTab.ToolTip", Me.LocalResourceFile)
                    cmdHelpShow.AlternateText = Localization.GetString("ShowHelp.AlternateText", Me.LocalResourceFile)
                    cmdHelpHide.AlternateText = Localization.GetString("HideHelp.AlternateText", Me.LocalResourceFile)
                    lblModule.Text = Localization.GetString("Module", Me.LocalResourceFile)
                    lblPane.Text = Localization.GetString("Pane", Me.LocalResourceFile)
                    lblAlign.Text = Localization.GetString("Align", Me.LocalResourceFile)
                    cmdAdd.Text = Localization.GetString("AddModule", Me.LocalResourceFile)
                    cmdAdd.ToolTip = Localization.GetString("AddModule.ToolTip", Me.LocalResourceFile)

                    cmdAddTab.NavigateUrl = NavigateURL("Tab")
                    cmdEditTab.NavigateUrl = NavigateURL(PortalSettings.ActiveTab.TabID, "Tab", "action=edit")
                    cmdCopyTab.NavigateUrl = NavigateURL(PortalSettings.ActiveTab.TabID, "Tab", "action=copy")

                    cmdHelpShow.Visible = True
                    cmdHelpHide.Visible = False

                    cboDesktopModules.DataSource = DesktopModuleController.GetPortalDesktopModules(PortalSettings.PortalId).Values
                    cboDesktopModules.DataBind()

                    Dim intItem As Integer
                    For intItem = 0 To PortalSettings.ActiveTab.Panes.Count - 1
                        cboPanes.Items.Add(Convert.ToString(PortalSettings.ActiveTab.Panes(intItem)))
                    Next intItem
                    cboPanes.Items.FindByValue(glbDefaultPane).Selected = True

                    If cboAlign.Items.Count > 0 Then
                        cboAlign.SelectedIndex = 0
                    End If

                    SetMode(False)

                    If Not PortalSecurity.IsPageAdmin() Then
                        tblIconBarModule.Visible = False
                        divPage.Visible = False
                        lblDescription.Visible = False
                    End If

                End If

            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' cmdAdd_Click runs when the Add Button is clicked
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	10/06/2004	Updated to reflect design changes for Help, 508 support
        '''                       and localisation
        '''     [vmasanas]  01/07/2005  Modified to add view perm. to all roles with edit perm.
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub cmdAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdAdd.Click
            Try
                Dim permissionType As ViewPermissionType = ViewPermissionType.View
                Dim position As Integer = Null.NullInteger

                ' save to database
                AddNewModule("", Int32.Parse(cboDesktopModules.SelectedItem.Value), cboPanes.SelectedItem.Text, Null.NullInteger, ViewPermissionType.View, cboAlign.SelectedItem.Value)

                ' Redirect to the same page to pick up changes
                Response.Redirect(Request.RawUrl, True)

            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' optMode_SelectedIndexChange runs when the Option Mode is changed
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[smehaffie]	10/06/2004	Added so functionality is same as icon bar.
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Protected Sub optMode_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optMode.SelectedIndexChanged
            SetMode(True)
            Response.Redirect(Request.RawUrl, True)
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' cmdHelpHide_Click runs when the Hide Help Button is clicked
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	10/06/2004	Updated to reflect design changes for Help, 508 support
        '''                       and localisation
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub cmdHelpHide_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles cmdHelpHide.Click
            Try
                lblDescription.Text = ""

                cmdHelpShow.Visible = True
                cmdHelpHide.Visible = False

            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' cmdHelpShow_Click runs when the Hide Help Button is clicked
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	10/06/2004	Updated to reflect design changes for Help, 508 support
        '''                       and localisation
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub cmdHelpShow_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles cmdHelpShow.Click
            Try
                Dim objDesktopModule As DesktopModuleInfo

                objDesktopModule = DesktopModuleController.GetDesktopModule(Int32.Parse(cboDesktopModules.SelectedItem.Value), PortalSettings.PortalId)
                If Not objDesktopModule Is Nothing Then
                    lblDescription.Text = "<br>" & objDesktopModule.Description & "<br>"
                End If

                cmdHelpShow.Visible = False
                cmdHelpHide.Visible = True

            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub
#End Region

    End Class

End Namespace
