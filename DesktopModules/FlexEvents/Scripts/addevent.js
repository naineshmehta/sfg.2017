var controlPostbackID = undefined;

var recurring;
var eventstartdate;
var eventenddate;
var allday;
var recurringpattern;
var specialdates;
var requireregistration;
var chargeby;
var tblPriceTiers;
var tblDiscounts;
var eventstarttime;
var eventendtime;
var lastrecurring;
var multicat;

$(document).ready(function(){
	
	$('div.addevent').dnnTabs();

	if (typeof(postbackID) != "undefined")
	{
		controlPostbackID = postbackID; //Global Varible!
	}

	//$(".flexform td :checkbox").iButton();

	recurring=$('.recurring input');
	eventstartdate=$('input.startdate');
	eventenddate=$('input.enddate');
	allday=$(".allday input");
	recurringpattern = $(".recurringpattern input");
	specialdates = $(".specialdates");
	requireregistration = $(".requireregistration input");
	chargeby = $(".chargeby input");
	eventstarttime=$("input.starttime");
	eventendtime=$("input.endtime");
	lastrecurring=$("input.lastrecurring");
	tblPriceTiers=$("#tblPriceTiers");
	tblDiscounts=$("#tblDiscounts");
	multicat = $(".multicat");

	recurring.change(function(){
		if (this.checked)
		{
			$(".recurringoptions").show();
			recurringpattern.filter(":checked").trigger("change");
		}
		else
		{
			$(".recurringoptions").hide();
		}
	});

	recurringpattern.change(function(){
		if (!recurring.prop("checked"))
		{
			return;
		}

		var pattern = recurringpattern.filter(":checked").val();
		if(pattern == "0")//Periodically
		{
			$("#trperiodic").fadeTo("slow", 1);
			$("#trweek,#trmonth,#trannual").hide();

			$("ol.maxyears, select.maxmonths,div.maxappearance .weeks").hide();
			$("div.maxappearance,div.maxappearance .times").show();
		}
		else if(pattern == "3")//Weekly
		{
			$("#trweek").fadeTo("slow", 1);
			$("#trperiodic,#trmonth,#trannual").hide();

			$("ol.maxyears, select.maxmonths,div.maxappearance .times").hide();
			$("div.maxappearance,div.maxappearance .weeks").show();
		}
		else if(pattern == "1")//Monthly
		{
			$("#trmonth").fadeTo("slow", 1);
			$("#trperiodic,#trweek,#trannual").hide();

			$("ol.maxyears, div.maxappearance").hide();
			$("select.maxmonths").show();
		}
		else if(pattern == "2")//Annually
		{
			$("#trannual").fadeTo("slow", 1);
			$("#trperiodic,#trweek,#trmonth").hide();

			$("select.maxmonths, div.maxappearance").hide();
			$("ol.maxyears").show();
		}
	});

	var config = {dateFormat: eventstartdate.data("format").toLowerCase()};
	var startdateconfig = {
		dateFormat: eventstartdate.data("format").toLowerCase(),
		onSelect:function(dateStr){
			if(to_date.datepicker('getDate') == null)
			{
				to_date.datepicker('setDate', from_date.datepicker('getDate'));
			}
			to_date.datepicker('option', 'minDate', from_date.datepicker('getDate'));
			eventstartdatechanged(dateStr);
		}
	};

	var from_date = eventstartdate.datepicker(startdateconfig);
	var to_date = eventenddate.datepicker(config);
	if ( from_date.datepicker('getDate') ) {
		to_date.datepicker('option', 'minDate', from_date.datepicker('getDate'));
	}

	lastrecurring.datepicker(config);

	eventstarttime.timepicker();
	eventendtime.timepicker({
		'minTime': eventstarttime.val(),
		//'maxTime': '12:00am',
		'showDuration': true
	});

	eventstarttime.on('changeTime', function() {

		eventendtime.timepicker('option', 'minTime',eventstarttime.val());
		if(eventstarttime.timepicker("getTime")>=eventendtime.timepicker("getTime"))
		{
			eventendtime.val("");
		}
	});

	allday.change(function(){
		if(this.checked)
		{
			eventstarttime.hide();
			eventendtime.hide();
		}
		else
		{
			eventstarttime.show();
			eventendtime.show();
		}
	});

	eventstartdate.on('input', function(){
		eventstartdatechanged(this.value);
	});

	requireregistration.change(function(){
		if (!this.checked)
		{
			//
			$(".acceptreviews input[value=CustomersOnly]").parent().hide().prev().addClass("islast");


			$(".eventreminder").hide();

			$(".registrationoptions").hide();
		}
		else
		{
			$(".acceptreviews input[value=CustomersOnly]").parent().show().prev().removeClass("islast");
			$(".eventreminder").show();

			$(".registrationoptions").show();

			chargeby.filter(":checked").trigger("change");
		}
	});

	chargeby.change(function(){
		if (!requireregistration.prop("checked"))
		{
			return;
		}

		if(this.value == "Free")
		{
			$("#trcostperbooking, #trcostperattendee, #trbulkdiscount").hide();
		}
		else if(this.value == "Attendee")
		{
			$("#trcostperbooking").hide();
			$("#trcostperattendee, #trbulkdiscount").show();
		}
		else if(this.value == "Booking")
		{
			$("#trcostperattendee, #trbulkdiscount").hide();
			$("#trcostperbooking").show();
		}
	});

	if (multicat.length > 0 && multicat.data("max") > 1)
	{
		var maxcat = multicat.data("max");
		multicat.find("input:checkbox").click(function(){
			if (multicat.find("input:checkbox:checked").length > maxcat)
			{
				var message = multicat.data("message");
				//multicat.find("input:checkbox:checked:last").attr("checked", false);
				if (message)
				{
					alert(message.replace("[X]", maxcat));
				}
				return false;
			}
		});
	}

	$(".currentlogo #newlogo").click(function(){
		$(".currentlogo").hide();
		$(".newlogo").show();
		return false;
	});

	for (var i=0;i<specialdates.length ;i++ )
	{
		$(specialdates[i]).datepicker($.extend(config, {onSelect:function(dateStr){addspecialdates(this, dateStr);}}));
	}

	if ($(".whitelist").val()!="")
	{
		addspecialdates($(".whitelist"),null);
	}

	if ($(".blacklist").val()!="")
	{
		addspecialdates($(".blacklist"),null);
	}

	if (eventstartdate.val() != "")
	{
		eventstartdatechanged(eventstartdate.val());
	}

	recurring.trigger("change");
	allday.trigger("change");
	requireregistration.trigger("change");

	applydraghandle(tblPriceTiers);

	tblPriceTiers.tableDnD({
		onDrop: function (table, row) {
			applyaltclass(tblPriceTiers);
		}
	});

	deserializepriceingtiers();
	deserializediscounts();
	setupnewtiermonitor();
	setupnewdiscountmonitor();

	//$(".dnnActions .dnnPrimaryAction").click(validateinput);
	//$("input.required").blur(validaterequiredfield);
});




