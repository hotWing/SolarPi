$(document).ready(function(){

	var $barCtx = $("#bar-chart");
	var barChart = null;
	
	var $pieCtx = $('#pie-chart');
	var pieChart = null;
	var topNum = 10;
	
	setNewBarData("all", topNum);
	setNewPieData();
	
	$('#reset-btn').on('click', function() {
		setNewBarData("all", topNum);
	});
	
	function setNewPieData() {
		$.ajax({
	        url: "admin/productSales",
	        success: function(statsJSON,textStatus){
	        			var labels = [];
	        			var data = [];
			        	jQuery.each(statsJSON.stats, function(index, stat) {
			        		labels.push(stat.productName);
			        		data.push(stat.sales);
			        	});
			        	var newData = {
		        	        labels: labels,
		        	        datasets: [{
		        				            data: data,
		        	        				backgroundColor:[
		        				                              "#2ecc71",
		        				                              "#f1c40f",
		        				                              "#e74c3c"
		        				                          ]
		        			          }]
	        	    	};
			        	refreshPieChart(newData);
		        	},
        	error: function(XMLHttpRequest, error, errorThrown){  
	        		  alert(error);  
	        		  alert(errorThrown);  
        			},  
	  });
	}
	
	
	function setNewBarData(productName, topNum) {
		$.ajax({
	        url: "admin/topCountry",
        	method: "POST",
	        data: { productName: productName,
	        		topNum:topNum
	        	  },
	        success: function(statsJSON,textStatus){
	        			var labels = [];
	        			var data = [];
			        	jQuery.each(statsJSON.stats, function(index, stat) {
			        		labels.push(stat.country);
			        		data.push(stat.sales);
			        	});
			        	var newData = {
		        	        labels: labels,
		        	        datasets: [{
		        				            label: statsJSON.label,
		        				            data: data,
		        				            backgroundColor: '#3498db'
		        			          }]
	        	    	};
			        	refreshBarChart(newData);
//	        			var newData = {
//		        	        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
//		        	        datasets: [{
//		        				            label: 'xxxof Votes',
//		        				            data: [1, 1, 1, 1, 1, 1],
//		        	        				backgroundColor:'#3498db'
//		        			          }]
//	        	    	}
		        	},
        	error: function(XMLHttpRequest, error, errorThrown){  
	        		  alert(error);  
	        		  alert(errorThrown);  
        			},  
	  });
	}
	
	function refreshPieChart(data) 
	{
		if (pieChart)
			pieChart.destroy();
		
		pieChart = new Chart($pieCtx, {
		    type: 'pie',
		    data: data,
		});

		$pieCtx.click( 
	            function(evt){
	                var activePoints = pieChart.getElementAtEvent(evt);
	                if (activePoints.length > 0) {
	                	setNewBarData(activePoints[0]._model.label, topNum);
	                }
                     
	            }
	        ); 
	}
	
	function refreshBarChart(data) 
	{
		if (barChart)
			barChart.destroy();
		
		barChart = new Chart($barCtx, {
		    type: 'bar',
		    data: data,
		    options : {
		        scales: {
		            yAxes: [{
		                display: true,
		                ticks: {
//		                    suggestedMin: 0,    // minimum will be 0, unless there is a lower value.
		                    // OR //
		                    beginAtZero: true   // minimum value will be 0.
		                }
		            }]
		        }
		    }
		});
	}
	
});


