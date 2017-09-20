//
//  HeroesListAPIClient.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper


protocol HeroesListAPIClientProtocol: class {
    
    /**
     * Add here your methods for communication DATA_MANAGER -> API_CLIENT
     */
    
    func getHeroes(success: @escaping (Heroes) -> Void, failure: @escaping (BaseError) -> Void)

}


class HeroesListAPIClient: BaseAPIClient, HeroesListAPIClientProtocol {
    
    // MARK: - HeroesListAPIClientProtocol
    
    func getHeroes(success: @escaping (Heroes) -> Void, failure: @escaping (BaseError) -> Void) {
        
        request(Constants.subpathHeroes).responseObject { (response: DataResponse<Heroes>) in
            
            if response.result.isFailure {
                return failure(BaseError.generic)
                
            }else{
                guard let heroes = response.result.value else{
                    failure(BaseError.generic)
                    return
                }
                
                success(heroes)
            }
        }
    }
}






