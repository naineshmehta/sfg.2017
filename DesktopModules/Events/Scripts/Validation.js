function byid(a){if(document.getElementById){return document.getElementById(a);}else{if(document.all){return document.all(a);}else{return null;}}}function selIndex(a){return byid(a).options[byid(a).selectedIndex].value;
}function setselIndex(a,c){for(var b=0;b<byid(a).options.length;b++){if(byid(a).options[b].value==c){byid(a).options[b].selected=true;return;}}}function timeoutFunc(a){byid(a).focus();byid(a).select();}function SetupRangeValidator(f,g,h,a,c,b){var d=byid(f);
var e=byid(g);d.maximumvalue=""+c+"";d.minimumvalue=""+a+"";d.errormessage=b;d.innerHTML=b;e.errormessage=b;e.innerHTML=b;window.Page_ClientValidate(h);}function valRemTime(f,g,e,d,c,b,a){if(!b){b=c;}if(!a){a=c;}switch(selIndex(d)){case"m":SetupRangeValidator(f,g,e,15,60,c);
break;case"h":SetupRangeValidator(f,g,e,1,24,b);break;case"d":SetupRangeValidator(f,g,e,1,30,a);break;}}function CopyField(){var a;var b;a=window.$find(arguments[0]);b=window.$find(arguments[1]);if(!isNaN(a.get_selectedDate())){if(a.get_selectedDate()>b.get_selectedDate()){b.set_selectedDate(a.get_selectedDate());
}}else{b.set_selectedDate(a.get_selectedDate());}}function SetComboIndex(){var i=window.$find(arguments[0]);var h=window.$find(arguments[1]);var b=window.$find(arguments[2]);var a=window.$find(arguments[3]);var f=arguments[4];
var g=i.get_timeView().getTime();var e=h.get_timeView().getTime();var d=b.get_selectedDate()._toFormattedString();var c=a.get_selectedDate()._toFormattedString();if(d==c&&g>e){var j=h.get_timeView();j.setTime(g.getHours(),g.getMinutes()+parseInt(f),g.getSeconds(),e);
a.set_selectedDate(e);}}function showTbl(a,b){if(window.dnn.dom.getById(a).checked===true){window.dnn.dom.getById(b).style.display="block";}else{window.dnn.dom.getById(b).style.display="none";}}function showTblSpecified(b,a,c){if(window.dnn.dom.getById(a).checked===true){window.dnn.dom.getById(c).style.display=b;
}else{window.dnn.dom.getById(c).style.display="none";}}function showhideTbls(f,a,g,b,h,c,i,d,j,e,k){showTblSpecified("block",a,g);showTblSpecified(f,b,h);showTblSpecified(f,c,i);showTblSpecified(f,d,j);showTblSpecified(f,e,k);
}function showhideChk2(a,c,b,d){showTbl(a,c);if(window.dnn.dom.getById(a).checked===true){window.dnn.dom.getById(d).style.display="block";}else{if(window.dnn.dom.getById(b).checked===true){window.dnn.dom.getById(d).style.display="block";
}else{window.dnn.dom.getById(d).style.display="none";}}}function showTimes(a,b,c){if(window.dnn.dom.getById(a).checked===true){window.dnn.dom.getById(b).style.display="none";window.dnn.dom.getById(c).style.display="none";
}else{window.dnn.dom.getById(b).style.display="";window.dnn.dom.getById(c).style.display="";}}function disableactivate(d,b,c,a){byid(b).disabled=false;byid(c).disabled=false;byid(a).disabled=false;switch(selIndex(d)){case"EventMonth.ascx":byid(b).disabled=true;
byid(b).checked=true;break;case"EventWeek.ascx":byid(c).disabled=true;byid(c).checked=true;break;case"EventList.ascx":byid(a).disabled=true;byid(a).checked=true;break;}}function disableControl(b,c,a){if(byid(b).checked==c){byid(a).disabled=true;
}else{byid(a).disabled=false;}}function CheckBoxFalse(b,c,a){if(byid(b).checked==c){byid(a).checked=false;}disableControl(b,c,a);}function GetRadioButtonValue(a){var d=byid(a);var c=d.getElementsByTagName("input");for(var b=0;
b<c.length;b++){if(c[b].checked){return c[b].value;}}}function disableRbl(c,d,a){var b=GetRadioButtonValue(c);if(b==d){byid(a).disabled=false;}else{byid(a).disabled=true;}}function disableDDL(d,e,c){var a=byid(d);var b=a.options[a.selectedIndex].value;
if(b==e){byid(c).disabled=false;}else{byid(c).disabled=true;}}function disablelistsettings(e,f,a,b,c,d){if(byid(e).checked==f){byid(a).disabled=false;byid(b).disabled=false;byid(c).disabled=true;byid(d).disabled=true;}else{byid(a).disabled=true;
byid(b).disabled=true;byid(c).disabled=false;byid(d).disabled=false;}}function CopyStartDateToEnddate(d,b,e,c,a){window.$find(b).set_selectedDate(window.$find(d).get_selectedDate());if(window.dnn.dom.getById(a).checked!==true){var i=window.$find(e);
var h=window.$find(c);var k=i.get_timeView();var j=h.get_timeView();var g=k.getTime();var f=j.getTime();j.setTime(g.getHours(),g.getMinutes(),g.getSeconds(),f);}}function limitText(a,b,c){if(a.value.length>b){a.value=a.value.substring(0,b);
alert(c+" "+b);}}function GetColor(a){if(a.length===0||a.substring(0,1)==="#"){return a;}else{return"#"+a;}}function ValidateColor(c,a){var d=GetColor(a.Value);if(d.length===0){a.IsValid=true;}var b=/^(#)?([0-9a-fA-F]{3})([0-9a-fA-F]{3})?$/;
a.IsValid=b.test(d);}function CategoryPreviewPane(e,f,j,g,c,a,d,b){var i=GetColor(byid(c).value);var h=GetColor(byid(a).value);if(window.Page_IsValid){if(i!=""){byid(c).value=i;byid(g).style.color=i;window.$find(f).set_selectedColor(i);
}if(h!=""){byid(a).value=h;byid(j).style.backgroundColor=h;window.$find(e).set_selectedColor(h);}byid(g).innerHTML=byid(d).value;}else{byid(g).innerHTML=b;byid(g).style.color="#ffffff";byid(j).style.backgroundColor="#ed1c24";
}}function ValidateTime(d,a){var f=parseInt(d.TimeInterval);var b=d.ErrorMessage;var e=window.$find(d.ClientID).get_timeView().getTime();var g=(e.getHours()*60)+e.getMinutes();var c=g%f;if(c!=0){d.innerHTML=b;d.errormessage=b;
a.IsValid=false;}}function btnUpdateClick(a,c){var b=window.$find(c);if(ddlCatText!=b.get_text()){window.__doPostBack(a,"");}}var ddlCatText="";function storeText(b){var a=window.$find(b);ddlCatText=a.get_text();}