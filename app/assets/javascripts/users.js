var school_validation = function(){

	var school_code = ""

	$("select#schoolid option").on("click", function(e){
		var school_id = $("select#schoolid").find(":selected").val();

		$.ajax({
			type: "GET",
			url: "/schools/" + school_id + ".json",
			dataType: "json",
			success: function(data, ts, jq) {
				school_code = data.code;
				console.log("Selected School: " + data.name);
				console.log("Selected School code: " + data.code);
			},
			error: function(jq, st, er) {
				alert("Error seleccionando colegio");
				console.log("Error!", jq, st, er);
			}
		});


	});

	var inputed_code = ""
	$("#school-form-submit").on("click", function(e){
		inputed_code = $("[name='schoolCode']").val();
		console.log("school code: " +school_code);
		if( school_code != inputed_code ){
			e.preventDefault();
			console.log("Non-matching school codes!")
			alert('Error: Código ingresado no corresponde al código del colegio');
		} else if ( school_code === inputed_code ) {
			// Registra el colegio en su cuenta..

		}

	});


}

$(document).on('turbolinks:load', school_validation);
