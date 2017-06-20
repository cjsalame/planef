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



$(document).ready(code_generation);
$(document).on('page:load', code_generation);