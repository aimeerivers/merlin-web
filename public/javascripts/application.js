$(document).ready(function() {
  AjaxAdventure.setup();
});

function AjaxAdventure() {
}

AjaxAdventure.setup = function() {
  AjaxAdventure.enableAjax('.direction-arrow');
  AjaxAdventure.enableAjax('.items a');
  AjaxAdventure.enableAjax('.inventory a');
}

AjaxAdventure.enableAjax = function(link) {
  $(link).live('click', function(e) {
    return AjaxAdventure.respondWithAjax($(this).attr('href'));
  });
}

AjaxAdventure.respondWithAjax = function(url) {
  $.get(url, {}, function(result) { $('#wrapper').html(result); });
  return false;
}
