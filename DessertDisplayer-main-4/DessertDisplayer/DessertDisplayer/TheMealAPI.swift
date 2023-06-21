//
//  TheMealAPI.swift
//  DessertDisplayer
//
//  Created by Michael  Walter on 6/5/23.
//

import Foundation
import UIKit

final class TheMealAPI {
    
    static let shared = TheMealAPI()
    
    
    // function to retrieve list of desserts from the API and add them to the mealList variable on the MealListVC
    // takes a function as a parameter and returns a list of Meal objects: [Meal]
    func fetchMealList(urlString: String, onCompletion: @escaping ([Meal]) -> ()) {
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in
            
            guard let data = data else {
                print("data was nil")
                return
            }
            
            guard let mealList = try? JSONDecoder().decode(MealList.self, from: data) else {
                print("couldn't decode json")
                return
            }
            onCompletion(mealList.meals)
            //print(mealList.meals)
            
        }
        task.resume()
    }
    
    //function to retrieve the details of the meal from the mealID
    // parameters are the mealID as a String and a function to load the MealVC with the details retrieved
    func fetchDetails(id: String, onCompletion: @escaping ([MealDetails]) -> ()) {
        let urlString = "https://themealdb.com/api/json/v1/1/lookup.php?i="+id
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in
            
            guard let data = data else {
                print("data was nil")
                return
            }
            
            guard let singleMeal = try? JSONDecoder().decode(SingleMeal.self, from: data) else {
                print("couldn't decode json")
                return
            }
            onCompletion(singleMeal.meals)
            
        }
        task.resume()
    }
}

struct MealList: Codable {
    let meals: [Meal]
}
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct SingleMeal: Codable {
    let meals: [MealDetails]
}

struct MealDetails: Codable {
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
}


struct IngredientList: Codable {
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
}

struct MeasurementList: Codable {
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
}

struct IngredientDetails {
    let measure: String
    let ingredient: String
}


