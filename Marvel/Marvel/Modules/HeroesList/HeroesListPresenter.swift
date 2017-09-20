//
//  HeroesListPresenter.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


protocol HeroesListPresenterProtocol: class {
    
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    
    func loadData()
}

protocol HeroesListInteractorOutputProtocol: class {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}


class HeroesListPresenter: HeroesListPresenterProtocol, HeroesListInteractorOutputProtocol {
    
    // MARK: - Properties
    
    private weak var view: HeroesListViewControllerProtocol?
    private var interactor: HeroesListInteractorInputProtocol?
    
//    Wireframe of the next view
//    private var wireframe: NextViewWireframeProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(view: HeroesListViewControllerProtocol, interactor: HeroesListInteractorInputProtocol) {
        
        self.view = view
        self.interactor = interactor
    }
    
    
    // MARK: - HeroesListPresenterProtocol
    
    func loadData() {
        
        interactor?.loadData()
    }
    
    
    // MARK: - HeroesListInteractorOutputProtocol
    
    
}
