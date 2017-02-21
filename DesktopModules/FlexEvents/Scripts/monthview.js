$(document).ready(function(){

	if (typeof (Sys) != "undefined")
	{
		var req = Sys.WebForms.PageRequestManager.getInstance();
		if (req)
			req.add_endRequest(initlistviewagain);
	}

	initlistview();

});

function initlistviewagain()
{
	initlistview();

	$(".barstyleradio input[checked=checked]").prop( 'checked', 'checked' );

	var beginning = $("div.listview");

	var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();

    var elemTop = beginning.offset().top;
    var elemBottom = elemTop;// + beginning.height();

    if ((elemBottom <= docViewBottom) && (elemTop >= docViewTop))
	{}
	else
	{
		$("html, body").animate({
			scrollTop: beginning.offset().top
		}, 1000);
	}
	return;
}

function initlistview()
{
	/*$(".listview .event .colleft .category").click(function(){
		var categoryid = $(this).data("category");
		showfilter.prop("checked", true);
		var categorylist = $(".categorylist");
		categorylist.val(categoryid);
		__doPostBack(categorylist.attr("id"), "");
	});*/
}
