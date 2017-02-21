/*
 * UMGClassic Script for Ultra Video Gallery CategoryPicker
 * By Pengcheng Rong (rongers@hotmail.com, service@bizmodules.net)
 * Copyright (c) 2012 Pengcheng Rong
 * All rights reserved, do not use this script library out of Ultra Video Gallery expect directly licensed by the copyright owner.
*/


String.prototype.endsWith = function(suffix) {
    return this.indexOf(suffix, this.length - suffix.length) !== -1;
};

(function(jQuery){
jQuery.fn.categorypicker = function(options) {
    
  var defaults = {
	  max:3
  };
  
	var options = jQuery.extend(defaults, options);
    
	return this.each(function() {
		var _this=this;
		var cboCategories = jQuery(this);
		var selected = cboCategories.next();
		var categoriesString = dnn.getVar(cboCategories.attr("id")+"_selected");
		if (!categoriesString) categoriesString = ""; else checkmaximum();

        cboCategories.bind("change", function () {
            var categoryId = this.options[this.selectedIndex].value;
            var category = this.options[this.selectedIndex].text;

            if (categoryId * 1 < 0) return;
            if (("," + categoriesString + ",").indexOf("," + categoryId + ",") >= 0)
			{
				//previous selected, move it to top
				categoriesString = (categoryId + "," + categoriesString + ",").replace("," + categoryId + ",", ",");
				if (categoriesString.endsWith(","))
				{
					categoriesString=categoriesString.substring(0, categoriesString.length-1);
				}
			}
			else
			{
				if (categoriesString != "") {
					categoriesString = "," + categoriesString;
				}
				categoriesString = categoryId/* + "|" + category*/ + categoriesString;
				checkmaximum();
			}

            dnn.setVar(cboCategories.attr("id")+"_selected", categoriesString);
            showSelectedCategories();
        });

        showSelectedCategories();

		function checkmaximum()
		{
			if (options.max <= 0)
			{
				return;
			}

			var categories = categoriesString.split(",");
			if (options.max < categories.length)
			{
				categoriesString = categories.slice(categories.length-options.max,categories.length).join(",");
			}
		}

		
		function showSelectedCategories() {
			selected.empty();
			var categories = categoriesString.split(",");
			for (i = 0; i < categories.length; i++) {
				if (categories[i] != "")
				{
					var id, name;
					if (categories[i].indexOf("|") > 0)
					{
						var category = categories[i].split("|");
						id = category[0];
						name = category[1];
					}
					else
					{
						//only id is present
						id = categories[i];
						name = cboCategories.find("option[value='" + id + "']").text();
					}
					selected.append("<li><span class='categoryname'>" + name + "</span> <a class='removecategory' rel='" +id + "' href='javascript:void(0);'>[X]</a></li>");
				}
			}
			selected.find("a").click(function(){_this.removeCategory(this.rel);});
		}

		this.removeCategory = function(categoryId) {
			var newCategories = "";
			var categories = categoriesString.split(",");

			for (i = 0; i < categories.length; i++) {
				if (categories[i].split("|")[0] != categoryId) {
					if (newCategories != "") newCategories += ",";
					newCategories += categories[i];
				}
			}

            dnn.setVar(cboCategories.attr("id")+"_selected", newCategories);
			categoriesString = newCategories;
			showSelectedCategories();
		}

		
		return;
  });
 };
})(jQuery);

