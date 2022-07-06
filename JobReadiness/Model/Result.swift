//
//  Result.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 29/06/22.
//

import Foundation

struct Result: Codable {
    let result: [ResultElement]
}

struct ResultElement: Codable {
    let id: String
    let name: String
    let categoryId: String?
    let categoryName: String
    let attributes: [Attributes]
    
    private enum CodingKeys: String, CodingKey {
        case id = "domain_id"
        case name = "domain_name"
        case categoryId = "category_id"
        case categoryName = "category_name"
        case attributes = "attributes"
    }
    
    init(id: String, name: String, categoryId: String, categoryName: String, attributes: [Attributes]) {
        self.id = id
        self.name = name
        self.categoryName = categoryName
        self.categoryId = categoryId
        self.attributes = attributes
        
    }
}

struct Attributes : Codable {
    let id: String
    let name: String
    let valueId: String
    let valueName: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case valueId = "value_id"
        case valueName = "value_name"
    }
    
    init(id: String, name: String, valueId: String, valueName: String) {
        self.id = id
        self.name = name
        self.valueId = valueId
        self.valueName = valueName
        
    }
    
}
