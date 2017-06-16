function makeid() {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 8; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}

var code_generation = $(function() {
	return $(document).on("click", "#code-generator", function(e){
		var codestring = makeid(); 

		$.ajax({
			type: "PUT",
			url: "/schools/" + $("#school-id").data("schoolId") + ".json",
			data: { "school[code]": codestring },
			dataType: "JSON",
			success: function(msg){
				console.log("Data Saved: " + msg);
				$("p#code-paragraph").text( codestring );
			}
		});

	});
});



var school_validation = $(function(){

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

});


$(document).ready(code_generation);
$(document).on('page:load', code_generation);

$(document).ready(school_validation);
$(document).on('page:load', school_validation);
