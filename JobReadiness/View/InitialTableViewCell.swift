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
    
    func configure(url: String) {
        imageItem.loadImage(urlString: url)
    }
    
}
