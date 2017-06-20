function makeid() {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 8; i++ ) {
    	text += possible.charAt(Math.floor(Math.random() * possible.length));
    }

    return text;
}

var code_generation = function() {

	$("#code-generator").on("click", function(e){
		console.log("CLICK!");
		var codestring = makeid(); 

		$.ajax({
			type: "PUT",
			url: "/schools/" + $("#school-id").data("schoolId") + ".json",
			data: { "school[code]": codestring },
			dataType: "JSON",
			success: function(data){
				console.log("Data Saved: " + data.name + " " + data.code);
				$("p#code-paragraph").text( codestring );
			},
			error: function(msg){
				console.log("Error generating the code!");
			}
		});

	});
}

$(document).on('turbolinks:load', code_generation);