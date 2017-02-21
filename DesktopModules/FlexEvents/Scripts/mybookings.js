$(document).ready(function(){

	if (typeof (Sys) != "undefined")
	{
		var req = Sys.WebForms.PageRequestManager.getInstance();
		if (req)
			req.add_endRequest(initdaterange);
	}

	initdaterange();

});

function initdaterange()
{
	var bookingdate = $("input.bookingdate");
	if (bookingdate.length > 0)
	{
		var config={
			separator:" - ",
			singleDate:false,
			format: bookingdate.data("format").toUpperCase(),
			autoClose: true
		};
		
		if (bookingdate.data("start"))
		{
			config.startDate = bookingdate.data("start");
		}
		if (bookingdate.data("end"))
		{
			config.endDate = bookingdate.data("end");
		}

		bookingdate.dateRangePicker(config).bind('datepicker-change',bookingdate_onchange);
	}

	
}

function bookingdate_onchange(event, obj)
{
	var date = obj.value;
	//$(".datesearch").trigger("click");
}
