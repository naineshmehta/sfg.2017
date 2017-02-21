var controlPostbackID = undefined;

var region;
var noofattendees;
var taxrate;
var taxrateapplytostate;
var totalcost;
var bulkdiscount;
var salestax;
var billtotal;


$(document).ready(function(){
	
	if (typeof(postbackID) != "undefined")
	{
		controlPostbackID = postbackID; //Global Varible!
	}

	if (typeof (Sys) != "undefined")
	{
		var req = Sys.WebForms.PageRequestManager.getInstance();
		if (req)
		{
			req.add_endRequest(initalizebookevent);
			req.add_endRequest(initialize);
		}
	}

	initalizebookevent();
	loadScript();

});


var scriptLoaded = false;
var geolocated = false;
var autocomplete;
var placeregion;

function initalizebookevent()
{
	var sections = $(".namesection, .addresssection, .emailsection, .phonesection, .messagesection");
	sections.find("input, textarea").click(function(){
		sections.removeClass("yellowbgon");

		var section = $(this).parent();
		while (!section.hasClass("yellowbgoff"))
		{
			section= section.parent();
		}
		section.addClass("yellowbgon");
	});

	$("ol.flexradio input").change(function(){
		$(".eventduration").html($(this).parent().attr("duration")).hide().fadeIn("slow");
	});


	region = $(".addresssection .region");
	noofattendees = $(".pricingtier .noofattendees");
	totalcost = $(".attendeesinfo .totalcost");
	bulkdiscount = $(".attendeesinfo .bulkdiscount");
	salestax = $(".attendeesinfo .salestax");
	taxrateapplytostate = salestax.data("homestate");
	if (taxrateapplytostate == undefined)
	{
		taxrateapplytostate = "";
	}
	billtotal = $(".attendeesinfo .billtotal");
	taxrate = salestax.data("taxrate")*1;
	if (isNaN(taxrate)) taxrate = 0;

	region.change(function(){
		calculatecost();
	});

	if (noofattendees.length > 0)
	{
		noofattendees.find("input").change(function(){
			onAttendeeSelection();
		});

		onAttendeeSelection();
	}
	else
	{
		//must be flat fee
		calculatecost();
	}
}

function loadXMLString(txt)
{
	if (window.DOMParser)
	{
		parser=new DOMParser();
		xmlDoc=parser.parseFromString(txt,"text/xml");
	}
	else // code for IE
	{
		xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async=false;
		xmlDoc.loadXML(txt);
	}
	return xmlDoc;
}

function onAttendeeSelection()
{
	var totalcost = $(".totalcost");
	if (!totalcost.data("format"))
	{
		totalcost.data("format", totalcost.html())
	}
	var totalattendees = $(".pricingtier .noofattendees:first input:last").val()*1;

	var selectednumber = 0;

	for (var i=0;i<noofattendees.length ;i++ )
	{
		//enable/disable controls
		var groupi = noofattendees.eq(i);
		var checkedone = groupi.find("input:checked");
		if (i>0)
		{
			var alloptions = groupi.find("input");
			for (var j=1;j<=totalattendees ;j++ )
			{
				if (j+selectednumber > totalattendees)
				{console.log("hide control at row " + i + " col " + j);
					alloptions.eq(j).prop("checked", false).parent().hide();
				}
				else
				{
					alloptions.eq(j).parent().show();
				}
			}
		}

		groupi.find("li").removeClass("islast");
		groupi.find("li:visible:last").addClass("islast");

		if (checkedone.length > 0)
		{
			selectednumber += checkedone.val()*1;
		}

	}

	calculatecost();
}

