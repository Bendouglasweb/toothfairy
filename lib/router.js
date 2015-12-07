Router.configure({
  layoutTemplate: 'layout',
  notFoundTemplate: 'notFound'
});


Router.route('/', {name: 'postsList'});


Router.route('/posts/:pid', {
  name: 'postPage',
  data: function() { return Posts.findOne({pid:this.params.pid}); }
});


Router.route('/support', {name: 'postSubmit'});
