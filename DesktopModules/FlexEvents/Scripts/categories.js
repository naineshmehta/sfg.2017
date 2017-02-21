//reinit jscolor when postback
$(document).ready(function() {

	if (typeof(postbackID) != "undefined")
	{
		controlPostbackID = postbackID; //Global Varible!
	}

    initDnD();
});





var controlPostbackID = undefined;
function initDnD() {
	if (!controlPostbackID)
	{
		return;
	}

	$("table.flexlist tr").hover(function () {
		$(this).addClass('showDragHandle');
	}, function () {
		$(this).removeClass('showDragHandle');
	});

	$("table.flexlist").tableDnD({

		onDragStart: function (table, row) {
			srcIndex = jQuery(row).index();
		},

		onDrop: function (table, row) {
			var rows = table.tBodies[0].rows;
			//save changes by ClientAPI
			var neworder = "";
			for (var i = 0; i < rows.length; i++) {
				if (neworder != "") neworder += " ";
				neworder += rows[i].id;
			}

			var eventArgs = "resort|" + neworder;
			dnn.xmlhttp.doCallBack(controlPostbackID, eventArgs, doNothing_CallBack, this, alert_CallBack, null, null, null, 0);

			$("table.flexlist tr:even").addClass("alt");
			$("table.flexlist tr:odd").removeClass("alt");
		}
	});
}

function doNothing_CallBack(result, ctx)
{
}

function alert_CallBack(result, ctx)
{
	alert(result);
}
