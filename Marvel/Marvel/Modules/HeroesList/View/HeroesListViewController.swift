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
    
    func show(heroes:[HeroViewModel])
    
    func show(error: String)
}


class HeroesListViewController: UIViewController, HeroesListViewControllerProtocol, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
    // MARK: - Properties
    
    private var presenter: HeroesListPresenterProtocol?
    private var heroes:[HeroViewModel]?
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        presenter?.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    // MARK: - HeroesListViewProtocol
    
    func set(presenter: HeroesListPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    func show(heroes:[HeroViewModel]) {
        
        self.heroes = heroes
        collectionView.reloadData()
    }
    
    func show(error: String){
        
        self.present(AlertFactory.alert(error: error), animated: true, completion: nil)
    }
    
    
    // MARK: - Private method
    
    func configView() {
        
        collectionView.register(UINib(nibName: Constants.heroesCellNibName, bundle: nil), forCellWithReuseIdentifier: Constants.heroesReuseIdentifier)
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let count = self.heroes?.count else {
            return 0
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.heroesReuseIdentifier, for: indexPath) as! HeroesCollectionViewCell
        
        if let viewModel = self.heroes?[indexPath.row] {
            cell.config(viewModel: viewModel)
        }
        
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 180);
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        presenter?.tap(positionCell:indexPath.row)
    }

}
