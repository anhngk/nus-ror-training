$(document).ready(function() {

	var result = 0;
	var screenDisplay = '';
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
		screenDisplay = '';
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

	$('.button').click(function(){
		var btn = $(this);
		var val = btn.text();

		$('select').click(function(){
			var str = $(this).val();
			console.log(str);
			if (str != null){
				var paramsArr = str.split(" ");
				firstInput = paramsArr[0];
				secondInput = paramsArr[2];
				operator = paramsArr[1];
				display(firstInput + operator + secondInput);
			} else
				display(result);
		});


		if (result != 0 && firstInput != '' && secondInput != '')
			clearResult();

		if (btn.hasClass('clear')) {
			clearResult();
			display(result);
		}

		if (!btn.hasClass('op-btn') ) {
			if (operator != '') {
				secondInput += val;
				display(screenDisplay += val);
			}
			else if (!btn.hasClass('clear')) {
				firstInput += val;
				display(screenDisplay += val);
			}
		}
		else {
			if (val != '=') {
				operator = val;
				display(screenDisplay += operator);
			} else if (val == '=') {
				calculate(firstInput, secondInput, operator);
				if (firstInput != '' && secondInput != '' && operator != '') {
					$('.calc-history').prepend("<option>" + firstInput + " " + operator + " " + secondInput + "</option>");
				}
			}
		}
	})
});