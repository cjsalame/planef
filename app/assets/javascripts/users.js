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
			console.log("Non-matching school codes!")
			alert('Error: Código ingresado no corresponde al código del colegio');
		}

	});

}

$(document).on('turbolinks:load', school_validation);
