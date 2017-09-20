//
//  HeroesListViewController.swift
//  Marvel
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit


protocol HeroesListViewControllerProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: HeroesListPresenterProtocol)
}


class HeroesListViewController: UIViewController, HeroesListViewControllerProtocol {
  
    // MARK: - Properties
    
    private var presenter: HeroesListPresenterProtocol?
    
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - HeroesListViewProtocol
    
    func set(presenter: HeroesListPresenterProtocol) {
        
        self.presenter = presenter
    }
}
