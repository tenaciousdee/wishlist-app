/* global $ */
function setActive() {
  var aObj = document.getElementById('nav').getElementsByTagName('a');
  for (var i = 0; i < aObj.length; i++) {
    if (document.location.href.indexOf(aObj[i].href) >= 0) {
      aObj[i].className = 'active';
    }
  }
}
 
window.onload = setActive;

$(document).ready(function() {
  // TODO: Fix this hack
  setTimeout(function() {
    $('.modal-trigger').leanModal();
    $('.tooltipped').tooltip({delay: 10});
  }, 4000);
});

$(document).ready(function() {
  $(".button-collapse").sideNav();
  $('select').material_select();
});
