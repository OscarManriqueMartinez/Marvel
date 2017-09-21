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
    
    func loadData()
}


class HeroDetailInteractor: HeroDetailInteractorInputProtocol {
    
    // MARK: - Properties
    
    private weak var presenter: HeroDetailInteractorOutputProtocol?
    private var hero: Hero?
    
    init(hero: Hero?) {
        
        self.hero = hero
    }
    
    
    // MARK: - HeroDetailInteractorInputProtocol
    
    func set(presenter: HeroDetailInteractorOutputProtocol) {
        
        self.presenter = presenter
    }
    
    func loadData() {
        
        if let currentHero = hero {
            presenter?.show(hero:currentHero)
        }
    }
}
