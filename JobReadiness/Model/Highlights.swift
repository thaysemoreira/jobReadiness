//
//  ResulItems.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 30/06/22.
//

import Foundation

struct Query: Codable {
    let queryData: QueryData
    let content: [Highlights]

    enum CodingKeys: String, CodingKey {
        case queryData = "query_data"
        case content
    }
}

struct Highlights: Codable {
    let id: String
    let position: Int
    let type: String
}

struct QueryData: Codable {
    let highlightType: String
    let criteria: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case highlightType = "highlight_type"
        case criteria, id
    }
}
