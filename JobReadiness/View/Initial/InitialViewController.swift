//
//  InitialViewController.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 29/06/22.
//

import UIKit

class InitialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, InitialViewModelDelegate, UITabBarDelegate {
    
    @IBOutlet weak private var tableViewCell: UITableView!
    @IBOutlet weak private var categoriesSearchBar: UISearchBar!
    @IBOutlet weak private var initialTabBar: UITabBar!
    
    private lazy var resultViewModel = InitialViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCell.delegate =  self
        tableViewCell.dataSource = self
        tableViewCell.register(UINib(nibName: "InitialTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        categoriesSearchBar.delegate = self
        initialTabBar.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InitialTableViewCell
        cell.titleItemLabel.text = resultViewModel.itemMultiget[indexPath.row].title
        cell.priceItemLabel?.text = "R$ \(resultViewModel.itemMultiget[indexPath.row].price)"
        cell.configure(url: (resultViewModel.itemMultiget[indexPath.row].thumbnail))
        cell.productId = (resultViewModel.itemMultiget[indexPath.row].id)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailView.itemId = resultViewModel.itemMultiget[indexPath.row].id
        navigationController?.pushViewController(detailView, animated: true)
    }
    
    func reloadTableViewData() {
        self.tableViewCell.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let resultText =  searchBar.text {
            if resultText != ""{
                searchProducts(text: resultText)
                resultViewModel.itemMultiget.removeAll()
            }
        }
    }
    
    func searchProducts(text: String) {
        resultViewModel.loadItemsQuery(id: text)
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let favoritesView = FavoritesViewController(nibName: "FavoritesViewController", bundle: nil)
        favoritesView.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [favoritesView]
        modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true)
    }
}
