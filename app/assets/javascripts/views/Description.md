Use cases:
Display a list of restaurants within "two miles" of "160 Folsom St. San Francisco, CA" that all serve "fish tacos". Under each restaurant name, list out the fish taco entree names with photo and price. Restaurant list will be ordered by dish ranking. Also display restaurant locations on a minimap.

Users can create a review individual restaurant dishes by uploading a photo and a numerical score. The user will be able to dynamically add or remove dishes to review multiple dishes from the same restaurant using the same form (dishes will be nested under restaurants). 

Administrators/SuperUsers will be able to add restaurants, dishes, and dish_types. Users will only be able to create reviews of dishes already in the database.  

Description:
A restaurant has a name and location information.

A dish has a name, a price, a restaurant_id and a dish_type_id. 

A dish_type is similar to a tag that will allow the application to group similar dishes together. For example, "Fish Taco" could be a dish_type. The regular fish taco and deluxe fish taco from Rubio's would have different dish_id numbers but would share the same dish_type.

A review will consist of a photo, a numerical score, a dish_id, and the user_id of the reviewer. 

Users will be able to upvote other reviews (Good Photo, Rating should be higher/lower).These votes will be tracked in a review_votes table.

A user has a name, an email address, and a password digest or whatever devise uses. 

A user can save favorite dish_types. The application will email them a monthly newsletter with local and national dish rankings for their favorite dish types.

The dish ranking will not be as simple as average review score. The app will maintain an internal ranking for each dish within a dish_type by observing how users score dishes of the same dish_type. Collaborative filtering.
