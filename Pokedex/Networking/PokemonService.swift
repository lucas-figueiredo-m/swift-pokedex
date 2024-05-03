//
//  PokemonService.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 29/04/24.
//

import Foundation

final class PokemonService {
    static let instance = PokemonService()
    private let api = NetworkClientBuilder(baseURL: "https://pokeapi.co/api/v2")
    
    private init() {}
    
    func getPokemonList(offset: Int, completed: @escaping (Result<NamedResourceListModel, NetError>) -> Void) {
        self.api.get(path: "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=20", completed: completed)
    }
    
    func getPokemonDetail(path: String, completed: @escaping (Result<PokemonModel, NetError>) -> Void) {
        self.api.get(path: path, completed: completed)
    }
}
