DR.Views.DishTypeDishesView = Backbone.View.extend({
  tagName: "ul",

  render: function () {
    var that = this;

    that.model.get("dishes").fetch({
      success: function () {

        var renderedContent = JST["dish_types/dishes"]({
          dishes: that.model.get("dishes")
        });

        that.$el.html(renderedContent);
      }
    });

    return that;
  }
});