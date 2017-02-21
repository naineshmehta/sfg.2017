$(document).ready(function(){


	monitorlegend();

});

function monitorlegend()
{
	$(".fxecalendar .legend a").click(function(){
		var category = $(this).attr("rel");

		if (category*1 > 0)
		{
			$(".fxecalendar .month td").addClass("notselected");
			$(".fxecalendar .month td.category" + category).removeClass("notselected");
			$(".fxecalendar .legend .reset").show();
		}
		else
		{
			$(".fxecalendar .month td").removeClass("notselected");
			//$(".fxecalendar .legend .reset").hide();
		}
	});
}
