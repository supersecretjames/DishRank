DR.Views.DishTypesIndexView = Backbone.View.extend({

	render: function () {
		var that = this;

		var renderedContent = JST["dish_types/index"]({
			dish_types: that.collection
		});

		that.$el.html(renderedContent);
		return that;
	}
})