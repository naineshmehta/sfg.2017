﻿/*
Copyright (c) 2003-2009, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

(function(){CKEDITOR.plugins.add('jquery',{load:function(){if(!this.onLoad._called){this.onLoad();this.onLoad._called=1;}},onLoad:function(){if(typeof jQuery=='undefined')return;jQuery.extend(jQuery,{ckeditorConfig:function(a){jQuery.extend(CKEDITOR.config,a);}});jQuery.extend(jQuery.fn,{ckeditorGet:function(){var a=this.eq(0).data('ckeditorInstance');if(!a)throw 'CKEditor not yet initialized, use ckeditor() with callback.';return a;},ckeditor:function(a,b){if(!jQuery.isFunction(a)){var c=b;b=a;a=c;}b=b||{};this.filter('textarea, div, p').each(function(){var d=jQuery(this),e=d.data('ckeditorInstance'),f=this;if(e){if(a)a.apply(e,[this]);}else if(d.data('_ckeditorInstanceLock'))CKEDITOR.on('instanceReady',function(g){var h=g.editor;setTimeout(function(){if(!h.element)return setTimeout(arguments.callee,100);if(h.element.$==f)if(a)a.apply(h,[f]);},0);},null,null,9999);else{CKEDITOR.on('instanceReady',function(g){var h=g.editor;setTimeout(function(){if(!h.element)return setTimeout(arguments.callee,100);if(h.element.$!=f)return;g.removeListener('instanceReady',this.callee);h.on('contentDom',function(j){setTimeout(function(){d.trigger('setData.ckeditor',[h,h.getData()]);},100);});h.on('afterSetData',function(j){if(h.mode!='wysiwyg')d.trigger('setData.ckeditor',[h,j.data.dataValue]);});h.on('getData',function(j){d.trigger('getData.ckeditor',[h,j.data.dataValue]);});h.on('destroy',function(j){d.trigger('destroy.ckeditor',[h]);});if(h.config.autoUpdateElementJquery&&d.is('textarea')&&d.parents('form').length){var i=function(){d.ckeditor(function(){h.updateElement();});};d.parents('form').submit(i);d.bind('destroy.ckeditor',function(){d.parents('form').unbind('submit',i);});}d.data('ckeditorInstance',h);d.bind('destroy.ckeditor',function(){d.data('ckeditorInstance',null);});d.data('_ckeditorInstanceLock',null);d.trigger('instanceReady.ckeditor',[h]);if(a)a.apply(h,[f]);},0);},null,null,9999);if(b.autoUpdateElement||typeof b.autoUpdateElement=='undefined'&&CKEDITOR.config.autoUpdateElement)b.autoUpdateElementJquery=true;b.autoUpdateElement=false;d.data('_ckeditorInstanceLock',true);CKEDITOR.replace(f,b);}});return this;}});if(CKEDITOR.config.jqueryOverrideVal)jQuery.fn.val=CKEDITOR.tools.override(jQuery.fn.val,function(a){return function(b,c){var d=typeof b!='undefined',e;this.each(function(){var f=jQuery(this),g=f.data('ckeditorInstance');if(!c&&f.is('textarea')&&g){if(d)g.setData(b);else{e=g.getData();return null;}}else if(d)a.call(f,b);else{e=a.call(f);return null;
}});return d?this:e;};});}});})();CKEDITOR.config.jqueryOverrideVal=true;
