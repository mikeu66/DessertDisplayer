//
//  ViewController.swift
//  DessertDisplayer
//
//  Created by Michael  Walter on 6/5/23.
//

import UIKit

class MealListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var mealList = [Meal]()
    let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        //function ran on completion of the fetchMealList function
        // adds the list of desserts to the local mealList variable and updates the tableview
        let MealListFunction = { (fetchedMealList: [Meal]) in
            DispatchQueue.main.async{
                self.mealList = fetchedMealList
                self.tableView.reloadData()
            }
        }
        // runs the function from TheMealAPI class to retrieve the list of meals and add it to the table
        TheMealAPI.shared.fetchMealList(urlString: urlString, onCompletion: MealListFunction)
        
        //set up tableview
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let meal = mealList[indexPath.row]
        cell.textLabel?.text = meal.strMeal
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MealSegueIdentifier", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MealSegueIdentifier",
           //passes the neccessary properties to the next viewcontroller
           let destination = segue.destination as? MealVC,
           let mealIndex = tableView.indexPathForSelectedRow?.row {
            destination.mealName = mealList[mealIndex].strMeal
            destination.mealIndex = mealIndex
            destination.mealID = mealList[mealIndex].idMeal
        }
    }

    


}

