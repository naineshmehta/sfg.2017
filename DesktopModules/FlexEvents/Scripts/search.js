var eventname;
var eventid;
var resultcontainer=new Object();
var searchControlPostbackID;

$(document).ready(function(){

	if (typeof(searchPostbackID) != "undefined")
	{
		searchControlPostbackID = searchPostbackID; //Global Varible!
	}

	if (typeof (Sys) != "undefined")
	{
		var req = Sys.WebForms.PageRequestManager.getInstance();
		if (req)
			req.add_endRequest(initsearch);
	}

	initsearch();

});

function initsearch()
{
	var runningdate = $("input.runningdate");
	if (runningdate.length > 0)
	{
		if (runningdate.dateRangePicker == undefined)
		{
			runningdate.pickadate({format: runningdate.data("format").toLowerCase()});
		}
		else
		{
			var config={
				separator:" - ",
				singleDate:false,
				format: runningdate.data("format").toUpperCase(),
				autoClose: true
			};			
			if (runningdate.data("start"))
			{
				config.startDate = runningdate.data("start");
			}
			if (runningdate.data("end"))
			{
				config.endDate = runningdate.data("end");
			}
			runningdate.dateRangePicker(config);
		}
	}

	autocomplete_event();
}

function autocomplete_event()
{
	$[ "ui" ][ "autocomplete" ].prototype["_renderItem"] = function( ul, item) {
	return $( "<li></li>" ) 
	  .data( "item.autocomplete", item )
	  .append( $( "<a></a>" ).html( item.label ) )
	  .appendTo( ul );
	};

	eventid = $("input.eventid");
	eventname = $("input.eventname");

	if (eventname.val() != "")
	{
		eventname.addClass("toremove");
		eventname.focus(function(){
			eventname.removeClass("toremove");
			eventname.val("");
			eventid.val("");
		});
	}

	eventname.autocomplete({
		source: function(request, response)
		{
			if (resultcontainer[request.term])
			{
				return response(resultcontainer[request.term]);
			}

			var eventArgs = "complete|" + request.term;
			dnn.xmlhttp.doCallBack(searchControlPostbackID, eventArgs, getevents_CallBack, this, alert_CallBack, null, null, null, 0);

			return response(null);
		},
		select: function(event, ui) {
			eventid.val(ui.item.id);
			eventname.val(ui.item.value);
		}
	});
}

function getevents_CallBack(result, ctx)
{
	var jsonresult = $.parseJSON(result);
	var keyword = jsonresult.keyword;

	resultcontainer[keyword] = jsonresult.events;
	eventname.autocomplete("search", eventname.val());
}

function alert_CallBack(result, ctx)
{
	alert(result);
}
