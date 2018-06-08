//
//  Cocktail.swift
//  cocktails
//
//  Created by Ernoul on 07/06/2018.
//  Copyright © 2018 Ernoul. All rights reserved.
//

import UIKit
import SwiftyJSON

class Cocktail: NSObject {
    var id: Int?
    var name: String?
    var image: String?
    var glassType: String?
    var instructions: String?
    var ingredients: [(String, String)] = []
    
    init(_ json: JSON) {
        self.id = json["idDrink"].intValue
        self.name = json["strDrink"].stringValue
        self.image = json["strDrinkThumb"].stringValue
    }
    
    func update(_ json: JSON) {
        self.glassType = json["strGlass"].stringValue
        self.instructions = json["strInstructions"].stringValue
        
        for i in 1...15 {
            if (json["strIngredient\(i)"].stringValue != "" && json["strIngredient\(i)"].stringValue != " ") {
                self.ingredients.append(((json["strIngredient\(i)"].stringValue), json["strMeasure\(i)"].stringValue))
            }
        }
        print(self.ingredients)
    }
    
}
