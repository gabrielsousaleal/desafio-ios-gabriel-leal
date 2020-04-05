//
//  tableViewTableViewCell.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 04/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    //****************************************************************
    //MARK: Private Properties
    //****************************************************************

    @IBOutlet var characterNameLabel: UILabel!
    @IBOutlet var characterDescriptionLabel: UILabel!
    @IBOutlet var expensiveButton: UIButton!
    
    private var viewModel: CharacterTableViewCellViewModel!
    private var id: String!
    private var characterName: String!
    
    //****************************************************************
    //MARK: Life Cicle
    //****************************************************************
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //****************************************************************
    //MARK: Public Methods
    //****************************************************************
    
    func config(characterDescription: String, characterName: String, id: String, service: ServicesProtocol) {
        self.characterName = characterName
        self.id = id
        characterDescriptionLabel.text = characterDescription
        characterNameLabel.text = characterName
        viewModel = CharacterTableViewCellViewModel(id: id, service: service)
    }
}

//****************************************************************
//MARK: Xib Actions
//****************************************************************

extension CharacterTableViewCell {
    @IBAction func expensiveButtonAction(_ sender: Any) {
        viewModel.getComics(success: { comics in
            print(comics)
        }, failure: { error in
            print(error)
        })
    }
}
