App.post = App.cable.subscriptions.create("PostChannel", {
  connected: function() { console.log("connected to server");},
  disconnected: function() {},
  received: function(data) {
    $("#posts").prepend(data["content"]);         
    $('#post_submit').prop("disabled", false);   
  },
  create_post: function(content) {
    return this.perform('create_post', {
      content: content,      
    })
  }
});

$( document).ready( function(){
  $(document).on('submit', '.simple_form.new_post', {}, function(e) {
    App.post.create_post($('#post_content').val());      
    $('#post_content').val("");
    e.preventDefault();
  });
});