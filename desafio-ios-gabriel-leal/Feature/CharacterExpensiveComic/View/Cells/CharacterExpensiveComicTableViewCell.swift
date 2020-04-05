//
//  CharacterExpensiveComicTableViewCell.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 05/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class CharacterExpensiveComicTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var thumbImageView: UIImageView!
    
    private var viewModel: CharacterExpensiveCellViewModel! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbImageView.image = UIImage.loadingCharacterImage()
    }

    func setupViewModel(model: CharacterComicsResult, service: ServicesProtocol) {
        viewModel = CharacterExpensiveCellViewModel(model: model, service: service)
        config()
    }
    
    func config() {
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        descriptionLabel.text = viewModel.description
        viewModel.fetchImage { image in
            self.thumbImageView.image = image
        }
    }
}
