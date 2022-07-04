//
//  InitialModelView.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 01/07/22.
//

import Foundation
import UIKit

protocol InitialViewModelDelegate: AnyObject {
    func reloadTableViewData()
}

final class InitialViewModel {
    
    var itemMultiget = [Body]()
    var itemId: String?
    weak var delegate: InitialViewModelDelegate?
    
    init(delegate: InitialViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadItemsQuery(id: String) {
        ServiceApi.loadPreditor(id: id, onComplete: { [weak self] (result) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                let data = result[0].categoryId
                self.itemId = data
                if let itemId = self.itemId {
                    self.loadItemsHighlights(id: itemId)
                }
            }
        })
    }
    
    func loadItemsHighlights(id: String) {
        ServiceApi.loadHighlights(id: id ,onComplete: { [weak self] (highlights) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                let ids = highlights
                for product in ids.indices {
                    self.loadDetailsCategory(id: ids[product].id)
                }
            }
        })
    }
    
    func loadDetailsCategory(id: String){
        ServiceApi.loadMultigetItems(id: id, onComplete: { [weak self] (result) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                let data = result[0].body
                let items = Body(id: data.id, title: data.title, subtitle: data.subtitle, price: data.price, thumbnail: data.thumbnail)
                self.itemMultiget.append(items)
                let test = items.id.count
                self.delegate?.reloadTableViewData()
                self.numberOfRows(section: test)
            }
        })
    }
    
    
    func numberOfRows(section: Int) -> Int {
        return itemMultiget.count
    }
    
    
}
extension UIImageView {
    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

