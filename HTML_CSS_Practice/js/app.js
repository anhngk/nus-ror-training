$(document).ready(function(){
	$('.datepicker').datepicker();

	$('#info-form').validate({
		rules: {
			firstname: "required",
			lastname: "required",
			email: {
				required: true,
				email: true,
			},
		}
	});
});	