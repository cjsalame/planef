var school_validation = $(function(){

	$("#school-form-submit").on("click", function(e){

		// opción 1)
		// var school_code = $("select#schoolid").find(":selected").data("schoolCode");
		// var inputed_code = $("[name='schoolCode']").val();
		// if( !(school_code === inputed_code) ){
		// 	e.preventDefault();
		// 	alert('Error: código ingresado no corresponde al código del colegio');
		// }



		// opción 2)
		e.preventDefault();

		var school_id = $("select#schoolid").find(":selected").val();
		
		$.ajax({
			type: "GET",
			url: "/schools/" + school_id + ".json",
			dataType: "json",
			success: function(data, ts, jq) {
				console.log("School Data Retrieved!: " + data.code);
				var school_code = data.code;
			}
		});

		var inputed_code = $("[name='schoolCode']").val();

	});

});

$(document).ready(school_validation);
$(document).on('page:load', school_validation);