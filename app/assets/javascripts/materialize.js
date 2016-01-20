/* global $ */
$(document).ready(function() {
  // TODO: Fix this hack
  setTimeout(function() {
    $('.modal-trigger').leanModal();
  }, 4000);
});

$(document).ready(function() {
  $(".button-collapse").sideNav();
  $('select').material_select();
});