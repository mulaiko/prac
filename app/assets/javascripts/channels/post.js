App.post = App.cable.subscriptions.create("PostChannel", {
  connected: function() { console.log("connected to server");},
  disconnected: function() {},
  received: function(data) {
    $("#posts").prepend(data["message"]);   
  },
  create_post: function(message) {
    return this.perform('create_post', {
      message: message,      
    });
  }
});

$( document).ready( function(){
  $(".simple_form.new_post").submit(function (e) {
      App.post.create_post($('#post_content').val());
      $('#post_text').val("");
      $("#post_submit").prop("disabled", false);
      e.preventDefault();    
  });
});