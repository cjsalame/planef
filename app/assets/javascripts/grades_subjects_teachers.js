function state_shift(button_el, boolean_attr, state_msg, counterpart) {

  return function() {
    $(button_el).on("click", function(e) {
      console.log("CLICK!");
      $that = $(this);
      planification_id = $that.data("planificationId");


      if(counterpart === 'profesor') {
        $("#plan-state-change-utp").on("click", function(e) {
          if ( confirm('¿Enviar e-mail a ' + counterpart + '?') ) {
            $.ajax({
              type: "PUT",
              url: "/planifications/" + planification_id + ".json",
              data: { "planification[state]": boolean_attr,
                      "planification[utpcomment]" : $("#plan_comment").val() },
              dataType: "JSON",
              success: function(data, ts, jq){
                console.log("Planification " + planification_id + " State Changed to " + boolean_attr);
                // Cambia el mensaje en columna "Estado"
                $(".plan-state-show").text( state_msg );
                // Hace al botón unclickable luego de mandar correo
                $that.attr("disabled", true);

                console.log("Comentario: " + $("#plan_comment").val() );
                alert("¡Correo enviado!");
              }
            });
          }
        });
      }
      else {
        if ( confirm('¿Enviar e-mail a ' + counterpart + '?') ) {
          $.ajax({
            type: "PUT",
            url: "/planifications/" + planification_id + ".json",
            data: { "planification[state]": boolean_attr },
            dataType: "JSON",
            success: function(data, ts, jq){
              console.log("Planification " + planification_id + " State Changed to " + boolean_attr);
              // Cambia el mensaje en columna "Estado"
              $(".plan-state-show").text( state_msg );
              // Hace al botón unclickable
              $that.attr("disabled", true);

              alert("¡Correo enviado!");
            }
          });
        }
      }
    });
  }
}


var prof_shift = state_shift(".plan-state-change-prof", false, "Revisión por UTP", 'Jefe UTP');

$(document).on('turbolinks:load', prof_shift);