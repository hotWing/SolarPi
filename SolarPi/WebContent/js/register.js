$(document).ready(function(){

	$('#select-country').on('change', function() {
		  var countryName =  $(this).val();
		  
		  $.ajax({
		        url: "user/getCities/" + countryName,
		       
		        success: function(cities,textStatus){
		        			var htmlArray = [];
				        	jQuery.each(cities, function(index, city) {
				        		htmlArray.push("<option value=\"",city.name,"\">",city.name,"</option>");
				        	});
				        	var $selectCity = $("#select-city");
				        	$selectCity.html(htmlArray.join(""));
				        	//var selectedVal =$selectCity.children("option").first().val();
				        	$selectCity.trigger('change');
				        	//$selectCity.text(selectedVal);
			        	},
	        	error: function(XMLHttpRequest, error, errorThrown){  
		        		  alert(error);  
		        		  alert(errorThrown);  
	        			},  
		  });
	});
});
