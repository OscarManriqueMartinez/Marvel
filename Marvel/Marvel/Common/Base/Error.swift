//
//  Error.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import Foundation

enum BaseError: Error {
    case generic
    
    func description() -> String {
        
        var description: String = ""
        
        switch self {
        case .generic: description = "error.generic".localized
        }
        
        return description
    }
    
}
