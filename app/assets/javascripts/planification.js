var lecture_addition = function() {
  $("#add-lecture-link").on("click", function(e) {
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
}





$(document).on('turbolinks:load', lecture_addition);
