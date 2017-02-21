using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using Microsoft.VisualBasic.CompilerServices;
using System.Runtime.InteropServices;

public partial class DesktopModules_CountDownUp_EditCount : PortalModuleBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.IsPostBack)
        {
                if(ModuleId > 0)
            {
                DotNetNuke.Entities.Modules.ModuleController mc = new ModuleController();
                Hashtable moduleSettings = mc.GetModuleSettings(this.ModuleId);
                string str6 = StringType.FromObject(moduleSettings["CntDwnYear"]);
                string str4 = StringType.FromObject(moduleSettings["CntDwnMonth"]);
                string str = StringType.FromObject(moduleSettings["CntDwnDay"]);
                string str2 = StringType.FromObject(moduleSettings["CntDwnHour"]);
                string str3 = StringType.FromObject(moduleSettings["CntDwnMinute"]);
                string str5 = StringType.FromObject(moduleSettings["CntDwnTimeZone"]);
                this.txtCountdownText.Text = StringType.FromObject(moduleSettings["CntDwnText"]);
                this.TxtImgSrc.Text = StringType.FromObject(moduleSettings["CntDwnImgSrc"]);
                this.txtImgPrefix.Text = StringType.FromObject(moduleSettings["CntDwnImgPrefix"]);
                this.txtImgExt.Text = StringType.FromObject(moduleSettings["CntDwnImgExt"]);
                this.txtExpired.Text = StringType.FromObject(moduleSettings["CntDwnExpired"]);
                this.txtScriptSrc.Text = StringType.FromObject(moduleSettings["CntDwnScriptSrc"]);
                this.txtDay.Text = StringType.FromObject(moduleSettings["CntDownDayText"]);
                this.txtHour.Text = StringType.FromObject(moduleSettings["CntDownHourText"]);
                this.txtMinute.Text = StringType.FromObject(moduleSettings["CntDownMinuteText"]);
                this.txtSecond.Text = StringType.FromObject(moduleSettings["CntDownSecondText"]);

                if (StringType.StrCmp(StringType.FromObject(moduleSettings["CntDwnMode"]), "ClientSide", false) == 0)
                {
                    this.rbutClientSide.Checked = true;
                }
                else
                {
                    this.rbutServerSide.Checked = true;
                }
                if (StringType.StrCmp(StringType.FromObject(moduleSettings["CntDwnExpire"]), "True", false) == 0)
                {
                    this.chkExpire.Checked = true;
                }
                else
                {
                    this.chkExpire.Checked = false;
                }
                if (StringType.StrCmp(this.TxtImgSrc.Text, "", false) == 0)
                {
                    string imgPathInfo = Request.ServerVariables["PATH_INFO"];
                    string imgHost = Request.ServerVariables["HTTP_HOST"];
                    imgPathInfo = imgPathInfo.ToLower().Replace("default.aspx", "desktopmodules/countdownup/images");
                    string imgSrc = "http://" + imgHost + imgPathInfo + "/";
                    this.TxtImgSrc.Text = imgSrc;//str7;
                }
                if (StringType.StrCmp(this.txtImgPrefix.Text, "", false) == 0)
                {
                    this.txtImgPrefix.Text = "Default";
                }
                if (StringType.StrCmp(this.txtImgExt.Text, "", false) == 0)
                {
                    this.txtImgExt.Text = ".gif";
                }
                if (StringType.StrCmp(this.txtExpired.Text, "", false) == 0)
                {
                    this.txtExpired.Text = "The specified countdown date has expired!";
                }
                if (StringType.StrCmp(str6, "", false) == 0)
                {
                    this.listYear.SelectedIndex = 0;
                }
                else
                {
                    this.listYear.SelectedIndex = (int)Math.Round((double)(DoubleType.FromString(str6) - 2009.0));
                }
                if (StringType.StrCmp(str4, "", false) == 0)
                {
                    this.listMonth.SelectedIndex = 0;
                }
                else
                {
                    this.listMonth.SelectedIndex = (int)Math.Round((double)(DoubleType.FromString(str4) - 1.0));
                }
                if (StringType.StrCmp(str, "", false) == 0)
                {
                    this.listDay.SelectedIndex = 0;
                }
                else
                {
                    this.listDay.SelectedIndex = (int)Math.Round((double)(DoubleType.FromString(str) - 1.0));
                }
                if (StringType.StrCmp(str2, "", false) == 0)
                {
                    this.listHour.SelectedIndex = 0;
                }
                else
                {
                    this.listHour.SelectedIndex = IntegerType.FromString(str2);
                }
                if (StringType.StrCmp(str3, "", false) == 0)
                {
                    this.listMinute.SelectedIndex = 0;
                }
                else
                {
                    this.listMinute.SelectedIndex = IntegerType.FromString(str3);
                }
                if (StringType.StrCmp(str5, "", false) == 0)
                {
                    this.listTimeZone.SelectedIndex = 12;
                }
                else
                {
                    this.listTimeZone.SelectedIndex = (int)Math.Round((double)(DoubleType.FromString(str5) + 12.0));
                }
                if (StringType.StrCmp(this.txtScriptSrc.Text, "", false) == 0)
                {
                    string scrPathInfo = Request.ServerVariables["PATH_INFO"];
                    string scrHost = Request.ServerVariables["HTTP_HOST"];
                    scrPathInfo = scrPathInfo.ToLower().Replace("default.aspx", "desktopmodules/countdownup/");
                    string str8 = "http://" + scrHost + scrPathInfo;
                    this.txtScriptSrc.Text = str8;
                }
            }
            this.ViewState["UrlReferrer"] = this.Request.UrlReferrer.ToString();
        }
    }
    protected void cmdCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(Globals.NavigateURL(PortalSettings.ActiveTab.TabID, ""));
    }
    protected void cmdUpdate_Click(object sender, EventArgs e)
    {
        DotNetNuke.Entities.Modules.ModuleController mc = new ModuleController();

        mc.UpdateModuleSetting(this.ModuleId, "CntDownDayText", this.txtDay.Text);
        mc.UpdateModuleSetting(this.ModuleId, "CntDownHourText", this.txtHour.Text);
        mc.UpdateModuleSetting(this.ModuleId, "CntDownMinuteText", this.txtMinute.Text);
        mc.UpdateModuleSetting(this.ModuleId, "CntDownSecondText", this.txtSecond.Text);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnText", this.txtCountdownText.Text);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnYear", this.listYear.SelectedItem.Value);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnMonth", this.listMonth.SelectedItem.Value);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnDay", this.listDay.SelectedItem.Value);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnImgSrc", this.TxtImgSrc.Text);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnImgPrefix", this.txtImgPrefix.Text);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnImgExt", this.txtImgExt.Text);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnExpired", this.txtExpired.Text);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnScriptSrc", this.txtScriptSrc.Text);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnHour", this.listHour.SelectedItem.Value);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnMinute", this.listMinute.SelectedItem.Value);
        mc.UpdateModuleSetting(this.ModuleId, "CntDwnTimeZone", this.listTimeZone.SelectedItem.Value);
        if (this.rbutServerSide.Checked)
        {
            mc.UpdateModuleSetting(this.ModuleId, "CntDwnMode", "ServerSide");
        }
        if (this.rbutClientSide.Checked)
        {
            mc.UpdateModuleSetting(this.ModuleId, "CntDwnMode", "ClientSide");
        }
        if (this.chkExpire.Checked)
        {
            mc.UpdateModuleSetting(this.ModuleId, "CntDwnExpire", "True");
        }
        else
        {
            mc.UpdateModuleSetting(this.ModuleId, "CntDwnExpire", "False");
        }
        Response.Redirect(Globals.NavigateURL(PortalSettings.ActiveTab.TabID, ""));

    }
}
