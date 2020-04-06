//
//  CharacterDetailsViewController.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 04/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    //****************************************************************
    // MARK: - Private Properties
    //****************************************************************
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    //****************************************************************
    // MARK: - Public Properties
    //****************************************************************
    
    var viewModel: CharacterDetailsViewModel! = nil
    
    //****************************************************************
    // MARK: - Life Cicle
    //****************************************************************

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setDelegates()
        viewModel.fetchImage { image in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.showNavBar()
    }
    
    //****************************************************************
    // MARK: - Private Properties
    //****************************************************************
    
    private func registerNibs() {
        let nib = UINib(nibName: "CharacterTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CharacterTableViewCell")
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//****************************************************************
// MARK: - TableView DataSource / Delegate
//****************************************************************

extension CharacterDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as! CharacterTableViewCell
        cell.config(characterDescription: viewModel.description, characterName: viewModel.name, id: viewModel.characterId, service: Services(), navigationController: navigationController)
        return cell
    }
}
