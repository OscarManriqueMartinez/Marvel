//
//  HeroDetailInteractor.swift
//  Marvel
//
//  Created by Óscar Manrique on 21/9/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


protocol HeroDetailInteractorInputProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    
    func set(presenter: HeroDetailInteractorOutputProtocol)
}


class HeroDetailInteractor: HeroDetailInteractorInputProtocol {
    
    // MARK: - Properties
    
    private weak var presenter: HeroDetailInteractorOutputProtocol?
    
    
    // MARK: - HeroDetailInteractorInputProtocol
    
    func set(presenter: HeroDetailInteractorOutputProtocol) {
        
        self.presenter = presenter
    }
    
}
