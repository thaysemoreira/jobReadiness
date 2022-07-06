//
//  ServiceApi.swift
//  JobReadiness
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 29/06/22.
//

import Foundation

class ServiceApi {
    
    private static let token = "APP_USR-8236877123889977-070612-15528421306eaba869fa571b26971f0a-1008512634"
    private static let basePath = "https://api.mercadolibre.com"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        return config
    }()
    
    class func loadHighlights(id: String, onComplete: @escaping ([Highlights]) -> Void) {
        let url = URL(string: "\(basePath)/highlights/MLB/category/\(id)")
        
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                guard let response = data else {return}
                do {
                    let categories = try JSONDecoder().decode(Query.self, from: data!)
                    onComplete(categories.content)
                    
                } catch {
                    print(error.localizedDescription)
                    return
                }
            }
        }
        task.resume()
    }
    
    class func loadPreditor(id: String, onComplete: @escaping ([ResultElement]) -> Void) {
        let url = URL(string: "\(basePath)/sites/MLB/domain_discovery/search?limit=1&q=\(id)")
        
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                guard let response = data else {return}
                do {
                    let items = try JSONDecoder().decode([ResultElement].self, from: data!)
                    onComplete(items)
                    
                } catch {
                    print(error.localizedDescription)
                    return
                }
            }
        }
        task.resume()
    }
    
    
    class func loadMultigetItems(id: String, onComplete: @escaping ([ItemCategory]) -> Void) {
        let url = URL(string: "\(basePath)/items?ids=\(id)")
        
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                guard let response = data else {return}
                do {
                    let itemCategory = try JSONDecoder().decode([ItemCategory].self, from: data!)
                    onComplete(itemCategory)
                } catch {
                    print(error)
                    return
                }
            }
        }
        task.resume()
    }
}
