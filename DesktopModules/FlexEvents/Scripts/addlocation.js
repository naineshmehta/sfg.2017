$(document).ready(function(){
	
	loadScript();

});

var map;
var scriptLoaded = false;
var marker;

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

	google.maps.event.addListener(map, 'click', function(event) {
		placeMarker(event.latLng);
	});

	var mapname = $(".mapname");
	var mapaddress = $(".mapaddress");
	var detailholder = $(".detailholder");
	var typeholder = $(".typeholder");
	var countryholder = $(".countryholder");
	var regionholder = $(".regionholder");

	var autocomplete = new google.maps.places.Autocomplete(mapaddress[0]);
	autocomplete.bindTo('bounds', map);

	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		var place = autocomplete.getPlace();
		if (!place.geometry) {
		  return;
		}

		/*if (place.types[0]=="street_address")
		{
			//street name to entity name
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({"address":place.formatted_address},function(result, status){
				if (status == google.maps.GeocoderStatus.OK)
				{
					console.log(result);
				}
			});

		}*/
		//console.log(place);

		//get country and region
		var country, region;
		for (var i=0;i<place.address_components.length ;i++ )
		{
			for (var j=0;j<place.address_components[i].types.length ;j++ )
			{
				if (place.address_components[i].types[j] == "country")
				{
					country = place.address_components[i].long_name;
				}
				else if (place.address_components[i].types[j] == "administrative_area_level_1")
				{
					region = place.address_components[i].long_name;
				}
			}
		}

		countryholder.val(country);
		regionholder.val(region);
		mapname.val(place.name);
		mapaddress.val(place.formatted_address);
		typeholder.val(place.types[0]);

		placeMarker(place.geometry.location);

		//map.fitBounds(place.geometry.bounds);
		if (place.geometry.viewport)
		{
		  map.fitBounds(place.geometry.viewport);
		}
		else
		{
		  map.setCenter(place.geometry.location);
		  map.setZoom(13);
		}

		var phone=place.formatted_phone_number;
		var website=place.website;
		var tz=place.tz;
		if (!phone){phone="";}
		if (!website){website="";}
		if (!tz){tz="";}
		if (phone)
		{
			detailholder.val("<place phone=\""+phone+"\" website=\""+escape(website)+"\" tz=\""+tz+"\"/>");
		}
		else
		{
			detailholder.val("");
		}
	});

	var coordinates=$(".locationholder").val();
	if (coordinates)
	{
		var coordinatesparam=coordinates.split("|");
		map.setZoom(coordinatesparam[2]*1);
		placeMarker(new google.maps.LatLng(coordinatesparam[0], coordinatesparam[1]));
	}
}

function placeMarker(latLng)
{
	if (!marker)
	{
		marker = new google.maps.Marker({
			position: latLng,
			map: map,
			draggable:true
		});
		map.panTo(latLng);
	}
	else
	{
		marker.setPosition(latLng);
	}

	setCookie("latlng", latLng);
	setCookie("mapzoom", map.getZoom());
}

function setCookie(name,value)
{
	var Days = 90; //keep for 90 days
	var exp  = new Date();    //new Date("December 31, 9998");
	exp.setTime(exp.getTime() + Days*24*60*60*1000);
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString() + ";path=/;";
}
function getCookie(name)
{
	var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
	 if(arr != null) return unescape(arr[2]); return null;
}
function deleteCookie(name)
{
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval=getCookie(name);
	if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}
function getLatitude(point)
{
	return point.substring(1, point.indexOf(","));
}
function getLongitude(point)
{
	return point.substring(point.indexOf(",") + 2, point.length - 1);
}


function checkCoordinates(message)
{
	if (!marker)
	{
		alert(message);
		return false;
	}

	var lat = marker.position.lat();
	var lng = marker.position.lng();
	var zoom = map.getZoom();

	$(".locationholder").val(lat+"|"+lng+"|"+zoom);

	return true;
}