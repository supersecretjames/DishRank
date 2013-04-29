DR.Models.Restaurant = Backbone.RelationalModel.extend({
	urlRoot: '/restaurant',
	
	relations:[{
    type: Backbone.HasMany,
    key: "dishes",
    relatedModel: "DR.Models.Dish",
    collectionType: "DR.Collections.DishTypeDishes",

    reverseRelation: {
      key: "restaurant",
      keySource: "restaurant_id",
      includeInJSON: "id"
    } 
  }],

});