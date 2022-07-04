//
//  DetailViewController.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 29/06/22.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableViewCell: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedCategories: [Categories] = []
    var result: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCell.dataSource = self
        tableViewCell.delegate = self
        
        tableViewCell.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        searchBar.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell
        cell.textLabel?.text = selectedCategories[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        selectedCategories = selectedCategories.filter({ (category) -> Bool in
            return category.name.lowercased().contains(searchText.lowercased())
        })
        tableViewCell.reloadData()
    }
    
}
