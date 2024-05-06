//
//  CodableURLSession.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 27/04/24.
//

import Foundation

extension URLSession {
    func decode<T: Codable>(_ data: Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
            throw NetError.invalidData
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetError.invalidData
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetError.invalidData
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetError.invalidData
        } catch let error {
            print("Unknown error: \(error)")
            throw NetError.invalidData
        }
    }
}
