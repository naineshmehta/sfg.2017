var controlPostbackID = undefined;

$(document).ready(function(){
	if (typeof(postbackID) != "undefined")
	{
		controlPostbackID = postbackID; //Global Varible!
	}
	if (typeof(sliderViewInterval) != "undefined" && sliderViewInterval *1 > 0)
	{
		slideInterval = sliderViewInterval*1; //Global Varible!
	}

	loadsliderview();

});

var sliderview;
var categories;
var slideVal = 0;
var lastcountryregion="";
var categoryChangedHandler = 0;
var slideHandler = 0;
var slideInterval = 4000;

function loadsliderview()
{
	$(".sliderviewbody input").prop( 'checked', '' );

	categories = $(".categories .category");
	var totalcategories = categories.length;

	$( "#categoryslider" ).slider({
          min: 0,
          max: totalcategories,
          slide: function(event, ui) {
            slideVal = ui.value;

			$('#categoryslider .customMarker').css('width', (slideVal/(totalcategories)*100) + '%');

			categories.removeClass("active");
			if (slideVal > 0)
			{
				categories.eq(slideVal-1).addClass("active");
			}

			if (categoryChangedHandler > 0)
			{
				window.clearTimeout(categoryChangedHandler);
				categoryChangedHandler = 0;				
			}
			categoryChangedHandler = window.setTimeout(categoryChanged, 1000);
		}
	});

	$('#categoryslider').prepend("<div class='customMarker'></div>");



	categories.click(function(){
		var index = categories.index($(this));
		
		categories.removeClass("active");
		$(this).addClass("active");

		$( "#categoryslider" ).slider('value',index+1);
		$('#categoryslider .customMarker').css('width', ((index+1)/(categories.length)*100) + '%');

		filterEvents(lastcountryregion);

		return false;
	});


	$(".regionfilter input, .countryfilter input").click(function(){
		var toshowhide = $(this).parent().hasClass("regionfilter") ? $(".regionlist") : $(".countrylist");
		if (this.checked)
		{
			toshowhide.show();
		}
		else
		{
			toshowhide.hide();
		}
	});

	$(".regionlist").change(function(){
		var region = $(this).val();
		filterEvents(region);
	});

	$(".countrylist").change(function(){
		var country = $(this).val();
		filterEvents(country);
	});


	sliderview = $(".sliderview");
	if(typeof(defaultEvents) == "object")
	{
		showEvents(defaultEvents);
	}
}

function categoryChanged()
{
	var activecate = categories.filter(".active");
	if (activecate.length > 0)
	{
		activecate.trigger("click");
	}
	else
	{
		//none selected;
		filterEvents(lastcountryregion);
	}
}

function filterEvents(countryregion)
{
	lastcountryregion = countryregion ;
	var currentcategory = categories.filter(".active");
	var categoryid = currentcategory.length > 0 ? currentcategory.attr("rel") : -1;
	var eventArgs = "loadevents|" + categoryid + "|" + countryregion;

	sliderview.empty().addClass("loading").css("margin-left", 0);
	if (slideHandler > 0)
	{
		window.clearTimeout(slideHandler);
		slideHandler = 0;
	}

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
	sliderview.removeClass("loading").css("width", "21400px");
	for(var i=0;i<events.length;i++)
	{
		sliderview.append(events[i]);
	}

	var lastevent = sliderview.children(":last");
	if (lastevent.length == 0)
	{
		return;
	}

	var lastright = lastevent.position().left + lastevent.outerWidth(true);
	sliderview.css("width", lastright);

	if (sliderview.width() > sliderview.parent().width())
	{
		slideHandler = window.setTimeout(doSlide, slideInterval);

		ensureNextPage();
	}
}

function ensureNextPage()
{
	var nextPage = sliderview.parent().find(".nextpage");
	if (nextPage.length == 0)
	{
		sliderview.parent().append("<a class='nextpage' href='javascript:void(0);'></a>");
		nextPage = sliderview.parent().find(".nextpage");

		nextPage.click(function(){
			//slide right
			if (slideHandler > 0)
			{
				window.clearTimeout(slideHandler);
				slideHandler = 0;
			}

			doSlide();
		});
	}

	var prevPage = sliderview.parent().find(".prevpage");
	if (prevPage.length == 0)
	{
		sliderview.parent().append("<a class='prevpage' href='javascript:void(0);'></a>");
		prevPage = sliderview.parent().find(".prevpage");

		prevPage.click(function(){
			if (slideHandler > 0)
			{
				window.clearTimeout(slideHandler);
				slideHandler = 0;
			}

			doSlide(-1);
		});
	}
	prevPage.hide();
}

function doSlide(direction)
{
	if (sliderview.width() <= sliderview.parent().width())
	{
		return;
	}

	var prevpage = sliderview.parent().find(".prevpage");
	var left = parseInt(sliderview.css("margin-left"));
	var events = sliderview.children();

	if (direction < 0)
	{
		//to left
		if (left < 0 )
		{
			//if left >= 0; no need to left scroll
			var newleft = 0;
			for (var i=0;i<events.length ;i++ )
			{
				var eventi = events.eq(i);
				if ((left*-1) - eventi.position().left < sliderview.parent().width())
				{
					newleft = eventi.position().left*-1;
					break;
				}
			}
			if (newleft > 0 ) newleft = 0;

			sliderview.animate({"margin-left": newleft});
			newleft >= 0 ? prevpage.hide() : prevpage.show();
		}
	}
	else
	{
		//to right
		var newleft = 0;
		for (var i=0;i<events.length ;i++ )
		{
			var eventi = events.eq(i);
			var eventright = eventi.position().left + eventi.outerWidth(true);
			if (left + eventright > sliderview.parent().width())
			{
				//the first event that is not fully displayed
				newleft = eventi.position().left*-1;
				break;
			}
		}

		sliderview.animate({"margin-left": newleft});
		newleft >= 0 ? prevpage.hide() : prevpage.show();
	}


	slideHandler = window.setTimeout(doSlide, slideInterval);
}