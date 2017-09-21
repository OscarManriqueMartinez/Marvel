//
//  HeroesListWireframe.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit


class HeroesListWireframe {
    
    // MARK: - Properties
    
    var viewController: HeroesListViewController {
        
        // Generating module components
        let viewController: HeroesListViewController = HeroesListViewController(nibName: "HeroesListView", bundle: nil)
        let interactor: HeroesListInteractor = createInteractor(with: dataManager)
        let presenter: HeroesListPresenter = createPresenter(with: viewController, interactor: interactor, wireframe:detailWireframe)
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        return viewController
    }
    
//    private var apiClient: HeroesListAPIClient{
//        return HeroesListAPIClient()
//    }
    
    private var dataManager: HeroesListDataManager
//    private var dataManager: HeroesListDataManager{
//        return HeroesListDataManager(apiClient: apiClient, heroes: nil)
//    }
    
    private var detailWireframe: HeroDetailWireframe{
        return HeroDetailWireframe()
    }
    
    
    // MARK: - Private methods
    
    private func createInteractor(with dataManager: HeroesListDataManagerProtocol) -> HeroesListInteractor {
        return HeroesListInteractor(dataManager: dataManager)
    }
    
    private func createPresenter(with view: HeroesListViewController, interactor: HeroesListInteractor, wireframe:HeroDetailWireframe) -> HeroesListPresenter {
        return HeroesListPresenter(view: view, interactor: interactor, wireframe:detailWireframe)
    }
    
    init(dataManager: HeroesListDataManager) {
        self.dataManager = dataManager
    }
}






