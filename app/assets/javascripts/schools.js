function makeid() {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 8; i++ ) {
    	text += possible.charAt(Math.floor(Math.random() * possible.length));
    }

    return text;
}

var show_code_generation = function() {

	$("#show-school-code-generator").on("click", function(e){
		console.log("CLICK!");
		var codestring = makeid(); 

		$.ajax({
			type: "PUT",
			url: "/schools/" + $("#school-id").data("schoolId") + ".json",
			data: { "school[code]": codestring },
			dataType: "JSON",
			success: function(data){
				console.log("Data Saved: " + data.name + " " + data.code);
				$(".code-paragraph").text( codestring );
			},
			error: function(msg){
				console.log("Error generating the code!");
			}
		});

	});
}


var new_code_generation = function() {

	$("#new-school-code-generator").on("click", function(e) {
		
		console.log("CLICK!");
		var codestring = makeid();

		$(".code-paragraph").text( codestring );
		$(".code-paragraph").val( codestring );

	});

}

var code_mailer = function() {

	$("#send-email-code").on("click", function(e) {
		input_email = $(".prof-mail.username").val() + "@" + $(".prof-mail.domain").val();
		user = null;

		if ( confirm('¿Enviar e-mail a ' + input_email + '?') ) {
			$.ajax({
				type: "GET",
				url: "/users",
				data: { get_param : 'value' },
				dataType: "JSON",
				success: function(data){

					user_presence = false;

					$.each(data, function(index, element) {
						console.log(element.email);
						if (input_email === element.email) { 
							user_presence = true;
							user = element;
						} 
					});

					if (!user_presence) { 
						e.preventDefault();
						alert("¡No existe usuario con ese correo!"); 
					}
					else {
						$.ajax({
							type: "GET",
							url: "/send_code_email",
							dataType: 'script',
							data: { prof_id: user.id, 
										  school_id: $("#school-id").data("schoolId") },
							success: function(data) {
								alert("¡Correo enviado!");
							},
							error: function(msg) {
								console.log("Error enviando correo...");
							}
						});
					}
				},

				error: function(msg){
					console.log("No se pudo obtener datos de los usuarios.");
				}
			});
		}
	});
}

$(document).on('turbolinks:load', show_code_generation);
$(document).on('turbolinks:load', new_code_generation);
$(document).on('turbolinks:load', code_mailer);