function eventstartdatechanged(date)
{
	if (date == "")
	{
		return;
	}
	var eventArgs = "pattern|" + date;
	dnn.xmlhttp.doCallBack(controlPostbackID, eventArgs, eventstartdate_CallBack, this, alert_CallBack, null, null, null, 0);
}

function eventstartdate_CallBack(result, ctx)
{
	var jsonresult = $.parseJSON(result);
	var daysofweek=$(".dayofweek input");
	daysofweek.removeClass('implied');
	//daysofweek.filter(":checked").prop('checked', false);
	daysofweek.filter("[value="+jsonresult.dayofweek+"]").prop('checked', true).addClass('implied');

	$(".monthlypattern input[value=dayofmonth]").parent().find("label").html(jsonresult.dayofmonth);
	$(".monthlypattern input[value=dayofweekofmonth]").parent().find("label").html(jsonresult.dayofweekofmonth);
	$(".annualpattern input[value=dayofyear]").parent().find("label").html(jsonresult.dayofyear);
	$(".annualpattern input[value=dayofweekofyear]").parent().find("label").html(jsonresult.dayofweekofyear);

	daysofweek.change(function(){
		if (this.checked == false && $(this).hasClass("implied"))
		{
			this.checked=true;
			return;
		}
	});
}

function addspecialdates(sender, toadd, toremove)
{
	var hiddentext = $(sender).parent().find(":hidden");
	var friendlydates = $(sender).parent().find(".friendlydates");
	if (friendlydates.length==0)
	{
		$(sender).parent().append("<ul class='friendlydates'></ul>");
		friendlydates = $(sender).parent().find("ul.friendlydates");
	}
	friendlydates.children().remove();

	var currentval=hiddentext.val();
	var dates = currentval.split(",");
	if (toadd)
	{
		var found=false;
		for (var i=0;i<dates.length; i++ )
		{
			if (dates[i]==toadd)
			{
				found=true;
				break;
			}
		}
		if (!found)
		{
			dates[dates.length]=toadd;
		}
	}
	if (toremove)
	{
		for (var i=0;i<dates.length; i++ )
		{
			if (dates[i]==toremove)
			{
				dates[i]=undefined;
				break;
			}
		}
	}
	var newdates="";
	for (var i=0;i<dates.length ;i++ )
	{
		if (dates[i])
		{
			friendlydates.append("<li data-date='"+dates[i]+"'>"+dates[i]+"[x]</li>");
			if (newdates!="")
			{
				newdates+=",";
			}
			newdates+=dates[i];
		}
	}
	hiddentext.val(newdates);

	friendlydates.children().click(function(){
		addspecialdates($(this).parent(),null,$(this).data("date"));
	});
}

