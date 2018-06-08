//
//  IngredientsTableViewCell.swift
//  cocktails
//
//  Created by Ernoul on 08/06/2018.
//  Copyright © 2018 Ernoul. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ingredient: UILabel!
    @IBOutlet weak var measure: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(withTuple tuple: (String, String)) {
        self.ingredient.text = tuple.0
        self.measure.text = tuple.1
    }
    
}
