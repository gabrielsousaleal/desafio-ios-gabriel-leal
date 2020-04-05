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
    private var navigationController: UINavigationController?
    
    //****************************************************************
    //MARK: Life Cicle
    //****************************************************************
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //****************************************************************
    //MARK: Public Methods
    //****************************************************************
    
    func config(characterDescription: String, characterName: String, id: String, service: ServicesProtocol, navigationController: UINavigationController?) {
        self.characterName = characterName
        self.id = id
        characterDescriptionLabel.text = characterDescription
        characterNameLabel.text = characterName
        self.navigationController = navigationController
        viewModel = CharacterTableViewCellViewModel(id: id, service: service)
    }
}

//****************************************************************
//MARK: Xib Actions
//****************************************************************

extension CharacterTableViewCell {
    @IBAction func expensiveButtonAction(_ sender: Any) {
        viewModel.getComics(success: { comics in
            let viewModel = CharacterExpensiveComicViewModel(model: comics)
            if comics.count == 0 {
                Router.showAlert(title: "Ops!", message: "Esse personagem não tem nenhuma HQ", navigationController: self.navigationController)
                return
            }
            Router.pushCharacterExpensiveComicViewController(viewModel: viewModel, navigationController: self.navigationController)
        }, failure: { error in
            print(error)
        })
    }
}
