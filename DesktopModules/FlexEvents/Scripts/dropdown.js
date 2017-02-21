/*
 * By BizModules Solutions (rongers@hotmail.com, service@bizmodules.net)
 * Copyright (c) 2014 BizModules Solutions
 * All rights reserved, do not use this script library out of Flex Events expect directly licensed by the copyright owner.
*/


(function(jQuery){
 $.fn.dropdownselection = function(options) {
    
  var defaults = {
		openonhover:false
  };
  
  var options = $.extend(defaults, options);
    
	return this.each(function() {

		var dropdown = $(this);

		var pickedcategory = dropdown.find(".pickedcategory");

		dropdown.find(".acontainer a").click(function () {
			dropdown.find(".ulcontainer ul").toggle();
		});

		dropdown.find(".ulcontainer ul li a").click(function () {
			var category = $(this).attr("rel") * 1;
			var text = $(this).html();
			dropdown.find(".acontainer a").html(text);
			dropdown.find(".ulcontainer ul").hide();
			pickedcategory.val(category);
			onselect(category);

			if (pickedcategory.hasClass("autopostback")) {
				__doPostBack(pickedcategory.attr("id"), category);
			}
		});

		function onselect(id) {
			if (typeof (selectcategory) == "function") selectcategory(id);
		}

		$(document).bind('click mousewheel DOMMouseScroll', function (e) {
			var $clicked = $(e.target);
			if (!$clicked.parents().hasClass("dropdown"))
				dropdown.find(".ulcontainer ul").hide();
		});

		var dftcategory = pickedcategory.val();
		if (dftcategory != "") {
			onselect(dftcategory);
			dropdown.find(".acontainer a").html(dropdown.find(".ulcontainer ul li a[rel=" + dftcategory + "]").html());
		}
		else {
			dropdown.find(".acontainer a").html(dropdown.find(".ulcontainer ul li:first a").html());
		}

		return;
  });
 };
})($);
