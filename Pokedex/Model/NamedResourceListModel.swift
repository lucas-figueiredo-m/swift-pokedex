//
//  NamedResourceListModel.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import Foundation

struct NamedResourceListModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [NamedAPIResource]
}

struct NamedAPIResource: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    let name, url: String
    var capitalizedName: String {
        return name.capitalized
    }
}

//struct Appetizer: Decodable, Identifiable {
//    let id: Int
//    let name: String
//    let description: String
//    let price: Double
//    let imageURL: String
//    let calories: Int
//    let protein: Int
//    let carbs: Int
//}
//
//struct AppetizerResponse: Decodable {
//    let request: [Appetizer]
//}