function place_changed(phone)
{
	$(".placephone").val(phone);
}

function doNothing_CallBack(result, ctx)
{
}

function alert_CallBack(result, ctx)
{
	alert(result);
}

function setupnewtiermonitor()
{
	tblPriceTiers.find("tr input").off("input", clickonlasttier)
	tblPriceTiers.find("tr:last input").on("input", clickonlasttier);
}

function setupnewdiscountmonitor()
{
	tblDiscounts.find("tr input").off("input", clickonlastdiscount)
	tblDiscounts.find("tr:last input").on("input", clickonlastdiscount);
}

function clickonlasttier()
{
	var lasttr = tblPriceTiers.find("tr:last");
	var tr=$("<tr id='"+(lasttr.index()+1)+"'><td class='updown textcenter'></td><td><input type='text' value='' style='width:150px;' class='tiername' /></td><td><input type='text' value='' style='width:60px;' class='price' /></td></tr>");
	tr.insertAfter(lasttr);

	tblPriceTiers.find("input").off("input", clickonlasttier);

	setupnewtiermonitor();
	applyaltclass(tblPriceTiers);
	applydraghandle(tblPriceTiers);
	tblPriceTiers.tableDnD({
		onDrop: function (table, row) {
			applyaltclass(tblPriceTiers);
		}
	});
}

function clickonlastdiscount()
{
	var lasttr = tblDiscounts.find("tr:last");
	var tr=$("<tr><td>"+(lasttr.index()+2)+"+</td><td><input type='text' value='' style='width:60px;' /></td></tr>");
	tr.insertAfter(lasttr);

	tblDiscounts.find("input").off("input", clickonlastdiscount);

	setupnewdiscountmonitor();
	applyaltclass(tblDiscounts);
}

function applydraghandle(tabletoapply)
{	
	tabletoapply.find("tr").hover(function () {
		$(this).addClass('showDragHandle');
	}, function () {
		$(this).removeClass('showDragHandle');
	});
}

function applyaltclass(tabletoapply)
{
	tabletoapply.find("tr:even").addClass("alt");
	tabletoapply.find("tr:odd").removeClass("alt");
}

function validaterequiredfield()
{
	if (this.value!="")
	{
		//$(this).removeClass("needcorrection");
	}
}

