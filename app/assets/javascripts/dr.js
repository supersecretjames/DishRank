window.DR = {
	Models: {},
	Collections: {},
	Views: {},
	Routers: {},
	Store: {},

	initialize: function ($navbar, $content, dishTypes, dishes, restaurants){
    DR.Store.DishTypes = new DR.Collections.DishTypes(dishTypes);
    DR.Store.Dishes = new DR.Collections.Dishes(dishes);
    DR.Store.Restaurants = new DR.Collections.Restaurants(restaurants);

		new DR.Routers.DishTypesRouter($navbar, $content);
		Backbone.history.start();
	}
};