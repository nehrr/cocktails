//
//  Constants.swift
//  cocktails
//
//  Created by Ernoul on 07/06/2018.
//  Copyright © 2018 Ernoul. All rights reserved.
//

import UIKit

extension String{
    func spaceRemovedURL() -> URL{
        let url = self.replacingOccurrences(of: " ", with: "%20")
        return URL(string: url)!
    }
}
