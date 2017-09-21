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
}

protocol HeroDetailInteractorOutputProtocol: class {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
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
    
    
    
    // MARK: - HeroDetailInteractorOutputProtocol
    
    
}
