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
    
    //****************************************************************
    // MARK: Life Cycle
    //****************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setCollectionViewCellsLayout()
        let nib = UINib(nibName: "CharacterListCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CharacterListCollectionViewCell")
        // Do any additional setup after loading the view.
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
        layout.itemSize = CGSize(width: screen.width/2.15, height: screen.height/2.65)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
    }
}

extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterListCollectionViewCell", for: indexPath) as! CharacterListCollectionViewCell
        return cell
    }
    
    
}


