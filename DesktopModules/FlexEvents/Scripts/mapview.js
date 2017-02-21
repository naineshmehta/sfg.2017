var controlPostbackID = undefined;

$(document).ready(function(){
	if (typeof(postbackID) != "undefined")
	{
		controlPostbackID = postbackID; //Global Varible!
	}

	loadScript();

});

var map;
var infowindow;
var markers = [];
var rotateHandler;
var rotateIndex=0;
var scriptLoaded = false;

var monthselection;

function loadScript() {
	$(".barstyleradio input[checked=checked]").prop( 'checked', 'checked' );

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
	var map_canvas = $("div.map_canvas");
	map_canvas.removeClass("loading");

	var defaultCenter;
	var latlng_cookie = getCookie("latlng");
	if (latlng_cookie)
	{
		defaultCenter = new google.maps.LatLng(getLatitude(latlng_cookie), getLongitude(latlng_cookie));
	}
	else
	{
		defaultCenter = new google.maps.LatLng(39, -95);
	}

	var zindex = getCookie("mapzoom");
	if (zindex*1 <= 0) 
		zindex = 4;
	else
		zindex *= 1;

	var mapOptions = {
		zoom: zindex,
		center: defaultCenter,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	map = new google.maps.Map(map_canvas[0],mapOptions);

	monthselection = $(".barstyleradio input");
	monthselection.click(function(){
		var eventArgs = "loadevents|" + this.value;
		dnn.xmlhttp.doCallBack(controlPostbackID, eventArgs, loadevents_CallBack, this, alert_CallBack, null, null, null, 0);
	});

	$(".categories select").change(function(){
		var currentmonth = monthselection.filter(":checked").val();
		var eventArgs = "loadevents|" + currentmonth + "|" + this.value;
		dnn.xmlhttp.doCallBack(controlPostbackID, eventArgs, loadevents_CallBack, this, alert_CallBack, null, null, null, 0);
	});

	if(typeof(defaultEvents) == "object")
	{
		showEvents(defaultEvents);
	}
}

function selectcategory(category)
{
	var currentmonth = monthselection.filter(":checked").val();
	var eventArgs = "loadevents|" + currentmonth + "|" + category;
	dnn.xmlhttp.doCallBack(controlPostbackID, eventArgs, loadevents_CallBack, this, alert_CallBack, null, null, null, 0);
}

function loadevents_CallBack(result, ctx)
{
	showEvents($.parseJSON(result));
}

function alert_CallBack(result, ctx)
{
	alert(result);
}

function showEvents(events)
{
	stopRotation();


	for (var i = 0; i < markers.length; i++ ) {
		markers[i].setMap(null);
	}
	markers.length = 0;


	if (events.length == 0)
	{
		return;
	}

	var bounds = new google.maps.LatLngBounds();
	for (var i=0;i<events.length ;i++ )
	{
		var loc = new google.maps.LatLng(events[i].lat, events[i].lng);
		bounds.extend(loc);

		var iconpath;
		if (events[i].icon != "")
		{
			iconpath = "//chart.apis.google.com/chart?chst=d_map_xpin_icon&chld="+(events[i].featured?"pin_star":"pin")+"|"+events[i].icon+"|"+events[i].backgroundcolor+"|F9BD37";
			//iconpath = "https://chart.googleapis.com/chart?chst=d_bubble_icon_text_small&chld="+events[i].icon+"|bbtl|"+events[i].title+"|"+events[i].backgroundcolor+"|FFFFFF";
		}
		else
		{
			iconpath = "//chart.apis.google.com/chart?chst=d_map_xpin_letter&chld="+(events[i].featured?"pin_star":"pin")+"|+|"+events[i].backgroundcolor+"|000000|F9BD37";
		}

		var marker = new google.maps.Marker({
			icon: {url:iconpath},
			//icon: new google.maps.MarkerImage("https://chart.googleapis.com/chart?chst=d_fnote_title&chld=pinned_c|1|004400|l|Joe%27s|Today+2-for-1+!|555-1234"),
			//google.maps.MarkerImage(events[i].icon, null, null, null, new google.maps.Size(32, 32)),
			position: loc,
			map: map,
			draggable:false,
			text:events[i].title,
			animation: google.maps.Animation.DROP,
			html:"<div class='infowindowouter'>"+events[i].html+"</div>"
		});
		markers.push(marker);

		google.maps.event.addListener(marker, 'click', function(evt) {
			if (infowindow == null)
			{
				infowindow = new google.maps.InfoWindow({content: this.html});

				google.maps.event.addListener(infowindow, 'closeclick', function() {
					stopRotation();
				});
			}
			else
			{
				infowindow.setContent(this.html);
			}

			infowindow.open(map,this);

			if (evt)
			{
				stopRotation();
			}
		});
	}		

	if (markers.length > 0)
	{
		rotateIndex = 0;
		setTimeout(function(){google.maps.event.trigger(markers[rotateIndex++], 'click');rotateHandler = setInterval(function(){if(rotateIndex>=markers.length){rotateIndex=0;/*stopRotation();return;*/}google.maps.event.trigger(markers[rotateIndex++], 'click');}, 4000);}, 1000);
	}

	map.fitBounds(bounds);
}

function stopRotation()
{
	if (rotateHandler < 1)
	{
		return;
	}
	clearInterval(rotateHandler);
	rotateHandler=-1;
}

function getCookie(name)
{
	var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
	 if(arr != null) return unescape(arr[2]); return null;
}
function getLatitude(point)
{
	return point.substring(1, point.indexOf(","));
}
function getLongitude(point)
{
	return point.substring(point.indexOf(",") + 2, point.length - 1);
}





function loadMore()
{
	if (loadmore.hasClass("loading"))
	{
		return;
	}

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
	var gridview = ("div.gridview");
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
