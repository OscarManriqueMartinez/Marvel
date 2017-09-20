//
//  Enviroment.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import UIKit

struct Enviroment {
    
    var plistEnvitoment : Dictionary<String, Any>?
    var URLBase : String? {
        return plistEnvitoment?[Constants.keyURLBase] as! String?
    }
    
    init() {
        if let path = Bundle.main.path(forResource: Constants.nameFileEnviroment, ofType: Constants.typeFileEnviroment) {
            plistEnvitoment = NSDictionary(contentsOfFile: path) as? [String: AnyObject]
        }
    }
}
