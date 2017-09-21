//
//  HeroDetailViewController.swift
//  Marvel
//
//  Created by Óscar Manrique on 21/9/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit


protocol HeroDetailViewControllerProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: HeroDetailPresenterProtocol)
}


class HeroDetailViewController: UIViewController, HeroDetailViewControllerProtocol {
  
    // MARK: - Properties
    
    private var presenter: HeroDetailPresenterProtocol?
    
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    // MARK: - HeroDetailViewProtocol
    
    func set(presenter: HeroDetailPresenterProtocol) {
        
        self.presenter = presenter
    }
}
