$(document).on('turbolinks:load', function(){
	$(document).on('ajax:success', 'form[data-remote]', {}, function(event) {
    var data, status, xhr, _ref;
    _ref = event.detail, data = _ref[0], status = _ref[1], xhr = _ref[2];
    console.log(xhr.responseText);
    return $('#follow_user').html(xhr.responseText);
  });
});