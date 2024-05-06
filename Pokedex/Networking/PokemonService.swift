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
    
    func getPokemonList(offset: Int) async throws -> [PokemonModel] {
        let pokemonList: NamedResourceListModel = try await self.api.get(path: "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=20")
        
        return try await withThrowingTaskGroup(of: PokemonModel.self) { group in
            var pokemons: [PokemonModel] = []
            
            for pokemonItem in pokemonList.results {
                group.addTask {
                    let pokemonDetail = try await self.getPokemonDetail(path: pokemonItem.url)
                    let pokemonSpecies: PokemonSpeciesModel = try await self.getPokemonResource(path: pokemonDetail.species.url)
                    return PokemonModel(data: pokemonDetail, specie: pokemonSpecies)
                }
            }
            
            for try await pokemonItem in group {
                pokemons.append(pokemonItem)
            }
            
            return pokemons
        }
    }
    
    func getPokemonResource<T: Codable>(path: String) async throws -> T {
        return try await self.api.get(path: path)
    }

    func getPokemonDetail(path: String) async throws -> PokemonDataModel {
        return try await self.api.get(path: path)
    }
    
    func getPokemonDetail(path: String, completed: @escaping (Result<PokemonDataModel, NetError>) -> Void) {
        self.api.get(path: path, completed: completed)
    }
    
}
