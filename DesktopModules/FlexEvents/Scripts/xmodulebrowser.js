/*
 * jQuery.appear
 * http://code.google.com/p/jquery-appear/
 *
 * Copyright (c) 2009 Michael Hixson
 * Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)
*/
(function($){$.fn.appear=function(f,o){var s=$.extend({one:true},o);return this.each(function(){var t=$(this);t.appeared=false;if(!f){t.trigger('appear',s.data);return;}var w=$(window);var c=function(){if(!t.is(':visible')){t.appeared=false;return;}var a=w.scrollLeft();var b=w.scrollTop();var o=t.offset();var x=o.left;var y=o.top;if(y+t.height()>=b&&y<=b+w.height()&&x+t.width()>=a&&x<=a+w.width()){if(!t.appeared)t.trigger('appear',s.data);}else{t.appeared=false;}};var m=function(){t.appeared=true;if(s.one){w.unbind('scroll',c);var i=$.inArray(c,$.fn.appear.checks);if(i>=0)$.fn.appear.checks.splice(i,1);}f.apply(this,arguments);};if(s.one)t.one('appear',s.data,m);else t.bind('appear',s.data,m);w.scroll(c);$.fn.appear.checks.push(c);(c)();});};$.extend($.fn.appear,{checks:[],timeout:null,checkAll:function(){var l=$.fn.appear.checks.length;if(l>0)while(l--)($.fn.appear.checks[l])();},run:function(){if($.fn.appear.timeout)clearTimeout($.fn.appear.timeout);$.fn.appear.timeout=setTimeout($.fn.appear.checkAll,20);}});$.each(['append','prepend','after','before','attr','removeAttr','addClass','removeClass','toggleClass','remove','css','show','hide'],function(i,n){var u=$.fn[n];if(u){$.fn[n]=function(){var r=u.apply(this,arguments);$.fn.appear.run();return r;}}});})(jQuery);





$(document).ready(function(){

	$("#xbrowserfilter input[checked=checked]").prop( 'checked', 'checked' );

	if (typeof(postbackID) != "undefined")
	{
		controlPostbackID = postbackID; //Global Varible!
	}

	if (typeof (Sys) != "undefined")
	{
		var req = Sys.WebForms.PageRequestManager.getInstance();
		if (req)
			req.add_endRequest(initxmodulebrowser);
	}

	initxmodulebrowser();

});



var loadmore;
var controlPostbackID = undefined;
var pageIndex = 0;


var listview;
var eventname;
var xmodulecalendar;
var calendar;
var months;
var resultcontainer=new Object();


function initxmodulebrowser()
{

	xmodulecalendar = $(".xmodulecalendar");
	calendar = $(".xmodulecalendar>div");
	months = calendar.find(".month");
	eventname = $(".searchevent input");
	listview = $("#xbrowserlist .simplelistview");

	var search = $(".searchevent .search");
	var clearsearch = $(".searchevent .clearsearch");

	search.click(function(){
		var searchkey = input.val();
		if (searchkey == "")
		{
			return;
		}

		clearsearch.show();
		search.hide();

		var input = $(".searchevent input");
		//var key = input.data("eventid") * 1 > 0 ? input.data("eventid") : input.val();
		updateResult(searchkey, null, null);
	});

	clearsearch.click(function(){
		eventname.val("");
		search.show();
		clearsearch.hide();
		updateResult();
	});

	eventname.on("change keyup", function(){
		if(clearsearch.is(":visible"))
		{
			clearsearch.hide();
			search.show();
		}
	});

	months.css("width", calendar.width()).css("float", "left");
	calendar.css("width", calendar.width() * months.length);

	var currentmonth = months.filter("[data-offset="+0+"]");
	if(currentmonth.length == 0) currentmonth=months.first();
	scrollToMonth(months.index(currentmonth));

	$(".xmodulecalendar>img").click(function(){
		var current = calendar.data("index") * 1;
		var newmonth = current + ($(this).hasClass("previousmonth")? -1 : 1) ;
		scrollToMonth(newmonth);
	});

	$(window).bind("resize", function () {
		var newwidth = calendar.parent().width();
		months.css("width", newwidth);
		calendar.css("width", newwidth * months.length);
		scrollToMonth(calendar.data("index"));
	});


	$("#xbrowserfilter input.agroup").click(function(){
		var checked = this.checked;
		var categories = $(this).parent().parent().find("ul li input");
		categories.prop("checked", checked);
	});

	$("#xbrowserfilter .categoryfilter input, #xbrowserfilter .locationfilter input").click(function(){
		updateResult();
	});

	var dates = $("#xbrowserfilter .datefilter .month a");
	dates.click(function(){
		dates.removeClass("selected");
		$(this).addClass("selected");
		var eventdate = $(this).attr("rel");
		updateResult(null, null, eventdate);
	});


	//auto complete
	$[ "ui" ][ "autocomplete" ].prototype["_renderItem"] = function( ul, item) {
	return $( "<li></li>" ) 
	  .data( "item.autocomplete", item )
	  .append( $( "<a></a>" ).html( item.label ) )
	  .appendTo( ul );
	};
	eventname.autocomplete({
		source: function(request, response)
		{
			if (resultcontainer[request.term])
			{
				return response(resultcontainer[request.term]);
			}

			var eventArgs = "complete|" + request.term;
			dnn.xmlhttp.doCallBack(controlPostbackID, eventArgs, getevents_CallBack, this, alert_CallBack, null, null, null, 0);

			return response(null);
		},
		select: function(event, ui) {
			//eventname.data("eventid", ui.item.id);
			eventname.val(ui.item.value);
			updateResult(null, ui.item.id, null);
			clearsearch.show();
			search.hide();
			//search.trigger("click");
			//__doPostBack($(".searchevent").attr("id"), ui.item.id);
		}
	});



	listview.css("min-height", $("div#xbrowserfilter").height());


	loadmore = $("div.loadmore");
	loadmore.click(function(){
		loadMoreEvents();
	});
	monitorscroll();

}

