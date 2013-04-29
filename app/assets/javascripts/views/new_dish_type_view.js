DR.Views.NewDishTypeView = Backbone.View.extend({
	render: function () {
		var that = this;

		var newDishForm = new Backbone.Form({
			model: that.model
		});

		that.$el.html(newDishForm.render().el);
		return that;
	}
});