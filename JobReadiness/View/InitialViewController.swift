//
//  InitialViewController.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 29/06/22.
//

import UIKit

class InitialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, InitialViewModelDelegate {
    
    @IBOutlet weak var tableViewCell: UITableView!
    @IBOutlet weak var categoriesSearchBar: UISearchBar!
    
    private lazy var resultViewModel = InitialViewModel(delegate: self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCell.delegate =  self
        tableViewCell.dataSource = self
        tableViewCell.register(UINib(nibName: "InitialTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        categoriesSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultViewModel.loadItemsQuery(id: "camisa")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let result = resultViewModel.numberOfRows(section: section)
        return result
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InitialTableViewCell
        cell.titleItemLabel.text = resultViewModel.itemMultiget[indexPath.row].title
        cell.priceItemLabel?.text = "R$ \(resultViewModel.itemMultiget[indexPath.row].price)"
        cell.configure(url: resultViewModel.itemMultiget[indexPath.row].thumbnail)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let suggestionViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        self.navigationController?.pushViewController(suggestionViewController, animated: true)
    }
    
    func reloadTableViewData() {
        self.tableViewCell.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            
        }else {
            if categoriesSearchBar.selectedScopeButtonIndex == 0 {
                let result = searchText
                resultViewModel.loadItemsQuery(id: result)
            }
        }
    }
}
