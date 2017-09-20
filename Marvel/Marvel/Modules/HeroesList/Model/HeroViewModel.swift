//
//  HeroViewModel.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import Foundation

struct HeroViewModel {
    
    
    let name:String
    let imageURL:URL?
    
    
    init(hero:Hero) {
        
        if let name = hero.name{
            self.name = name
        }else{
            name = ""
        }
        
        if let imageURL = hero.photo{
            self.imageURL = URL(string: imageURL)
        }else{
            self.imageURL = URL(string:"")
        }
    }
}
