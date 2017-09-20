//
//  BaseAPIClient.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import UIKit
import Alamofire


class BaseAPIClient {
    
    private var sesionManager : Alamofire.SessionManager!
    
    private var baseURL : URL {
        
        if let urlString = Enviroment().URLBase {
            if let url = URL(string: urlString) {
                return url
            }else {
                print("error.url.invalid".localized)
                return URL(string: "")!
            }
        }else{
            print("error.url.invalid".localized)
            return URL(string: "")!
        }
    }
    
    init() {
        
        self.sesionManager = SessionManager()
    }
    
    
    // MARK: - Requests
    
    func request(_ relativePath: String?,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil) -> DataRequest {
        
        let urlAbsolute = baseURL.appendingPathComponent(relativePath!)
        return sesionManager.request(urlAbsolute, method: method, parameters: parameters, encoding: URLEncoding.default)
    }
}
