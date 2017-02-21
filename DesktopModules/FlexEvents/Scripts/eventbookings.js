$(document).ready(function(){

	if (typeof (Sys) != "undefined")
	{
		var req = Sys.WebForms.PageRequestManager.getInstance();
		if (req)
			req.add_endRequest(initbookings);
	}

	initbookings();

});

function initbookings()
{
	var searchswitch=$(".searchswitch");
	var eventsfilter=$("div.searchfilters");

	if (!eventsfilter.hasClass("hideindefault"))
	{
		searchswitch.addClass("on");
	}

	searchswitch.click(function(){
		if (searchswitch.hasClass("on"))
		{
			searchswitch.removeClass("on");
			eventsfilter.slideUp();
			showfilter.prop("checked", false);
		}
		else
		{
			searchswitch.addClass("on");
			eventsfilter.slideDown();
			showfilter.prop("checked", true);
		}
	});
}
