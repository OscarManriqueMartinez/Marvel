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
}


class HeroesListDataManager: HeroesListDataManagerProtocol {
    
    // MARK: - Properties
    
    private var apiClient: HeroesListAPIClientProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(apiClient: HeroesListAPIClientProtocol) {
        
        self.apiClient = apiClient
    }
    
    
    // MARK: - HeroesListDataManagerProtocol
}






