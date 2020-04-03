//
//  CharacterListCollectionViewCell.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 03/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class CharacterListCollectionViewCell: UICollectionViewCell {
    
    //****************************************************************
    //MARK: Private Properties
    //****************************************************************
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    
    private var viewModel: CharacterListCellViewModel!
    
    //****************************************************************
    //MARK: Life Cicle
    //****************************************************************
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.image = nil
    }
    
    //****************************************************************
    //MARK: Public Methods
    //****************************************************************
    
    func setupViewModel(viewModel: CharacterListCellViewModel) {
        self.viewModel = viewModel
        config()
    }
    
    //****************************************************************
    //MARK: Private Methods
    //****************************************************************
    
    private func config() {
        nameLabel.text = viewModel.characterName
        viewModel.fetchImage { image in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
}
