$(document).ready(function() {

	var result = 0;
	var firstInput = '';
	var secondInput = '';
	var operator = '';

	function display (val) {
		$('.io-field input[type=text]').val(val);
	}

	function clearResult() {
		result = 0;
		firstInput = '';
		secondInput = '';
		operator = '';
	}

	function calculate (a,b,operator) {
		switch(operator) {
			case "+" :
				result = eval(parseInt(a) + parseInt(b));
				display(result);
				break;
			case "-" :
				result = eval(parseInt(a) - parseInt(b));
				display(result);
				break;
			case "*" :
				result = eval(parseInt(a) * parseInt(b));
				display(result);
				break;
			case "/" :
				result = eval(parseInt(a) / parseInt(b));
				display(result);
				break;
		}
	}

	display(result);

	$('select').click(function(){
		var str = $(this).val();
		var paramsArr = str.split(" ");
		calculate(paramsArr[0],paramsArr[2],paramsArr[1]);
	});

	$('.button').click(function(){
		var btn = $(this);
		var val = btn.text();


		if (result != 0 && firstInput != '' && secondInput != '')
			clearResult();

		if (btn.hasClass('clear')) {
			clearResult();
			display(result);
		}

		if (!btn.hasClass('op-btn') ) {
			if (operator != '') {
				secondInput += val;
				display(secondInput);
			}
			else if (!btn.hasClass('clear')) {
				firstInput += val;
				display(firstInput);
			}
		}
		else {
			if (val != '=') {
				operator = val;
			} else if (val == '=') {
				calculate(firstInput, secondInput, operator);
				if (firstInput != '' && secondInput != '' && operator != '') {
					$('.calc-history').prepend("<option>" + firstInput + " " + operator + " " + secondInput + "</option>");
				}
			}
		}
	})
});