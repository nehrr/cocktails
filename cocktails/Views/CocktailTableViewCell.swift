//
//  CocktailTableViewCell.swift
//  cocktails
//
//  Created by Ernoul on 07/06/2018.
//  Copyright © 2018 Ernoul. All rights reserved.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {
    
    //
    //  CocktailTableViewCell.swift
    //  cocktails
    //
    //  Created by Ernoul on 07/06/2018.
    //  Copyright © 2018 Ernoul. All rights reserved.
    //
    
    //@IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(withCocktail cocktail: Cocktail) {
        if let image = cocktail.image, let name = cocktail.name {
            self.picture.sd_setImage(with: URL(string: image))
            self.name.text = name
        }
    }
    
}
