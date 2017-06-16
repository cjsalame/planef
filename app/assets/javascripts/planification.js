// var main = (function () {

// 	$('#lecture-button').click(function (){
// 	  $("#lecture-form").append("<%= j render partial: 'lectures/form', locals: {f: @builder, planification: @planification} %>");

// 	  $("#lecture-form").append($partial_form);
// 	  // $("div.actions").before($partial_form);

// 	  return false;
// 	});
// });

// // $(document).ready(main);
// $(document).on('turbolinks:load', main);
$(function() {
  return $(document).on("click", "#add-lecture-link", function(e) {
    e.preventDefault();
    $.ajax({
      url: '/planifications/add_lecture.html',

      success: function(data) {
        var el_to_add;
        el_to_add = $(data).html();
    		$('#lecture-form').append(el_to_add);
      },

      error: function(data) {
        return alert("Sorry, There Was An Error!");
      }

    });
  });
}) ();
