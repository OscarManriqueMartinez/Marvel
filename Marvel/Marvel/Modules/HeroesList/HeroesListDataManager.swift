//
//  HeroesListDataManager.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


protocol HeroesListDataManagerProtocol: class {
    
    /**
     * Add here your methods for communication INTERACTOR -> DATA_MANAGER
     */
    
    func getHeroes(success: @escaping ([Hero]) -> Void, failure: @escaping (BaseError) -> Void)

}


class HeroesListDataManager: HeroesListDataManagerProtocol {
    
    // MARK: - Properties
    
    private var apiClient: HeroesListAPIClientProtocol?
    private var heroes: [Hero]?
    
    
    // MARK: - Object lifecycle
    
    init(apiClient: HeroesListAPIClientProtocol) {
        
        self.apiClient = apiClient
    }
    
    
    // MARK: - HeroesListDataManagerProtocol
    
    func getHeroes(success: @escaping ([Hero]) -> Void, failure: @escaping (BaseError) -> Void) {
        
        
        if let heroesList = heroes {
            success(heroesList)
            
        }else {
            
            apiClient?.getHeroes(success: { heroesList in
                
                if let list = heroesList.superheroes {
                    self.heroes = list
                    success(list)
                }else{
                    failure(BaseError.generic)
                }
                
            },failure: {error in
                failure(error)
            })
        }
    }
}






