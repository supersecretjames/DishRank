window.DR = {
	Models: {},
	Collections: {},
	Views: {},
	Routers: {},

	initialize: function ($navbar, $content, allDishTypes){
		dishTypes = new DR.Collections.DishTypes(allDishTypes);

		new DR.Routers.DishTypesRouter($navbar, $content, dishtypes);
		Backbone.history.start();
	}
};