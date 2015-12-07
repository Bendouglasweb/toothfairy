Template.postSubmit.events({
  'submit form': function(e) {
    e.preventDefault();

    var post = {
      username: $(e.target).find('[name=username]').val(),
      details: $(e.target).find('[name=details]').val()
    };

    Tickets.insert(post);
    //Router.go('thanks', post);
  }
});
