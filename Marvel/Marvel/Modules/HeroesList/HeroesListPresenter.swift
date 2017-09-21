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
    
    func tap(positionCell:Int)
}

protocol HeroesListInteractorOutputProtocol: class {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    
    func show(heroes:[Hero])
    
    func show(error:BaseError)
}


class HeroesListPresenter: HeroesListPresenterProtocol, HeroesListInteractorOutputProtocol {
    
    // MARK: - Properties
    
    private weak var view: HeroesListViewControllerProtocol?
    private var interactor: HeroesListInteractorInputProtocol?
    private var wireframe: HeroDetailWireframeProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(view: HeroesListViewControllerProtocol, interactor: HeroesListInteractorInputProtocol, wireframe:HeroDetailWireframe) {
        
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    
    // MARK: - HeroesListPresenterProtocol
    
    func loadData() {
        
        interactor?.loadData()
    }
    
    func tap(positionCell:Int) {
        
        if let hero = interactor?.getHero(position:positionCell) {
            wireframe?.present(hero: hero)
        }
    }
    
    
    // MARK: - HeroesListInteractorOutputProtocol
    
    func show(heroes:[Hero]) {
        
        var heroViewModel:[HeroViewModel] = []
        
        for hero in heroes{
            heroViewModel.append(HeroViewModel(hero: hero))
        }
        
        view?.show(heroes:heroViewModel)
    }
    
    func show(error:BaseError) {
        
        view?.show(error: error.description())
    }
}
