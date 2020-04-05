//
//  CharacterListViewController.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 03/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    //****************************************************************
    // MARK: Private Properties
    //****************************************************************
    
    @IBOutlet private var collectionView: UICollectionView!
    private var viewModel: CharacterListViewModel! = nil
    @IBOutlet var titleView: UIView!
    @IBOutlet var titleViewHeight: NSLayoutConstraint!
    @IBOutlet var titleViewTopConstraint: NSLayoutConstraint!
    //****************************************************************
    // MARK: Life Cycle
    //****************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setCollectionViewCellsLayout()
        registerNibs()
        setupViewModel()
        configNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hideNavBar()
    }
    
    //****************************************************************
    // MARK: Private Methods
    //****************************************************************
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setCollectionViewCellsLayout() {
        let screen = UIScreen.main.bounds
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 8, bottom: 10, right: 8)
        layout.itemSize = CGSize(width: screen.width/2.15, height: screen.height/3.0)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
    }
    
    private func registerNibs() {
        let nib = UINib(nibName: "CharacterListCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CharacterListCollectionViewCell")
    }
    
    private func setupViewModel() {
        viewModel = CharacterListViewModel(service: Services())
        
        viewModel.reload = {
            self.collectionView.reloadData()
        }
    }
    
    private func runTitleUpAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.titleView.alpha = 1
            self.titleViewTopConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    private func runTitleDownAnimation() {
        
        UIView.animate(withDuration: 0.5) {
            self.titleView.alpha = 0
            self.titleViewTopConstraint.constant = -self.titleViewHeight.constant
            self.view.layoutIfNeeded()
        }
    }
    
    private func configNavBar() {
        navigationController?.navigationBar.tintColor = UIColor.red
        let backItem = UIBarButtonItem()
        backItem.title = StaticStrings.kBackButtonTitle
        navigationItem.backBarButtonItem = backItem
    }
}

//****************************************************************
//MARK: Collection VIEW DATA SOURCE
//****************************************************************

extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.charactersCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterListCollectionViewCell", for: indexPath) as! CharacterListCollectionViewCell
        let index = indexPath.row
        let character = viewModel.model[index]
        let viewModel = CharacterListCellViewModel(model: character, service: Services())
        cell.setupViewModel(viewModel: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.charactersCount - 1 {
            viewModel.fetchNextPage()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        let character = viewModel.model[index]
        let viewModel = CharacterDetailsViewModel(model: character, service: Services())
        Router.pushCharacterDetailsViewController(viewModel: viewModel, navigationController: navigationController)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pan = scrollView.panGestureRecognizer
        let velocity = pan.velocity(in: collectionView).y
        
        if velocity < -5 {
            runTitleDownAnimation()
        } else if velocity > 5 {
            runTitleUpAnimation()
        }
    }
}
