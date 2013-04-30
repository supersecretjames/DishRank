rest1 = Restaurant.create!(:name => 'El Farolito', 
													 :street => '2779 Mission St.', 
													 :city => 'San Francisco', 
													 :state => 'CA')

rest2 = Restaurant.create!(:name => 'Los Gallos', 
													 :street => '35232 Newark Blvd', 
													 :city => 'Newark', 
													 :state => 'CA')

rest3 = Restaurant.create!(:name => 'Rubios', 
													 :street => '4 Embarcadero Center', 
													 :city => 'San Francisco', 
													 :state => 'CA')

# user1 = User.create!({:name => 'James', :email => 'james@example.com' })
# user2 = User.create!({:name => 'Peter', :email => 'peter@example.com' })
# user3 = User.create!({:name => 'Dan', :email => 'dan@example.com' })

dtype1 = DishType.create!({:name => 'Fish Taco'})
dtype2 = DishType.create!({:name => 'Carne Asada Burrito'})
dtype3 = DishType.create!({:name => 'Ceviche'})

dish1 = Dish.create({:name => 'Regular Fish Taco', 
											:price => 3, 
											:restaurant_id => 1,
											:dish_type_id => 1,
											:description => 'Red snapper, onions'
											})

dish2 = Dish.create({:name => 'Deluxe Fish Taco', 
											:price => 4, 
											:restaurant_id => 1,
											:dish_type_id => 1,
											:description => 'fancy red snapper, onions, spicy sauce'
											})

dish3 = Dish.create({:name => 'Special Fish Taco', 
											:price => 5, 
											:restaurant_id => 2,
											:dish_type_id => 1,
											:description => 'Sea bass, caviar, onions'
											})

dish4 = Dish.create({:name => 'Fish Taco', 
											:price => 2, 
											:restaurant_id => 3,
											:dish_type_id => 1,
											:description => 'Tilapia, cilantro (booo!)'
											})

dish5 = Dish.create({:name => 'Super Fish Taco', 
											:price => 6, 
											:restaurant_id => 3,
											:dish_type_id => 1,
											:description => 'Breaded halibut, salsa'
											})

dish6 = Dish.create({:name => 'Regular Ceviche', 
											:price => 6, 
											:restaurant_id => 1,
											:dish_type_id => 3
											})

dish7 = Dish.create({:name => 'Super Ceviche', 
											:price => 9, 
											:restaurant_id => 1,
											:dish_type_id => 3
											})

dish8 = Dish.create({:name => 'Seafood Ceviche', 
											:price => 9, 
											:restaurant_id => 2,
											:dish_type_id => 3
											})

Review.create({:score => 5, :user_id => 1, :dish_id => 1})
Review.create({:score => 8, :user_id => 1, :dish_id => 2})
Review.create({:score => 10, :user_id => 1, :dish_id => 3})
Review.create({:score => 7, :user_id => 1, :dish_id => 4})
Review.create({:score => 5, :user_id => 1, :dish_id => 5})

Review.create({:score => 6, :user_id => 2, :dish_id => 1})
Review.create({:score => 9, :user_id => 2, :dish_id => 3})
Review.create({:score => 2, :user_id => 2, :dish_id => 4})
Review.create({:score => 6, :user_id => 2, :dish_id => 5})

Review.create({:score => 4, :user_id => 3, :dish_id => 2})
Review.create({:score => 7, :user_id => 3, :dish_id => 3})
Review.create({:score => 5, :user_id => 3, :dish_id => 4})
Review.create({:score => 9, :user_id => 3, :dish_id => 5})



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
