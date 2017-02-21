$(document).ready(function(){

	if (typeof (Sys) != "undefined")
	{
		var req = Sys.WebForms.PageRequestManager.getInstance();
		if (req)
			req.add_endRequest(initcalendar);
	}

	initcalendar();

});

function initcalendar()
{
	$(".barstyleradio input[checked=checked]").prop( 'checked', 'checked' );
	
	var searchswitch=$(".searchswitch");
	var searchfilters=$(".searchfilters");
	var showfilter = $(".searchfilters input:checkbox");

	if (showfilter.prop("checked"))
	{
		searchswitch.addClass("on");
	}

	searchswitch.click(function(){
		if (searchswitch.hasClass("on"))
		{
			searchswitch.removeClass("on");
			searchfilters.slideUp();
			showfilter.prop("checked", false);
		}
		else
		{
			searchswitch.addClass("on");
			searchfilters.slideDown();
			showfilter.prop("checked", true);
		}
	});



	var categories = $(".categories select");
	categories.change(function(){
		var categoryid = this.value * 1;
		if (categoryid > 0)
		{
			$("table.calendarview td ul").each(function() {
				var jqthis = $(this);
				jqthis.find("li").removeClass("isfirst").filter("li[data-category"+categoryid+"!='true']").hide();
				jqthis.find("li[data-category"+categoryid+"='true']").show().eq(0).addClass("isfirst");
			});
		}
		else
		{
			$("table.calendarview td li").removeClass("isfirst").show();
		}
	});

	if(categories.val() * 1 > 0);

	categories.trigger("change");
}

function selectcategory(category)
{
	if (category > 0)
	{
		$("table.calendarview td ul").each(function() {
			var jqthis = $(this);
			jqthis.find("li").removeClass("isfirst").filter("li[data-category"+category+"!='true']").hide();
			jqthis.find("li[data-category"+category+"='true']").show().eq(0).addClass("isfirst");
		});
	}
	else
	{
		$("table.calendarview td li").removeClass("isfirst").show();
	}
}