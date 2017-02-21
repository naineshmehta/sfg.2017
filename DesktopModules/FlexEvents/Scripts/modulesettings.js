
$(document).ready(function(){

	if (typeof (Sys) != "undefined")
	{
		var req = Sys.WebForms.PageRequestManager.getInstance();
		if (req)
			req.add_endRequest(inittabs);
	}

	inittabs();
});

function inittabs()
{
	$('div.modulesettings').dnnTabs();
}