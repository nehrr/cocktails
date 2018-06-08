//
//  InstructionsTableViewCell.swift
//  cocktails
//
//  Created by Ernoul on 08/06/2018.
//  Copyright © 2018 Ernoul. All rights reserved.
//

import UIKit

class InstructionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var instructions: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withCocktail cocktail: Cocktail) {
        if let instructions = cocktail.instructions {
            self.instructions.text = instructions
        }
    }

}
