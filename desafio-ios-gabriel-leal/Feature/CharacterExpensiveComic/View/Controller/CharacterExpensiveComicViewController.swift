//
//  CharacterExpensiveComicViewController.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 05/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class CharacterExpensiveComicViewController: UIViewController {
    
    //****************************************************************
    //MARK: Private Properties
    //****************************************************************
    
    @IBOutlet var tableView: UITableView!
    
    //****************************************************************
    //MARK: Public Properties
    //****************************************************************
    
    var viewModel: CharacterExpensiveComicViewModel! = nil
    
    //****************************************************************
    //MARK: Life Cicle
    //****************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setDelegates()
    }
    
    //****************************************************************
    //MARK: Private Methods
    //****************************************************************
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerNibs() {
        let nib = UINib(nibName: "CharacterExpensiveComicCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CharacterExpensiveComicCell")
    }
}

//****************************************************************
//MARK: TableView DataSource/Delegate
//****************************************************************

extension CharacterExpensiveComicViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterExpensiveComicCell", for: indexPath) as! CharacterExpensiveComicTableViewCell
        cell.setupViewModel(model: viewModel.expensiveComic, service: Services())
        return cell
    }
}

//****************************************************************
//MARK: StatusBar
//****************************************************************

extension CharacterExpensiveComicViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
             return .lightContent
       }
}
