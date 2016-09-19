
define(function (require) {
	'use strict';

    var $		  	= require("jquery"),		 
		Handlebars 	= require('handlebars')
	
	return {
		OptionList : function(str,control,url,id) {
			Handlebars.registerHelper("role_list", function() {
				function get_dropdown() {
					var dropdown = "test";
					
			 		$.ajax({
					    url: "users/list_roles",
					    async: false,
						dataType:'json',
					    success: function(response){
				        	for(var i=0;i<response.length;i++) {
								if (id != "" && id == response[i].id) {
									var selected = "selected";
								}  else {
									var selected = "";
								}
				        		dropdown +=' <option ' + selected + ' value="'+response[i].id+'">'+response[i].name+'</option>';
			            	}
				        }
				    });
					
				    return dropdown;
				}
				
				return new Handlebars.SafeString(get_dropdown());
			});
		},
		ListSelect : function() {
			Handlebars.registerHelper("select", function(value, options) {
			  return options.fn(this)
			    .split('\n')
			    .map(function(v) {
			      var t = 'value="' + value + '"'
			      return ! RegExp(t).test(v) ? v : v.replace(t, t + ' selected="selected"')
			    })
			    .join('\n');
			});
		}
		
	}
});

   
//
//	Handlebars.registerHelper('if', function(v1, v2, options) {
//	  if(v1 === v2) {
//	    return options.fn(this);
//	  }
//	  return options.inverse(this);
//	});
//
//	Handlebars.registerHelper('link', function(text, options) {
//	  var attrs = [];
//
//	  for (var prop in options.hash) {
//	    attrs.push(
//	        Handlebars.escapeExpression(prop) + '="'
//	        + Handlebars.escapeExpression(options.hash[prop]) + '"');
//	  }
//
//	  return new Handlebars.SafeString(
//	    "<a " + attrs.join(" ") + ">" + Handlebars.escapeExpression(text) + "</a>"
//	  );
//	});
//
//	return Handlebars;
//});