DR.Routers.DishTypesRouter = Backbone.Router.extend({
	routes: {
		"": "index",
		"/dish_types/new" : "new",
		"dish_types" : "index",
		"dish_types/:id/dishes": "dishTypeDishes"
	},

	initialize: function (navbar, content) {
		this.$navbar = $(navbar);
		this.$content = $(content);
	},

	index: function (){
		var that = this;

		var dishTypesIndexView = new DR.Views.DishTypesIndexView({ collection: DR.Store.DishTypes });

		that.$content.html(dishTypesIndexView.render().$el);	
	},

	// new: function () {
	// 	var that = this;
		
	// 	var blankDishType = new DR.Models.DishType();

	// 	var newDishType = new DR.Views.NewDishTypeView({ model: blankDishType});

	// 	that.$content.html(newDishType.render().$el);
	// },

	dishTypeDishes: function (dishTypeId) {
		var that = this;

		var dishType = DR.Store.DishTypes.get(dishTypeId);

		var dishTypeDishesView = new DR.Views.DishTypeDishesView({ model: dishType })
		that.$content.html(dishTypeDishesView.render().$el);

		var dishTypesIndexView = new DR.Views.DishTypesIndexView({ collection: DR.Store.DishTypes });
		that.$navbar.html(dishTypesIndexView.render().$el);	
	}
});