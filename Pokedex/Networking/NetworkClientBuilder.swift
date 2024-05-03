//
//  BaseNetworking.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 27/04/24.
//

import Foundation

class NetworkClientBuilder {
    
    private let baseURL: String
    
    private func requestPath(path: String) -> String {
        return self.baseURL + path
    }
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func get<ResponseType: Codable>(path: String, completed: @escaping (Result<ResponseType, NetError>) -> Void) {
        guard let url = URL(string: path) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let _ = error {
                print("Here 1")
                
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Here 2")
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                print("Here 3")
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let payload = try decoder.decode(ResponseType.self, from: data)
                completed(.success(payload))
            } catch DecodingError.dataCorrupted(let context) {
                print(context)
            } catch DecodingError.keyNotFound(let key, let context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.valueNotFound(let value, let context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.typeMismatch(let type, let context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
}
