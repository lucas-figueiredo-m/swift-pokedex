//
//  CodableURLSession.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 27/04/24.
//

import Foundation

extension URLSession {
    func decode<T: Codable>(_ data: Data) -> T {
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode response from URLSession.")
        }
        
        return decodedData
    }
}
