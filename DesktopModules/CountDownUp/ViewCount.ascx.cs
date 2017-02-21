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
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using Microsoft.VisualBasic.CompilerServices;
using System.Runtime.InteropServices;

public partial class DesktopModules_CountDownUp_ViewCount : PortalModuleBase, IActionable
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ModuleController objModules = new ModuleController();
            Hashtable moduleSettings = objModules.GetModuleSettings(this.ModuleId);

            string strDay = StringType.FromObject(moduleSettings["CntDownDayText"]);
            string strHour = StringType.FromObject(moduleSettings["CntDownHourText"]);
            string strMinute = StringType.FromObject(moduleSettings["CntDownMinuteText"]);
            string strSecond = StringType.FromObject(moduleSettings["CntDownSecondText"]);

            string imgSrc = StringType.FromObject(moduleSettings["CntDwnImgSrc"]);
            string imgPrefix = StringType.FromObject(moduleSettings["CntDwnImgPrefix"]);
            string imgExt = StringType.FromObject(moduleSettings["CntDwnImgExt"]);
            string str = StringType.FromObject(moduleSettings["CntDwnMode"]);
            int year = IntegerType.FromObject(moduleSettings["CntDwnYear"]);
            int month = IntegerType.FromObject(moduleSettings["CntDwnMonth"]);
            int day = IntegerType.FromObject(moduleSettings["CntDwnDay"]);
            int hour = IntegerType.FromObject(moduleSettings["CntDwnHour"]);
            int minute = IntegerType.FromObject(moduleSettings["CntDwnMinute"]);
            int num5 = IntegerType.FromObject(moduleSettings["CntDwnTimeZone"]);
            string str2 = StringType.FromObject(moduleSettings["CntDwnText"]);
            string str12 = StringType.FromObject(moduleSettings["CntDwnExpired"]);
            string str6 = StringType.FromObject(moduleSettings["CntDwnScriptSrc"]);
            string timeZone = StringType.FromInteger(IntegerType.FromObject(moduleSettings["CntDwnTimeZone"]));
            string str7 = StringType.FromObject(moduleSettings["CntDwnExpire"]);
            this.lblCountdownText.Text = str2;

            if (strDay != "")
            {
                this.lbldays.Text = strDay;
            }
            if (strHour != "")
            {
                this.lblHrs.Text = strHour;
            }
            if (strMinute != "")
            {
                this.lblMins.Text = strMinute;
            }
            if (strSecond != "")
            {
                this.lblSecs.Text = strSecond;
            }
            DateTime now = DateTime.Now;
            if (((year + month) + day) == 0)
            {
                this.DrawCounter(imgSrc, imgPrefix, imgExt, "", "", "", "");
                this.lblErrorMessage.Text = "Please configure me ;-)";
            }
            else
            {
                string str8 = "";
                string str9;
                string str10;
                DateTime time2 = new DateTime(year, month, day, hour, minute, 0);
                if (DateTime.Compare(time2, now) <= 0)
                {
                    if (StringType.StrCmp(str7, "True", false) == 0)
                    {
                        this.DrawCounter(imgSrc, imgPrefix, imgExt, "", "", "", "");
                        this.lblErrorMessage.Text = str12;
                        this.lblCountdownText.Visible = false;
                    }
                    else
                    {
                        this.DrawCounter(imgSrc, imgPrefix, imgExt, "", "", "", "");
                        this.lblCountdownText.Text = str12;
                        if (StringType.StrCmp(str, "ClientSide", false) == 0)
                        {
                            str9 = "<script language=\"javascript\" src=\"" + str6 + "cntupclient.js\"></script>";
                        }
                        else
                        {
                            str9 = "<script language=\"javascript\" src=\"" + str6 + "cntupserver.js\"></script>";
                            str8 = now.ToString("yyyy, M , d, H, m ,s");
                        }
                        str10 = time2.ToString("yyyy, M, d, H, m, s");
                        this.DrawCounter(imgSrc, imgPrefix, imgExt, str10, str8, str9, timeZone);
                    }
                }
                else
                {
                    if (StringType.StrCmp(str, "ClientSide", false) == 0)
                    {
                        str9 = "<script language=\"javascript\" src=\"" + str6 + "cntdwnclient.js\"></script>";
                    }
                    else
                    {
                        str9 = "<script language=\"javascript\" src=\"" + str6 + "cntdwnserver.js\"></script>";
                        str8 = now.ToString("yyyy, M , d, H, m ,s");
                    }
                    str10 = time2.ToString("yyyy, M, d, H, m, s");
                    this.DrawCounter(imgSrc, imgPrefix, imgExt, str10, str8, str9, timeZone);
                }
            }
        }
        catch (Exception ex)
        {
            DotNetNuke.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);
        }
    }

    public ModuleActionCollection ModuleActions
    {
        get
        {
            ModuleActionCollection actions = new ModuleActionCollection();
            actions.Add(GetNextActionID(), "Edit", "", "", "", EditUrl("Edit"), false, SecurityAccessLevel.Edit, true, false);
            return actions;
        }
    }

    private void DrawCounter(string ImgSrc, string ImgPrefix, string ImgExt, [Optional, DefaultParameterValue("")] string TargetDate, [Optional, DefaultParameterValue("")] string CurrentDate, [Optional, DefaultParameterValue("")] string strScriptSrc, [Optional, DefaultParameterValue("")] string TimeZone)
    {
        if (StringType.StrCmp(ImgSrc, "", false) == 0)
        {

            string imgPathInfo = Request.ServerVariables["PATH_INFO"];
            string imgHost = Request.ServerVariables["HTTP_HOST"];
            imgPathInfo = imgPathInfo.ToLower().Replace("default.aspx", "desktopmodules/countdownup/images/");
            string imgSrc = "http://" + imgHost + imgPathInfo;
            string str9 = imgSrc;
        }
        if (StringType.StrCmp(ImgPrefix, "", false) == 0)
        {
            ImgPrefix = "Default";
        }
        if (StringType.StrCmp(ImgExt, "", false) == 0)
        {
            ImgExt = ".gif";
        }
        string str6 = "<script language=\"javascript\">";
        string str5 = "</script>";
        string str4 = "var ImgSrc = \"" + ImgSrc + "\"" + ";";
        string str3 = "var ImgPrefix = \"" + ImgPrefix + "\"" + ";";
        string str2 = "var ImgExt = \"" + ImgExt + "\"" + ";";
        string str7 = "var nTarget = Date.UTC(" + TargetDate + ");";
        string str = "var dNow = new Date(" + CurrentDate + ");";
        string str8 = "var TimeZone = " + TimeZone + ";";
        this.cdDay0.Text = "<img height=\"23\" src=\"" + ImgSrc + ImgPrefix + "8" + ImgExt + "\"" + " width=\"14\" name=\"cdDay0\">";
        this.cdDay1.Text = "<img height=\"23\" src=\"" + ImgSrc + ImgPrefix + "8" + ImgExt + "\"" + " width=\"14\" name=\"cdDay1\">";
        this.cdDay2.Text = "<img height=\"23\" src=\"" + ImgSrc + ImgPrefix + "8" + ImgExt + "\"" + " width=\"14\" name=\"cdDay2\">";
        this.cdHour0.Text = "<img height=\"23\" src=\"" + ImgSrc + ImgPrefix + "8" + ImgExt + "\"" + " width=\"14\" name=\"cdHour0\">";
        this.cdHour1.Text = "<img height=\"23\" src=\"" + ImgSrc + ImgPrefix + "8" + ImgExt + "\"" + " width=\"14\" name=\"cdHour1\">";
        this.cdMinute0.Text = "<img height=\"23\" src=\"" + ImgSrc + ImgPrefix + "8" + ImgExt + "\"" + " width=\"14\" name=\"cdMinute0\">";
        this.cdMinute1.Text = "<img height=\"23\" src=\"" + ImgSrc + ImgPrefix + "8" + ImgExt + "\"" + " width=\"14\" name=\"cdMinute1\">";
        this.cdSecond0.Text = "<img height=\"23\" src=\"" + ImgSrc + ImgPrefix + "8" + ImgExt + "\"" + " width=\"14\" name=\"cdSecond0\">";
        this.cdSecond1.Text = "<img height=\"23\" src=\"" + ImgSrc + ImgPrefix + "8" + ImgExt + "\"" + " width=\"14\" name=\"cdSecond1\">";
        if (StringType.StrCmp(str7, "", false) != 0)
        {
            this.lblScript.Text = str6 + str4 + str2 + str3 + str7 + str + str8 + str5 + strScriptSrc;
        }
        else
        {
            this.lblScript.Text = str6 + str4 + str2 + str3 + str5;
        }
    }

}