//
//  DetailViewController.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 29/06/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleDetailLabel: UILabel!
    @IBOutlet weak var priceDetailLabel: UILabel!
    @IBOutlet weak var warrantyLabel: UILabel!
    @IBOutlet weak var avaliableQuantityLabel: UILabel!
    @IBOutlet weak var itemDetailImage: UIImageView!
    
    private var serviceApi = ServiceApi()
    
    var itemId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ServiceApi.loadMultigetItems(id: itemId, onComplete: { (data) in
            DispatchQueue.main.async {
                self.titleDetailLabel.text = data[0].body.title
                self.priceDetailLabel.text = "R$ \(data[0].body.price)"
                self.warrantyLabel.text = data[0].body.warranty
                self.avaliableQuantityLabel.text = "Quantidade disponível: \(data[0].body.availableQuantity)"
                self.configure(url: data[0].body.thumbnail)
            }
        })
    }
    
    func configure(url: String) {
        itemDetailImage.loadImage(urlString: url)
        
    }
}
