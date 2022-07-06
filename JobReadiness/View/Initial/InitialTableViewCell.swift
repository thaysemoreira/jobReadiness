//
//  InitialTableViewCell.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 30/06/22.
//

import UIKit

class InitialTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleItemLabel: UILabel!
    @IBOutlet weak var priceItemLabel: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var favoriteArray: [String] = []
    var favoriteKey = "SalvedFavorites"
    var productId = String()
    
    func configure(url: String) {
        imageItem.loadImage(urlString: url)
        
    }
    
    func saveProductToFavorites(productId: String) {
        print(productId)
        let defaults = UserDefaults.standard
        
        if var favoriteArray = defaults.stringArray(forKey: favoriteKey) {
            if !favoriteArray.contains(productId) {
                favoriteArray.append(productId)
                defaults.set(favoriteArray, forKey: favoriteKey)
            }
            let getFavorites = defaults.stringArray(forKey: "SalvedFavorites") ?? [String]()
            print(getFavorites)
        } else {
            let favoriteArray = [productId]
            UserDefaults.standard.set(favoriteArray, forKey: favoriteKey)
            print(favoriteArray)
        }
    }
    
    @IBAction func handleMarkAsFavorite(_ sender: Any) {
        self.saveProductToFavorites(productId: self.productId)
    }
}
