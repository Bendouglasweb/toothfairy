Template.postItemDetailed.events({
	'click .mark_c': function() {

		Meteor.call("updateStatus",this.pid,"complete");

	},


	'click .mark_i': function() {
		Meteor.call("updateStatus",this.pid,"inprogress");
	},
	'click .mark_n': function() {
		Meteor.call("updateStatus",this.pid,"notcomplete");
	}




});
