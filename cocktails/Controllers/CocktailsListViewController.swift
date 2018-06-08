//
//  ViewController.swift
//  cocktails
//
//  Created by Ernoul on 07/06/2018.
//  Copyright © 2018 Ernoul. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class CocktailsListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var cocktails = [Cocktail]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CocktailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CocktailTableViewCell
        let aCocktail = cocktails[indexPath.row]
        cell.configure(withCocktail: aCocktail)

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        
    }
    
    func getData() {
        Alamofire.request("https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail").responseJSON { response in
            
            switch response.result {
                
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    for cocktail in json["drinks"].arrayValue {
                        self.cocktails.append(Cocktail(cocktail))
                    }
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let destination = segue.destination as? DetailsViewController, let indexPath = tableView.indexPathForSelectedRow {
                destination.cocktail = cocktails[indexPath.row]
            }
        }
    }
    
    
}

