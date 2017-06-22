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
