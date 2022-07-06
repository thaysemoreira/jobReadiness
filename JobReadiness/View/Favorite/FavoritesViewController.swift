//
//  FavoritesViewController.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 06/07/22.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, InitialViewModelDelegate {
    
    @IBOutlet weak var tableViewCell: UITableView!
    
    private lazy var resultViewModel = InitialViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCell.dataSource = self
        tableViewCell.delegate = self
        tableViewCell.register(UINib(nibName: "FavoriteTableViewCell", bundle: nil), forCellReuseIdentifier: "favorite")
        
    }
    
    @IBAction func closefavorites(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let defaults = UserDefaults.standard
        let favorites = defaults.stringArray(forKey: "SalvedFavorites") ?? [String]()
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "favorite", for: indexPath) as! FavoriteTableViewCell
        cell.favoriteTitleLabel.text = resultViewModel.itemMultiget[indexPath.row].title
        return cell
    }
    
    func reloadTableViewData() {
        tableViewCell.reloadData()
    }
    
}
