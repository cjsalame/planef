var lecture_addition = $(function() {
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
});

function state_shift(button_el, boolean_attr, state_msg) {

  return function() {
    $(button_el).on("click", function(e) {
      console.log("CLICK!");

      $.ajax({
        type: "PUT",
        url: "/planifications/" + $(this).data("planificationId") + ".json",
        data: { "planification[state]": boolean_attr },
        dataType: "JSON",
        success: function(data, ts, jq){
          console.log("Planification " + $(this).data("planificationId") + " State Changed to " + boolean_attr);
          $("#plan-state-show").text( state_msg );
        }
      });
    });
  }

}

var prof_shift = $( state_shift("#plan-state-change-prof", false, "Revisión por UTP") );
var utp_shift = $( state_shift("#plan-state-change-utp", true, "Edición por Profesor") );


$(document).ready(lecture_addition);
$(document).on('page:load', lecture_addition);

$(document).ready(prof_shift);
$(document).on('page:load', prof_shift);

$(document).ready(utp_shift);
$(document).on('page:load', utp_shift);