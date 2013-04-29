DR.Collections.DishTypeRestaurants = Backbone.Collection.extend({
  model: DR.Models.DishType,

  initialize: function (models, options) {
    this.dishType = options.dishType;
  },

  url: function () {
    return "/dish_types/" + this.dishType.id + "/restaurants"
  }
});