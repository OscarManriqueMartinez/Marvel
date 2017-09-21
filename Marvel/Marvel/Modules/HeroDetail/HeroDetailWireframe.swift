//
//  HeroDetailWireframe.swift
//  Marvel
//
//  Created by Óscar Manrique on 21/9/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit


protocol HeroDetailWireframeProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
    func present(hero: Hero)
}


class HeroDetailWireframe: HeroDetailWireframeProtocol {
    
    // MARK: - Properties
    
    private var viewController: HeroDetailViewController {
        
        // Generating module components
        let viewController: HeroDetailViewController = HeroDetailViewController(nibName: "HeroDetailView", bundle: nil)
        let interactor: HeroDetailInteractor = createInteractor()
        let presenter: HeroDetailPresenter = createPresenter(with: viewController, interactor: interactor)
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        return viewController
    }
    
    
    // MARK: - Private methods
    
    private func createInteractor() -> HeroDetailInteractor {
        return HeroDetailInteractor()
    }
    
    private func createPresenter(with view: HeroDetailViewController, interactor: HeroDetailInteractor ) -> HeroDetailPresenter {
        return HeroDetailPresenter(view: view, interactor: interactor)
    }
    
    
    // MARK: - HeroDetailWireframeProtocol
    
    func present(hero: Hero){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let window = appDelegate.window
        let nav : UINavigationController = window!.rootViewController as! UINavigationController
        nav.pushViewController(viewController, animated: true)
    }
}






