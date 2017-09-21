//
//  HeroDetailViewController.swift
//  Marvel
//
//  Created by Óscar Manrique on 21/9/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit
import AlamofireImage


protocol HeroDetailViewControllerProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: HeroDetailPresenterProtocol)
    
    func show(hero: Hero)
}


class HeroDetailViewController: UIViewController, HeroDetailViewControllerProtocol {
  
    // MARK: - Properties
    
    private var presenter: HeroDetailPresenterProtocol?
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var realNameTitle: UILabel!
    @IBOutlet private weak var realNameValue: UILabel!
    @IBOutlet private weak var heightTitle: UILabel!
    @IBOutlet private weak var heightValue: UILabel!
    @IBOutlet private weak var powerTitle: UILabel!
    @IBOutlet private weak var powerValue: UILabel!
    @IBOutlet private weak var abilitiesTitle: UILabel!
    @IBOutlet private weak var abilitiesValue: UILabel!
    @IBOutlet private weak var groupsTitle: UILabel!
    @IBOutlet private weak var groupsValue: UILabel!
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadData()
        configView()
    }
    
    
    //MARK: - Private method
    
    func configView() {
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        self.automaticallyAdjustsScrollViewInsets = false
        
        realNameTitle.text = "realName".localized
        heightTitle.text = "height".localized
        powerTitle.text = "power".localized
        abilitiesTitle.text = "abilities".localized
        groupsTitle.text = "groups".localized
        
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.layer.masksToBounds = true
    }
    
    // MARK: - HeroDetailViewProtocol
    
    func set(presenter: HeroDetailPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    func show(hero: Hero) {
        
        self.title = hero.name
        
        realNameValue.text = hero.realName
        heightValue.text = hero.height
        powerValue.text = hero.power
        abilitiesValue.text = hero.abilities
        groupsValue.text = hero.groups
        
        if let url = URL(string: hero.photo!) {
            imageView.af_setImage(withURL: url, placeholderImage:#imageLiteral(resourceName: "placeholder"))
        }
    }
}
