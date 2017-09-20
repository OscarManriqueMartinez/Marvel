//
//  AlertFactory.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import UIKit

class AlertFactory {
    
    static func alert(error: String) -> UIAlertController {
        
        let alert: UIAlertController = UIAlertController(title: "error.title".localized, message: error.localized, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "ok".localized, style: UIAlertActionStyle.cancel, handler: nil))
        
        return alert
    }
    
}
