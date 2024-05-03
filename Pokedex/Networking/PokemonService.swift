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
    
    func getPokemonList(offset: Int) async throws -> NamedResourceListModel {
        return try await self.api.anotherGet(path: "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=20")
    }

    func getPokemonDetail(path: String, completed: @escaping (Result<PokemonModel, NetError>) -> Void) {
        self.api.get(path: path, completed: completed)
    }
    
}
