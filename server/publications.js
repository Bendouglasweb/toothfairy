Meteor.publish('posts', function() {
  return Posts.find();
});

Meteor.publish('tickets', function() {
  return Tickets.find();
});