function calculatecost()
{
	//calculate cost
	var moneyformat = totalcost.data("format");
	var subtotal = 0;
	if(noofattendees.length>0)
	{
		var selectedattendees = 0;

		var attendeeofeachtier = noofattendees.find("input:checked");
		for (var i=0;i<attendeeofeachtier.length ;i++ )
		{
			var attendeeoftier = attendeeofeachtier.eq(i);
			selectedattendees += attendeeoftier.val()*1;
			subtotal += attendeeoftier.val()*attendeeoftier.parent().parent().parent().parent().find(".tierprice").data("price"); 
		}

		//here we got sub toal
		totalcost.html(moneyformat.replace("0", subtotal.toFixed(2)));
	}
	else
	{
		subtotal = totalcost.data("flatcost")*1;
	}

	if (/*subtotal == 0 || */isNaN(subtotal))
	{
		return;
	}

	var discounttoapply = 0;
	if (subtotal>0 && bulkdiscount.length > 0)
	{
		var discountpolicy = bulkdiscount.data("policy");
		var xmlpolicy = loadXMLString(discountpolicy);
		for( var i=0;i<xmlpolicy.documentElement.childNodes.length;i++)
		{
			var policy = xmlpolicy.documentElement.childNodes[i];
			if (policy.getAttribute("attendees")*1 <= selectedattendees)
			{
				var discountpolicy = policy.getAttribute("discount");
				if (discountpolicy.indexOf("%")>0)
				{
					var percentdiscunt = discountpolicy.substring(0, discountpolicy.length-1);
					if (percentdiscunt/100*subtotal > discounttoapply)
					{
						discounttoapply = percentdiscunt/100*subtotal;
					}
				}
				else
				{
					if (discountpolicy*1 > discounttoapply)
					{
						discounttoapply = discountpolicy*1;
					}
				}

			}
		}

		if (discounttoapply > subtotal)
		{
			discounttoapply = subtotal;
		}
		//here we got discount
		bulkdiscount.html(moneyformat.replace("0", discounttoapply.toFixed(2)));
	}

	var taxtoapply = 0;
	if (taxrateapplytostate == "" || (taxrateapplytostate!="" && taxrateapplytostate == $(".addresssection .region").val().trim()))
	{
		//here we got salex tax
		taxtoapply = (subtotal-discounttoapply)*taxrate/100;
		salestax.html(moneyformat.replace("0", taxtoapply.toFixed(2)));
	}
	else
	{
		salestax.html(moneyformat.replace("0", taxtoapply.toFixed(2)));
	}

	//last step, the final price
	billtotal.html(moneyformat.replace("0", (subtotal-discounttoapply+taxtoapply).toFixed(2)));

}

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
	var address = $(".addresssection .address");
	autocomplete = new google.maps.places.Autocomplete(address[0]);
	
	address.focus(function(){
		if (this.value == "")
		{
			geolocate();
		}
	});

	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		var place = autocomplete.getPlace();
		if (!place.geometry) {
		  return;
		}

		var placeaddress = ""
		var placezip = "";
		var placelocality = "";
		var placecountry = "";

		for (var i=0;i<place.address_components.length ;i++ )
		{
			for (var j=0;j<place.address_components[i].types.length ;j++ )
			{
				var type = place.address_components[i].types[j];
				if (type == 'subpremise') {
					placeaddress += place.address_components[i].long_name + '/';
				}
				if (type == 'street_number') {
					placeaddress += place.address_components[i].long_name + ' ';
				}
				if (type == 'route') {
					placeaddress += place.address_components[i].long_name;
				}
				if (type == "postal_code")
				{
					placezip = place.address_components[i].long_name;
				}
				if (type == "country")
				{
					placecountry = place.address_components[i].short_name;
				}
				if (type == "locality")
				{
					placelocality = place.address_components[i].short_name;
				}
				if (type == "administrative_area_level_1")
				{
					placeregion = place.address_components[i].short_name;
				}
			}
		}

		address.val(placeaddress);
		$(".addresssection .postalcode").val(placezip);
		$(".addresssection .locality").val(placelocality);
		$(".addresssection .region").val(placeregion);
		var country = $(".addresssection .country");
		if (country.val() != placecountry)
		{
			country.val(placecountry);

			/*var theForm = document.forms['Form'];
			if (!theForm) {
				theForm = document.Form;
			}
			if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
				theForm.__EVENTTARGET.value = country.attr("name");
				theForm.__EVENTARGUMENT.value = placeregion;
				theForm.submit();
			}*/

			window.setTimeout(function(){__doPostBack(country.attr("name"), placeregion);}, 10);
		}
	});
}

function geolocate() {

	if (geolocated)
	{
		return false;
	}
	geolocated=true;

	if (navigator.geolocation)
	{
		navigator.geolocation.getCurrentPosition(function(position)
		{
			var geolocation = new google.maps.LatLng(
			position.coords.latitude, position.coords.longitude);
			autocomplete.setBounds(new google.maps.LatLngBounds(geolocation,geolocation));
		});
	}

	return true;
}
