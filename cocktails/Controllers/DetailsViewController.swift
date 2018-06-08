//
//  DetailsViewController.swift
//  cocktails
//
//  Created by Ernoul on 07/06/2018.
//  Copyright © 2018 Ernoul. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class DetailsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cocktail: Cocktail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getData()
        navigationItem.title = self.cocktail?.name
    }
    
    func getData() {
        if let id = self.cocktail?.id {
            let url: String = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(id)"
            print(url)
            Alamofire.request(url).responseJSON { response in
                
                switch response.result {
                    
                case .success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        for recipe in json["drinks"].arrayValue {
                            self.cocktail?.update(recipe)
                        }
                    }
                    self.tableView.reloadData()
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
            
        case 1:
            return cocktail?.ingredients.count ?? 0
            
        case 2:
            return 1
            
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            let cell: RecipeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "aCocktail", for: indexPath) as! RecipeTableViewCell
            if let myRecipe = cocktail {
                cell.configure(withCocktail: myRecipe)
            }
            return cell
            
        case 1:
            let cell: IngredientsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myIngredients", for: indexPath) as! IngredientsTableViewCell
            if let myRecipe = cocktail?.ingredients[indexPath.row] {
                cell.configure(withTuple: myRecipe)
                
            }
            return cell
            
        case 2:
            let cell: InstructionsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myInstructions", for: indexPath) as! InstructionsTableViewCell
            if let myRecipe = cocktail {
                cell.configure(withCocktail: myRecipe)
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
            
        case 1:
            return "Ingredients"
            
        case 2:
            return "Instructions"
            
        default:
            return ""
        }
    }
    
}
