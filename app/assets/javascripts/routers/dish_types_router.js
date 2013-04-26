DR.Routers.DishTypesRouter = Backbone.Router.extend({
	routes: {
		"": "index"
	},

	initialize: function (navbar, content, allDishTypes) {
		this.$navbar = $(navbar);
		this.$content = $(content);
	},

	index: function (){
		var that = this;
		
		var dishTypesIndexView = 
			new DR.Views.DishTypesIndexView({ collection: allDishTypes});

		that.$content.html(dishTypesIndexView.render().$el);	
	}
});