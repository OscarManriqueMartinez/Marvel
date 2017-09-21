//
//  HeroDetailPresenter.swift
//  Marvel
//
//  Created by Óscar Manrique on 21/9/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


protocol HeroDetailPresenterProtocol: class {
    
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    
    func loadData()
}

protocol HeroDetailInteractorOutputProtocol: class {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    
    func show(hero: Hero)
}


class HeroDetailPresenter: HeroDetailPresenterProtocol, HeroDetailInteractorOutputProtocol {
    
    // MARK: - Properties
    
    private weak var view: HeroDetailViewControllerProtocol?
    private var interactor: HeroDetailInteractorInputProtocol?
    
//    Wireframe of the next view
//    private var wireframe: NextViewWireframeProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(view: HeroDetailViewControllerProtocol, interactor: HeroDetailInteractorInputProtocol) {
        
        self.view = view
        self.interactor = interactor
    }
    
    
    // MARK: - HeroDetailPresenterProtocol
    
    func loadData() {
        
        interactor?.loadData()
    }
    
    // MARK: - HeroDetailInteractorOutputProtocol
    
    func show(hero: Hero) {
        
        view?.show(hero: hero)
    }
}
