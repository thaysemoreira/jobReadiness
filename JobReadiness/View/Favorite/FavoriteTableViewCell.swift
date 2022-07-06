//
//  FavoriteTableViewCell.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 06/07/22.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteTitleLabel: UILabel!
    @IBOutlet weak var favoritePriceLabel: UILabel!
    
    var teste: String?
    
    func loadDetais() {
        favoriteTitleLabel.text = teste
    }
}
