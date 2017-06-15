var school_validation = $(function(){

	var school_code = ""
	
	// opción 1)
	// $("#school-form-submit").on("click", function(e){
	// 	e.preventDefault();

	// 	var school_id = $("select#schoolid").find(":selected").val();
	// 	var inputed_code = $("[name='schoolCode']").val();

	// 	$.ajax({
	// 		type: "GET",
	// 		url: "/schools/" + school_id + ".json",			
	// 		dataType: "json",
	// 		success: function(data, ts, jq) {
	// 			school_code = data.code;
	// 			console.log("School Code: " + school_code);
	// 			console.log("Inputed Code: " + inputed_code);
	// 		},
			
	// 		// error: function(jq, st, er) {
	// 		// 	e.preventDefault();
	// 		// 	alert("Error: No se pudo ingresar colegio");
	// 		// 	console.log("Error!", jq, st, er);
	// 		// }

	// 	})
	// 	.done(function(data){
	// 		console.log("Data: " + data.code)
	// 		if( data.code === inputed_code ) {
	// 			// Registra el colegio en su cuenta..
	// 			$(this).unbind("click");
	// 			console.log("Son iguales");
	// 		}
	// 		else {
	// 			console.log("No son iguales..");
	// 			e.preventDefault();
	// 			alert('Error: Código ingresado no corresponde al código del colegio');
	// 		}

	// 	});

	// });

	// opción 2)
	$("select#schoolid option").on("click", function(e){
		var school_id = $("select#schoolid").find(":selected").val();

		$.ajax({
			type: "GET",
			url: "/schools/" + school_id + ".json",
			dataType: "json",
			success: function(data, ts, jq) {
				school_code = data.code;
				console.log("School Code: " + school_code);
			},
			error: function(jq, st, er) {
				alert("Error seleccionando colegio");
				console.log("Error!", jq, st, er);
			}
		});


	});

	$("#school-form-submit").on("click", function(e){
		var inputed_code = $("[name='schoolCode']").val();
		if( school_code === inputed_code ){
			// Registra el colegio en su cuenta..
		} else {
			e.preventDefault();
			alert('Error: Código ingresado no corresponde al código del colegio');
		}

	});

});

$(document).ready(school_validation);
$(document).on('page:load', school_validation);