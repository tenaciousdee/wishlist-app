/* global $ */
$(document).ready(function() {
  // TODO: Fix this hack
  setTimeout(function() {
    $('select').material_select();
    $(".button-collapse").sideNav();
    $('.modal-trigger').leanModal();
  }, 2000);
});