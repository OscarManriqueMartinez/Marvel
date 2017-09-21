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
        
        
        let serverTrustPolicy: ServerTrustPolicy! = ServerTrustPolicy.pinCertificates(
            // Getting the certificate from the certificate data
            certificates: ServerTrustPolicy.certificates(),
            // Choose to validate the complete certificate chain, not only the certificate itself
            validateCertificateChain: true,
            // Check that the certificate mathes the host who provided it
            validateHost: true
        )
        
        let serverTrustPolicies: [String: ServerTrustPolicy]! = [
            "api.myjson.com": serverTrustPolicy!,
            ]
        
        self.sesionManager = SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        
//        self.sesionManager = SessionManager()
    }
    
    
    // MARK: - Requests
    
    func request(_ relativePath: String?,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil) -> DataRequest {
        
        let urlAbsolute = baseURL.appendingPathComponent(relativePath!)
        return sesionManager.request(urlAbsolute, method: method, parameters: parameters, encoding: URLEncoding.default)
    }
}