function highlightelement(element, focusandscroll)
{
	element.addClass("needcorrection");
	if (focusandscroll)
	{
		element[0].focus();
		$('html, body').animate({scrollTop: (element.offset().top)-50},500);
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

function deserializepriceingtiers()
{
	//some times the object seems to be invisible, but not
	/*if (!tblPriceTiers.is(":visible"))
	{
		return true;
	}*/
	var xmltiers = $(".pricingtiers").val();
	if (xmltiers == "")
	{
		return;
	}

	var tiers = loadXMLString(xmltiers);
	if (tiers.length < 1)
	{
		return;
	}

	tblPriceTiers.find("tr:gt(0)").remove();
	var lasttr = tblPriceTiers.find("tr:last");
	for( var i=tiers.documentElement.childNodes.length-1;i>=0;i--)
	{
		var tier = tiers.documentElement.childNodes[i];
		$("<tr id='"+i+"'><td class='updown textcenter'></td><td><input type='text' value=\""+tier.getAttribute("name")+"\" style='width:150px;' class='tiername' /></td><td><input type='text' value=\""+tier.getAttribute("price")+"\" style='width:60px;' class='price' /></td></tr>").insertAfter(lasttr);
	}

	clickonlasttier();
}

function deserializediscounts()
{
	//some times the object seems to be invisible, but not
	/*if (!tblDiscounts.is(":visible"))
	{
		return true;
	}*/
	var xmldiscounts = $(".bulkdiscount").val();
	if (xmldiscounts == "")
	{
		return;
	}

	var discounts = loadXMLString(xmldiscounts);
	if (discounts.length < 1)
	{
		return;
	}


	var noofrows = tblDiscounts.find("tr").length;
	var needrows = discounts.documentElement.childNodes[discounts.documentElement.childNodes.length-1].getAttribute("attendees")-1;
	if (noofrows < needrows+2)
	{
		for (var i=0;i<(needrows+2-noofrows/*a spare row, a header row*/) ;i++ )
		{
			clickonlastdiscount();
		}
	}

	for( var i=0;i<discounts.documentElement.childNodes.length;i++)
	{
		var discount = discounts.documentElement.childNodes[i];
		var linei = tblDiscounts.find("tr:eq("+(discount.getAttribute("attendees")-1)+")");
		linei.find("input").val(discount.getAttribute("discount"));
	}
	
}

function validatetimes(oSrc, args)
{
	//logic validation
	if (!allday.prop("checked"))
	{
		var starttime = eventstarttime.val();
		var endtime = eventendtime.val();

		if (starttime=="")
		{
			args.IsValid = false;
			return;
		}
		if (endtime=="")
		{
			args.IsValid = false;
			return;
		}

		if (eventstartdate.datepicker('getDate') == eventenddate.datepicker('getDate'))
		{
			//single day event, and not all day, so start time should be earlier than end time
			var starttimevalue = eval(starttime.replace("am","").replace("pm","+720").replace(":","%12*60+"));
			var endtimevalue = eval(endtime.replace("am","").replace("pm","+720").replace(":","%12*60+"));
			if (starttimevalue >= endtimevalue)
			{
				args.IsValid = false;
				return;
			}
		}
	}

	args.IsValid = true;
	return;
}

function validateviewrolesandothers(oSrc, args)
{
	args.IsValid = $(".rolepicker input:checked").length > 0;


	//other validations
	var bolEnableFruquency = recurring.prop("checked") && recurringpattern.filter(":checked").val() == "0";
	for (i = 0; i < Page_Validators.length; i++) {
	  if (Page_Validators[i].validationGroup == "frequency") {
		   ValidatorEnable(Page_Validators[i], bolEnableFruquency);
	   }
    }


    var bolRequireFlatFee = requireregistration.prop("checked") && chargeby.filter(":checked").val() == "Booking";
    for (i = 0; i < Page_Validators.length; i++) {
        if (Page_Validators[i].validationGroup == "flatcost") {
            ValidatorEnable(Page_Validators[i], bolRequireFlatFee);
        }
    }

    var bolOccurpancy = requireregistration.prop("checked");
    for (i = 0; i < Page_Validators.length; i++) {
        if (Page_Validators[i].validationGroup == "occupancy") {
            ValidatorEnable(Page_Validators[i], bolOccurpancy);
        }
    }
    return;
}

function validatecategories(oSrc, args)
{
	args.IsValid = multicat.length <= 0 || multicat.find("input:checkbox:checked").length > 0;
	return;
}

function serializepriceingtiers(oSrc, args)
{
	if (!tblPriceTiers.is(":visible"))
	{
		args.IsValid = true;
		return true;
	}
	var xmltiers = "";
	var tiers = tblPriceTiers.find("tr:gt(0)");
	for (var i=0;i<tiers.length ;i++ )
	{
		var tiername = tiers.eq(i).find(".tiername").val();
		var strprice = tiers.eq(i).find(".price").val();
		if (tiername=="" || price=="")
		{
			continue;
		}

		var price=strprice*1;

		if (price<=0)
		{
			price=strprice.replace(",", ".")*1;
		}

		if (price <0)
		{
			price = 0;
		}

		xmltiers+="<tier name=\""+tiername+"\" price=\""+price+"\" />";
	}

	if (xmltiers=="")
	{
		args.IsValid = false;
		return false;
	}
	
	$(".pricingtiers").val("<tiers>"+xmltiers+"</tiers>");

	args.IsValid = true;

	serializediscounts();

	return true;
}

function serializediscounts()
{
	if (!tblDiscounts.is(":visible"))
	{
		return true;
	}
	var xmldiscounts="";
	var discounts = tblDiscounts.find("tr:gt(0)");

	for (var i=0;i<discounts.length ;i++ )
	{
		var attendees = discounts.eq(i).find("td:first").html();
		var discount = discounts.eq(i).find("input").val();
		if (discount=="")
		{
			continue;
		}

		xmldiscounts+="<discount attendees=\""+attendees.substring(0,attendees.length-1)+"\" discount=\""+discount+"\" />";
	}

	if (xmldiscounts=="")
	{
		return false;
	}
	
	$(".bulkdiscount").val("<discounts>"+xmldiscounts+"</discounts>");

	return true;
}