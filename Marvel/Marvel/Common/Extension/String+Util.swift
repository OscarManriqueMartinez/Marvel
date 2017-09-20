//
//  String+Util.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import Foundation

public extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
