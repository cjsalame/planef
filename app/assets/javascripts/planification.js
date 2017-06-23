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

// function attach_utpcomment(planification_id, comment) {
//   $.ajax({
//     type: "PUT",
//     url: "/planifications/" + planification_id + ".json",
//     data: { "planification[utpcomment]" :  comment },
//     dataType: "JSON",
//     success: function(data, ts, jq){
//       console.log("UTP comment attached to mail!");
//     }
//     error: function(data){
//       alert("No se pudo guardar el comentario..");
//     }
//   });
// }

// function state_shift(button_el, boolean_attr, state_msg, counterpart) {

//   return function() {
//     $(button_el).on("click", function(e) {
//       console.log("CLICK!");
//       $that = $(this);
//       planification_id = $that.data("planificationId");


//       if(counterpart === 'profesor') {
//         $("#plan-state-change-utp").on("click", function(e) {
//           if ( confirm('¿Enviar e-mail a ' + counterpart + '?') ) {
//             $.ajax({
//               type: "PUT",
//               url: "/planifications/" + planification_id + ".json",
//               data: { "planification[state]": boolean_attr,
//                       "planification[utpcomment]" : $("#plan_comment").val() },
//               dataType: "JSON",
//               success: function(data, ts, jq){
//                 console.log("Planification " + planification_id + " State Changed to " + boolean_attr);
//                 // Cambia el mensaje en columna "Estado"
//                 $("#plan-state-show").text( state_msg );
//                 // Hace al botón unclickable luego de mandar correo
//                 $that.attr("disabled", true);

//                 console.log("Comentario: " + $("#plan_comment").val() );
//                 alert("¡Correo enviado!");
//               }
//             });
//           }
//         });
//       }
//       else {
//         if ( confirm('¿Enviar e-mail a ' + counterpart + '?') ) {
//           $.ajax({
//             type: "PUT",
//             url: "/planifications/" + planification_id + ".json",
//             data: { "planification[state]": boolean_attr },
//             dataType: "JSON",
//             success: function(data, ts, jq){
//               console.log("Planification " + planification_id + " State Changed to " + boolean_attr);
//               // Cambia el mensaje en columna "Estado"
//               $("#plan-state-show").text( state_msg );
//               // Hace al botón unclickable
//               $that.attr("disabled", true);

//               alert("¡Correo enviado!");
//             }
//           });
//         }
//       }
//     });
//   }
// }


// // var modal-jorge = function() {

// //   // var triggers = $(".modal-jorgeInput").overlay({
// //   //   mask: {
// //   //     color: '#ebecff',
// //   //     loadSpeed: 200,
// //   //     opacity: 0.9
// //   //   },

// //   //   closeOnClick: false
// //   // });

// //   var $mb = $('.modal-jorge');

// //   $(".modal-jorgeInput").on("click", function(e) {
// //     console.log("CLICK!");
// //     $mb.css('display', 'block');
// //     $mb.animate({ opacity: 0 }, 0);
// //     $mb.animate({ opacity: 1, top: "10px" }, 'slow');
// //   });

// //   // Cerramos el cuadro modal-jorge al hacer click en cualquier parte
// //   $mb.on('click', function(ev) {
// //     $mb.animate({ opacity: 1, top: "0px" }, 'slow');
// //     $mb.animate({ opacity: 0 }, 0);
// //     $mb.css('display', 'none');
// //   });
// //   // Evitamos bubbling en los elementos que están dentro del mismo cuadro (el <div> dentro de <div class="modal-jorge-box"> )
// //   $('.modal-jorge div').on('click', function(ev) {
// //     ev.stopPropagation();
// //   });

// //   // Se cierra el cuadro modal-jorge al hacer click en la [X]
// //   $('.modal-jorge .X').on('click', function(ev) {
// //     $mb.animate({ opacity: 1, top: "0px" }, 'slow');
// //     $mb.animate({ opacity: 0 }, 0);
// //     $mb.css('display', 'none');
// //   });


// //   // $(".close").on("click", function (e) {
// //   //   triggers.eq(1).overlay().close();

// //   //   return e.preventDefault();
// //   // });


// // }


// var prof_shift = state_shift("#plan-state-change-prof", false, "Revisión por UTP", 'Jefe UTP');
// var utp_shift = state_shift(".modal-jorgeInput.plan_id", true, "Edición por Profesor", 'profesor' );

$(document).on('turbolinks:load', lecture_addition);
// $(document).on('turbolinks:load', prof_shift);
// $(document).on('turbolinks:load', utp_shift);
// $(document).on('turbolinks:load', modal-jorge);

