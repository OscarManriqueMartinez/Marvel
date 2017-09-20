//
//  HeroesListInteractor.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


protocol HeroesListInteractorInputProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    
    func set(presenter: HeroesListInteractorOutputProtocol)
}


class HeroesListInteractor: HeroesListInteractorInputProtocol {
    
    // MARK: - Properties
    
    private weak var presenter: HeroesListInteractorOutputProtocol?
    private var dataManager: HeroesListDataManagerProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(dataManager: HeroesListDataManagerProtocol) {
        
        self.dataManager = dataManager
    }

    
    // MARK: - HeroesListInteractorInputProtocol
    
    func set(presenter: HeroesListInteractorOutputProtocol) {
        
        self.presenter = presenter
    }
}
