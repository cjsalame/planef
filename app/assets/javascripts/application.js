// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
}


function state_shift(button_el, boolean_attr, state_msg, counterpart) {

  return function() {
    $(button_el).on("click", function(e) {
      console.log("CLICK!");
      $that = $(this);
      planification_id = $that.data("planificationId");


      if(counterpart === 'profesor') {
        $(".plan-state-change-utp").on("click", function(e) {
          if ( confirm('¿Enviar e-mail a ' + counterpart + '?') ) {
            $.ajax({
              type: "PUT",
              url: "/planifications/" + planification_id + ".json",
              data: { "planification[state]": boolean_attr, 
                      "planification[utpcomment]" : $(".modal-jorge textarea").val() },
              dataType: "JSON",
              success: function(data, ts, jq){
                console.log("Planification " + planification_id + " State Changed to " + boolean_attr);
                // Cambia el mensaje en columna "Estado"
                $(".plan_state").text( state_msg );
                // Hace al botón unclickable luego de mandar correo
                $that.attr("disabled", true);
                
                console.log("Comentario: " + $(".modal-jorge textarea").val() );
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
              $(".plan_state").text( state_msg );
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

  // var triggers = $(".modal-jorgeInput").overlay({
  //   mask: {
  //     color: '#ebecff',
  //     loadSpeed: 200,
  //     opacity: 0.9
  //   },

  //   closeOnClick: false
  // });

  plan_id = $(".modalInput.plan_id").data("planificationId");

  var $mb = $('.modal-jorge.' + plan_id);

  $(".modalInput." + plan_id + ".plan_id").on("click", function(e) {
    console.log("CLICK!");
    $mb.css('display', 'block');
    $mb.animate({ opacity: 0 }, 0);
    $mb.animate({ opacity: 1, top: "10px" }, 'slow');
  });

  // Cerramos el cuadro modal-jorge al hacer click en cualquier parte
  $mb.on('click', function(ev) {
    $mb.animate({ opacity: 1, top: "0px" }, 'slow');
    $mb.animate({ opacity: 0 }, 0);
    $mb.css('display', 'none');
  });
  // Evitamos bubbling en los elementos que están dentro del mismo cuadro (el <div> dentro de <div class="modal-jorge-box"> )
  $('.modal-jorge div').on('click', function(ev) {
    ev.stopPropagation();
  });

  // Se cierra el cuadro modal-jorge al hacer click en la [X]
  $('.modal-jorge .X').on('click', function(ev) {
    $mb.animate({ opacity: 1, top: "0px" }, 'slow');
    $mb.animate({ opacity: 0 }, 0);
    $mb.css('display', 'none');
  });


  // $(".close").on("click", function (e) {
  //   triggers.eq(1).overlay().close();

  //   return e.preventDefault();
  // });


}


var prof_shift = state_shift(".plan-state-change-prof", false, "Revisión por UTP", 'Jefe UTP');
var utp_shift = state_shift(".modalInput", true, "Edición por Profesor", 'profesor' );

$(document).on('turbolinks:load', prof_shift);
$(document).on('turbolinks:load', utp_shift);
$(document).on('turbolinks:load', modal_jorge);
