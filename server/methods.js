Meteor.methods({
	updateStatus: function(pidin,state) {
		console.log(pidin + " " + state);
		Posts.update(
			{ pid: pidin },
			{ $set: 
				{ status: state }
			}
		);
	}
});
