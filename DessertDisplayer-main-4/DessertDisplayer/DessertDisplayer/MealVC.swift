//
//  MealVC.swift
//  DessertDisplayer
//
//  Created by Michael  Walter on 6/6/23.
//

import Foundation
import UIKit

class MealVC: UIViewController{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var mealImage: UIImageView!
    var imageTestLogger = q()
    var mealName = String()
    var mealIndex = Int()
    var mealID = String()
    var instructions = ""
    var totalIngredients = [IngredientDetails]()
    var unfilteredIngredientList = Array<String?>()
    var filteredIngredientList = Array<String>()
    var unfilteredMeasures = Array<String?>()
    var filteredMeasures = Array<String>()
    
    
    
    override func viewDidLoad() {
        nameLabel.text = self.mealName
        nameLabel.textAlignment = .center
        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .center
        
        // Setup the MealVC once the details are recieved
        let detailsFunction = { (fetchedDetails: [MealDetails]) in
            DispatchQueue.main.async{
                self.setUpMealVC(fetchedDetails: fetchedDetails)
            }
        }
        TheMealAPI.shared.fetchDetails(id: self.mealID, onCompletion: detailsFunction)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InstructionSegue",
           let destination = segue.destination as? InstructionVC{
            destination.instructions = instructions
        }
    }
    
    
    //Pulls the image for the meal from specified URL and updates imageview with it
    func fetchImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                let newImage = UIImage(data: data)
            else {
                print("couldn't load image from url: \(url)")
                return
            }
            DispatchQueue.main.async {
                self.mealImage.image = newImage
            }
        }
        task.resume()
    }
    
    func fetchImageTest(from url: URL){
        print("doing something")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                let newImage = UIImage(data: data)
            else {
                print("couldn't load image from url: \(url)")
                self.imageTestLogger = "Failed"
                print(self.imageTestLogger)
                return
            }
            DispatchQueue.main.async {
                self.mealImage.image = newImage
//                self.imageTestLogger = "Success"
//                print(self.imageTestLogger)
                
            }
        }
        
        task.resume()
    }

    
    //Removes all nil and empty values from the measures list and adds them to a new list
    func addMeasure(ingredients: [String], fetchedDetails: [MealDetails]){
        unfilteredMeasures.append(fetchedDetails[0].strMeasure1)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure2)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure3)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure4)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure5)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure6)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure7)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure8)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure9)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure10)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure11)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure12)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure13)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure14)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure15)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure16)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure17)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure18)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure19)
        unfilteredMeasures.append(fetchedDetails[0].strMeasure20)
        self.filteredMeasures = unfilteredMeasures.compactMap{ str in str }
        self.filteredMeasures = self.filteredMeasures.filter{$0.count >= 1 }

        }
    
    //Removes all nil and empty values from the Ingredient list and adds them to a new list
    func addIngredientList(fetchedDetails: [MealDetails]) {
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient1)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient2)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient3)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient4)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient5)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient6)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient7)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient8)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient9)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient10)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient11)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient12)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient13)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient14)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient15)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient16)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient17)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient18)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient19)
        unfilteredIngredientList.append(fetchedDetails[0].strIngredient20)
        self.filteredIngredientList = unfilteredIngredientList.compactMap{ str in str }
        self.filteredIngredientList = self.filteredIngredientList.filter{$0.count > 1 }
    }
    
    //Takes the filtered Measures list and filtered Ingredient list and adds them to Detaillabel
    // Also restructed the data into a ingredientDetail struct for future use
    func loadIngredientDetails() {
            for i in 0...self.filteredIngredientList.count-1{
                totalIngredients.append(IngredientDetails(measure: self.filteredMeasures[i], ingredient: self.filteredIngredientList[i]))
                self.detailLabel.text! += self.filteredMeasures[i] + " " + self.filteredIngredientList[i] + "\n"
            }
    }
    
    //Takes the retrieved meal details and adds to the MealVC page
    func setUpMealVC(fetchedDetails: [MealDetails]){
        //updates instructions page
        self.instructions = fetchedDetails[0].strInstructions
        //fetches image and adds it to the mealImage Imageview
        self.fetchImage(from: URL(string: fetchedDetails[0].strMealThumb)!)
        //filters empty values from ingredients
        self.addIngredientList(fetchedDetails: fetchedDetails)
        //filters empty values from measurements
        self.addMeasure(ingredients: self.filteredIngredientList, fetchedDetails: fetchedDetails)
        //updates the MealVC with the values above
        self.loadIngredientDetails()
    }
}
