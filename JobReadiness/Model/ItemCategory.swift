//
//  ItemCategory.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 01/07/22.
//

import Foundation

struct ItemCategory: Codable {
    let code: Int
    let body: Body
}

struct Body: Codable {
    let id: String
    let title: String
    let subtitle: String?
    let price: Double
    let thumbnail: String
    let warranty: String
    let availableQuantity: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case subtitle
        case price
        case thumbnail
        case warranty
        case availableQuantity = "available_quantity"
    }
}


