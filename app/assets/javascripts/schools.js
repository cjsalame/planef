function makeid() {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 8; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}

$(function() {
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
}) ();

// var ajax_code_call = $(function(){
// 	$("#code-generator").on("click", function(e){
// 		var codestring = makeid(); 

// 		$.ajax({
// 			type: "PUT",
// 			url: "/schools/" + $("#school-id").data("schoolId") + ".json",
// 			data: { "school[code]": codestring },
// 			dataType: "JSON",
// 			success: function(msg){
// 				console.log("Data Saved: " + msg);
// 				var $codeblock = $("p").text(codestring);
// 				$("#code-generator").after( $codeblock );
// 			}
// 		});
// 	});
// });

// $(document).ready(ajax_code_call);
// $(document).on('page:load', ajax_code_call);


