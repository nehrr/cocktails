//
//  RecipeTableViewCell.swift
//  cocktails
//
//  Created by Ernoul on 07/06/2018.
//  Copyright © 2018 Ernoul. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var glassName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withCocktail cocktail: Cocktail) {
        if let image = cocktail.image, let name = cocktail.name, let glass = cocktail.glassType{
            self.picture.sd_setImage(with: URL(string: image))
            self.drinkName.text = name
            self.glassName.text = glass
        }
    }

}
