function state_shift(button_el, boolean_attr, state_msg, counterpart) {

  return function() {
    $(button_el).on("click", function(e) {
      $that = $(this);
      planification_id = $(this).data("planificationId");
      console.log("CLICK! Plan ID: " +planification_id);


      if(counterpart === 'profesor') {
        $(".plan-state-change-utp."+planification_id).on("click", function(e) {
          if ( confirm('¿Enviar e-mail a ' + counterpart + '?') ) {
            $.ajax({
              type: "PUT",
              url: "/planifications/" + planification_id + ".json",
              data: { "planification[state]": boolean_attr,
                      "planification[utpcomment]" : $(".modal-jorge." + planification_id + " textarea").val() },
              dataType: "JSON",
              success: function(data, ts, jq){
                console.log("Planification " + planification_id + " State Changed to " + boolean_attr);
                // Cambia el mensaje en columna "Estado"
                $(".plan-state-show."+planification_id).text( state_msg );
                // Hace al botón unclickable luego de mandar correo
                $that.attr("disabled", true);

                console.log("Comentario: " + $(".modal-jorge." + planification_id + " textarea").val() );
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
              $(".plan-state-show."+planification_id).text( state_msg );
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


var modal_jorge = function() {


  var $mb = $();
  plan_id = 0;

  $(".modal-jorgeInput").on("click", function(e) {
    plan_id = $(this).data("planificationId");
    $mb = $('.modal-jorge.' + plan_id);
    $mb.css('display', 'block');
    $mb.animate({ opacity: 0 }, 0);
    $mb.animate({ opacity: 1, top: "10px" }, 'slow');

    $(".dimmer").css('display', 'block');
    $(".dimmer").animate({ opacity: 0 }, 0);
    $(".dimmer").animate({ opacity: 1, top: "10px" }, 'slow');
    
    // Cerramos el cuadro modal-jorge al hacer click en cualquier parte
    $mb.on('click', function(ev) {
      $mb.animate({ opacity: 1, top: "0px" }, 'slow');
      $mb.animate({ opacity: 0 }, 0);
      $mb.css('display', 'none');

      $(".dimmer").animate({ opacity: 1, top: "0px" }, 'slow');
      $(".dimmer").animate({ opacity: 0 }, 0);
      $(".dimmer").css('display', 'none');
    });
    // Evitamos bubbling en los elementos que están dentro del mismo cuadro (el <div> dentro de <div class="modal-jorge-box"> )
    $('.modal-jorge.'+plan_id+' div').on('click', function(ev) {
      ev.stopPropagation();
    });

    // Se cierra el cuadro modal-jorge al hacer click en la [X]
    $('.modal-jorge .X.'+plan_id).on('click', function(ev) {
      $mb.animate({ opacity: 1, top: "0px" }, 'slow');
      $mb.animate({ opacity: 0 }, 0);
      $mb.css('display', 'none');

      $(".dimmer").animate({ opacity: 1, top: "0px" }, 'slow');
      $(".dimmer").animate({ opacity: 0 }, 0);
      $(".dimmer").css('display', 'none');
    });

  });


}

var utp_shift = state_shift(".modal-jorgeInput", true, "Edición por Profesor", 'profesor' );

$(document).on('turbolinks:load', utp_shift);
$(document).on('turbolinks:load', modal_jorge);
