//
//  TitleLabel.swift
//  Marvel
//
//  Created by Óscar Manrique on 21/9/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.textColor = UIColor.white
    }

}