function getevents_CallBack(result, ctx)
{
	var jsonresult = $.parseJSON(result);
	var keyword = jsonresult.keyword;

	resultcontainer[keyword] = jsonresult.events;
	eventname.autocomplete("search", eventname.val());
}

function scrollToMonth(index)
{
	if(months.length < 1)
	{
		return;
	}

	calendar.data("index", index);

	var mleft = months.eq(index).position().left * -1;

	calendar.css("margin-left", mleft+"px");

	if (index > 0)
	{
		$(".xmodulecalendar .previousmonth").show();
	}
	else
	{
		$(".xmodulecalendar .previousmonth").hide();
	}
	if (index < months.length-1)
	{
		$(".xmodulecalendar .nextmonth").show();
	}
	else
	{
		$(".xmodulecalendar .nextmonth").hide();
	}
}

function getFilters()
{
	var o = new Object();
	var categories = "", locations="";
	$(".categoryfilter ul input:checked").each(function(){if(categories!="")categories+=",";categories+=this.value});
	$(".locationfilter ul input:checked").each(function(){if(locations!="")locations+=",";locations+=this.value});
	o.categories = categories;
	o.locations = locations;
	return o;
}

function updateResult(keyword, eventid, eventdate)
{
	var eventArgs;
	if (keyword != null)
	{
		eventArgs = "search|" + keyword;
	}
	else if (eventdate != null)
	{
		eventArgs = "ondate|" + eventdate;
	}
	else if (eventid != null)
	{
		eventArgs = "byeventid|" + eventid;
	}
	else
	{
		var filters = getFilters();
		eventArgs = "loadpage|"+filters.categories+"|"+filters.locations+"|0";
	}

	listview.html("").addClass("loadingevents");
	loadmore.hide();
	dnn.xmlhttp.doCallBack(controlPostbackID, eventArgs, loadEvent_CallBack, this, alert_CallBack, null, null, null, 0);
}

function loadEvent_CallBack(result, ctx)
{
	listview.removeClass("loadingevents");
	loadmore.removeClass("loading");

	var jsonresult = $.parseJSON(result);
	pageIndex = jsonresult.page;
	var itemsleft = jsonresult.left;
	var events = jsonresult.events;

	if (jsonresult.header)
	{
		listview.append(jsonresult.header);
	}

	for (var i=0;i<events.length ;i++ )
	{
		listview.append($(events[i]));
	}

	if (itemsleft < 1)
	{
		loadmore.hide();
	}
	else
	{
		loadmore.show();
		monitorscroll();
	}
}

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

	var filters = getFilters();
	eventArgs = "loadpage|"+filters.categories+"|"+filters.locations+"|" + (++pageIndex);

	dnn.xmlhttp.doCallBack(controlPostbackID, eventArgs, loadEvent_CallBack, this, alert_CallBack, null, null, null, 0);
}

function alert_CallBack(result, ctx)
{
	alert(result);
}


