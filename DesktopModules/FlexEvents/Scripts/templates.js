//reinit jscolor when postback
$(document).ready(function() {


	if (typeof (Sys) != "undefined")
	{
		var req = Sys.WebForms.PageRequestManager.getInstance();
		if (req)
			req.add_endRequest(inittemplates);
	}

	inittemplates();

});

function inittemplates() {
	var edittemplates = $("textarea.edittemplates");
	var templatefile = $("select.templatefile");

	edittemplates.live("keyup focusout", function(){
		if (templatefile.val().indexOf(".template") > 0)
		{
			var strTemplate = $(this).val();
			$("div.previewtemplates").html("<div class='previousone'>"+strTemplate+"</div><div class='mainone'>"+strTemplate+"</div><div class='nextone'>"+strTemplate+"</div>");
		}
		else
		{
			$("div.previewtemplates").html($(this).val());
		}
	});

	if (edittemplates.val()!="")
	{
		edittemplates.trigger("keyup");
	}
}
