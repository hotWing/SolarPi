$(document).ready(function(){
	var c10price = 111.12;
	var c50price = 222.11;
	var c100price = 999.11;
	var $c10quantity = $('#c10-quantity');
	var $c10subtotal = $('#c10-subtotal');
	var curQuantity10 = parseInt($c10quantity.text());

	var $c50quantity = $('#c50-quantity');
	var $c50subtotal = $('#c50-subtotal');
	var curQuantity50 = parseInt($c50quantity.text());

	var $c100quantity = $('#c100-quantity');
	var $c100subtotal = $('#c100-subtotal');
	var curQuantity100 = parseInt($c100quantity.text());
	
	$('#c10-plus').on('click', function() {
		$c10quantity.text(++curQuantity10);
		$c10subtotal.text((c10price*curQuantity10).toFixed(2));
		updateTotal();
	});
	
	$('#c10-minus').on('click', function() {
		if(curQuantity10>0){
			$c10quantity.text(--curQuantity10);
			$c10subtotal.text((c10price*curQuantity10).toFixed(2));
			updateTotal();
		}
	});
	
	$('#c50-plus').on('click', function() {
		$c50quantity.text(++curQuantity50);
		$c50subtotal.text((c50price*curQuantity50).toFixed(2));
		updateTotal();
	});
	
	$('#c50-minus').on('click', function() {
		if(curQuantity50>0){
			$c50quantity.text(--curQuantity50);
			$c50subtotal.text((c50price*curQuantity50).toFixed(2));
			updateTotal();
		}
	});
	
	$('#c100-plus').on('click', function() {
		$c100quantity.text(++curQuantity100);
		$c100subtotal.text((c100price*curQuantity100).toFixed(2));
		updateTotal();
	});
	
	$('#c100-minus').on('click', function() {
		if(curQuantity100>0){
			$c100quantity.text(--curQuantity100);
			$c100subtotal.text((c100price*curQuantity100).toFixed(2));
			updateTotal();
		}
	});
	
	function updateTotal() {
		var total = (parseFloat($c100subtotal.text()) + parseFloat($c50subtotal.text()) + parseFloat($c10subtotal.text())).toFixed(2);
		$('#total').text(total);
	}
	
	function refreshForm()  {
		$('#pay-warning').hide();
		$('#consignee-error').hide();
		$('#tel-error').hide();
		$('#address-error').hide();
	}
});


