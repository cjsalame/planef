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

function state_shift(button_el, boolean_attr, state_msg, counterpart, disabling) {

  return function() {
    $(button_el).on("click", function(e) {
      console.log("CLICK!");
      $that = $(this);

      if ( confirm('¿Enviar e-mail a ' + counterpart + '?') ) {
        $.ajax({
          type: "PUT",
          url: "/planifications/" + $that.data("planificationId") + ".json",
          data: { "planification[state]": boolean_attr },
          dataType: "JSON",
          success: function(data, ts, jq){
            console.log("Planification " + $that.data("planificationId") + " State Changed to " + boolean_attr);
            // Cambia el mensaje en columna "Estado"
            $("#plan-state-show").text( state_msg );
            // Hace al botón unclickable
            $that.attr("disabled", true);
          }
        });
      }
    });
  }

}

var prof_shift = state_shift("#plan-state-change-prof", false, "Revisión por UTP", 'Jefe UTP');
var utp_shift = state_shift("#plan-state-change-utp", true, "Edición por Profesor", 'profesor');


$(document).on('turbolinks:load', lecture_addition);

$(document).on('turbolinks:load', prof_shift);

$(document).on('turbolinks:load', utp_shift);