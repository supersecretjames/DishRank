DR.Models.DishType = Backbone.RelationalModel.extend({
	schema: {
		name: "Text"
	},

  urlRoot: "/dish_type",
  relations:[{
    type: Backbone.HasMany,
    key: "dishes",
    relatedModel: "DR.Models.Dish",
    collectionType: "DR.Collections.DishTypeDishes",

    reverseRelation: {
      key: "dishType",
      keySource: "dish_type_id",
      includeInJSON: "id"
    }
  },
  
  {
    type: Backbone.HasMany,
    key: "restaurants",
    relatedModel: "DR.Models.Restaurant",
    collectionType: "DR.Collections.DishTypeRestaurants",

    reverseRelation: {
      key: "dishType",
      keySource: "dish_type_id",
      includeInJSON: "id"
    }
  }

  ]


});