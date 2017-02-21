/*
 * jQuery.appear
 * http://code.google.com/p/jquery-appear/
 *
 * Copyright (c) 2009 Michael Hixson
 * Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)
*/
(function($){$.fn.appear=function(f,o){var s=$.extend({one:true},o);return this.each(function(){var t=$(this);t.appeared=false;if(!f){t.trigger('appear',s.data);return;}var w=$(window);var c=function(){if(!t.is(':visible')){t.appeared=false;return;}var a=w.scrollLeft();var b=w.scrollTop();var o=t.offset();var x=o.left;var y=o.top;if(y+t.height()>=b&&y<=b+w.height()&&x+t.width()>=a&&x<=a+w.width()){if(!t.appeared)t.trigger('appear',s.data);}else{t.appeared=false;}};var m=function(){t.appeared=true;if(s.one){w.unbind('scroll',c);var i=$.inArray(c,$.fn.appear.checks);if(i>=0)$.fn.appear.checks.splice(i,1);}f.apply(this,arguments);};if(s.one)t.one('appear',s.data,m);else t.bind('appear',s.data,m);w.scroll(c);$.fn.appear.checks.push(c);(c)();});};$.extend($.fn.appear,{checks:[],timeout:null,checkAll:function(){var l=$.fn.appear.checks.length;if(l>0)while(l--)($.fn.appear.checks[l])();},run:function(){if($.fn.appear.timeout)clearTimeout($.fn.appear.timeout);$.fn.appear.timeout=setTimeout($.fn.appear.checkAll,20);}});$.each(['append','prepend','after','before','attr','removeAttr','addClass','removeClass','toggleClass','remove','css','show','hide'],function(i,n){var u=$.fn[n];if(u){$.fn[n]=function(){var r=u.apply(this,arguments);$.fn.appear.run();return r;}}});})(jQuery);










var loadmore;
var controlPostbackID = undefined;

$(document).ready(function(){

	if (typeof(postbackID) != "undefined")
	{
		controlPostbackID = postbackID; //Global Varible!
	}

	loadmore = $("div.loadmore");
	loadmore.click(function(){
		loadMoreEvents();
		return false;
	});

	monitorscroll();
});

var pageIndex = 0;

function monitorscroll()
{
	loadmore.appear(function() {
		loadMoreEvents();
    });
}

function loadMoreEvents()
{
	if (loadmore.hasClass("loading")) return;

	loadmore.addClass("loading");

	pageIndex += 1;
	var eventArgs = "loadpage|" + pageIndex;
	dnn.xmlhttp.doCallBack(controlPostbackID, eventArgs, loadpage_CallBack, this, alert_CallBack, null, null, null, 0);
}

function loadpage_CallBack(result, ctx)
{
	loadmore.removeClass("loading");

	var jsonresult = $.parseJSON(result);
	var currentpage = jsonresult.page;
	var itemsleft = jsonresult.left;
	var events = jsonresult.events;

	for (var i=0;i<events.length ;i++ )
	{
		$(events[i]).insertBefore(loadmore);
	}

	if (itemsleft < 1)
	{
		loadmore.hide();
	}

	monitorscroll();
}

function alert_CallBack(result, ctx)
{
	alert(result);
}
