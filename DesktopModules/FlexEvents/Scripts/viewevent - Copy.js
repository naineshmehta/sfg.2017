/*
 * jQuery.appear
 * http://code.google.com/p/jquery-appear/
 *
 * Copyright (c) 2009 Michael Hixson
 * Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)
*/
(function($){$.fn.appear=function(f,o){var s=$.extend({one:true},o);return this.each(function(){var t=$(this);t.appeared=false;if(!f){t.trigger('appear',s.data);return;}var w=$(window);var c=function(){if(!t.is(':visible')){t.appeared=false;return;}var a=w.scrollLeft();var b=w.scrollTop();var o=t.offset();var x=o.left;var y=o.top;if(y+t.height()>=b&&y<=b+w.height()&&x+t.width()>=a&&x<=a+w.width()){if(!t.appeared)t.trigger('appear',s.data);}else{t.appeared=false;}};var m=function(){t.appeared=true;if(s.one){w.unbind('scroll',c);var i=$.inArray(c,$.fn.appear.checks);if(i>=0)$.fn.appear.checks.splice(i,1);}f.apply(this,arguments);};if(s.one)t.one('appear',s.data,m);else t.bind('appear',s.data,m);w.scroll(c);$.fn.appear.checks.push(c);(c)();});};$.extend($.fn.appear,{checks:[],timeout:null,checkAll:function(){var l=$.fn.appear.checks.length;if(l>0)while(l--)($.fn.appear.checks[l])();},run:function(){if($.fn.appear.timeout)clearTimeout($.fn.appear.timeout);$.fn.appear.timeout=setTimeout($.fn.appear.checkAll,20);}});$.each(['append','prepend','after','before','attr','removeAttr','addClass','removeClass','toggleClass','remove','css','show','hide'],function(i,n){var u=$.fn[n];if(u){$.fn[n]=function(){var r=u.apply(this,arguments);$.fn.appear.run();return r;}}});})(jQuery);














var controlPostbackID = undefined;
var eventId = 0;
var commentPage = 0;
var commentlists;
var loadmoreexecuted = 0;


$(document).ready(function(){
	
	if (typeof(postbackID) != "undefined")
	{
		controlPostbackID = postbackID; //Global Varible!
	}

	loadScript();

	showDrivingDirection();

	eventId = $(".comments input.eventid").val();
	commentlists = $(".comments .list");
	loadmore = $(".comments .loadmore");

	loadmore.click(function(){
		loadComments();
	});
	monitorscroll();

	$(".postcomment .post").click(function(){
		var text = jQuery(".postcomment textarea").val().trim();
		if(text.length <= 2) return;

		if ($(this).hasClass("loading"))
		{
			return;
		}

		$(this).addClass("loading");

		dnn.xmlhttp.doCallBack(controlPostbackID,"post|"+eventId+"|" + text + "|" + commentPage,post_CallBack,this,null,null,null,null,0);

	});
});

function monitorscroll()
{
	if (loadmoreexecuted >= 2)
	{
		return;
	}

	loadmore.appear(function(){
		loadmoreexecuted ++;
		loadComments();
	});
}

function post_CallBack(result, ctx)
{
	jQuery(".postcomment .post").removeClass("loading");

	jQuery(".postcomment textarea").val("");
	load_CallBack(result, ctx);
}

function load_CallBack(result, ctx)
{
	var jsonresult = $.parseJSON(result);
	var currentpage = jsonresult.page;
	var itemsleft = jsonresult.left;
	var reviews = jsonresult.reviews;

	if (currentpage == 0)
	{
		commentlists.html("");
	}

	loadmore.removeClass("loading");
    commentlists.append(reviews);

	if (itemsleft <= 0)
	{
		loadmore.hide();
	}
	else
	{
		loadmore.show();
		monitorscroll();
	}

}

function loadComments()
{
	if (loadmore.hasClass("loading"))
	{
		return;
	}

	loadmore.addClass("loading");
	//commentlists.html("");
	dnn.xmlhttp.doCallBack(controlPostbackID,"load|"+eventId+"|"+commentPage++,load_CallBack,this,null,null,null,null,0);
}

function deleteComment(id)
{
	var cfm = dnn.getVar("deletecfm");
	if (cfm)
	{
		if (!window.confirm(cfm))
		{
			return;
		}
	}

	loadmore.addClass("loading");
    commentlists.html();

	dnn.xmlhttp.doCallBack(controlPostbackID,"delete|"+eventId+"|"+id+"|"+commentPage,load_CallBack,this,null,null,null,null,0);
}

function quote(id)
{
	var says = dnn.getVar("says");
	if (!says)
	{
		says = "says..."
	}

	var author = jQuery(".comments #author" + id).text();
	var body = jQuery(".comments #body" + id).html();

    var html = "[QUOTE]<b>" + author + "</b> "+says+"<br />" + body + "[/QUOTE]\n";
	var txtinput = jQuery(".postcomment textarea");
	txtinput.val(html).focus().addClass("replymode");
	jQuery(".postcomment textarea").trigger("keyup");
	moveCaretToEnd(jQuery(".postcomment textarea")[0]);

	jQuery('html, body').animate({
		scrollTop: txtinput.offset().top - 100
    }, "fast");
}


function showDrivingDirection()
{
	var drivingdirection = $(".mapdirection .drivingdirection");
	drivingdirection.click(function(event){
		if (!marker)
		{
			//map is not ready
			return;
		}

		event.preventDefault();

		drivingdirection.hide();
		$("<div id='directionsPanel'></div>").insertBefore(drivingdirection);
		var directionsPanel = $("#directionsPanel");

		var jqthis = $(this);
		var address = jqthis.data("address")||jqthis.data("zip")||jqthis.data("city");
		
		var request = {
			origin: address,
			destination: map_canvas.data("address"),
			travelMode: google.maps.TravelMode.DRIVING
		};

		if (!directionsService) directionsService = new google.maps.DirectionsService();
		if (!directionsDisplay)
		{
			directionsDisplay = new google.maps.DirectionsRenderer();
			directionsDisplay.setMap(map);
			directionsDisplay.setPanel(directionsPanel[0]);
		}

		directionsService.route(request, function(result, status) {
			if (status == google.maps.DirectionsStatus.OK) {
			  directionsDisplay.setDirections(result);
			  directionsPanel.slideDown("slow");
			}
		});

	});
}






var map;
var scriptLoaded = false;
var marker;
var map_canvas;
var directionsDisplay;
var directionsService;


function loadScript() {
	if (scriptLoaded)
	{
		return;
	}

	var script = document.createElement('script');
	script.type = 'text/javascript';
	script.src = location.protocol + '//maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places&' +
		  'callback=initialize';
	document.body.appendChild(script);
	scriptLoaded = true;
}

function initialize() {
	map_canvas = $("div.map_canvas");
	map_canvas.removeClass("loading");

	var latLng = new google.maps.LatLng(map_canvas.data("lat")*1, map_canvas.data("lng")*1);
	var mapOptions = {
		zoom: map_canvas.data("zoom"),
		center: latLng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	map = new google.maps.Map(map_canvas[0],mapOptions);

	marker = new google.maps.Marker({
			position: latLng,
			map: map,
			draggable:false
		});
	map.panTo(latLng);
}
