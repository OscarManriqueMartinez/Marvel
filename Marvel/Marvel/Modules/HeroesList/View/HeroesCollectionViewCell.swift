//
//  HeroesCollectionViewCell.swift
//  DemoMarvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class HeroesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var content: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
        self.backgroundColor = UIColor.clear
        
        content.layer.cornerRadius = 10
        content.layer.masksToBounds = true
        
        titleLabel.adjustsFontSizeToFitWidth = true
    }

    
    // MARK: - Public method
    
    func config(viewModel: HeroViewModel) {
    
        self.titleLabel.text = viewModel.name
        
        if let url = viewModel.imageURL {
            imageView.af_setImage(withURL: url, placeholderImage:#imageLiteral(resourceName: "placeholder"))
        }
    }
}
