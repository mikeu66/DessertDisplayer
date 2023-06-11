# DessertDisplayer
Pulls data for desserts from the MealDB API and displays it on the app

Specs:
Built on Xcode 14.3.1 to run on iOS 16.5
Tested on Iphone 14 pro simulator and Iphone 12(iOS-16.5)

Instructions:
Build the project in Xcode 14.3

Upon launch user will be brought to a table view with a list of desserts pulled from theMealDB API.

Select a dessert and it will segue to a page that displays an image of the dessert along with the ingredients and measurments for the ingredients.

An instructions button in the top right corner segues to a view that contains the instructions for the given meal.

Tests for the API requests are contained on DessertDisplayerTests. They test the function to retrieve the list of desserts and the function to retrieve the details of the dessert from a given ID.
