//
//  PokemonEvolution.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 06/05/24.
//

import Foundation

struct PokemonEvolution: Codable {
    let chain: ChainLink
}

struct BasicPokemonInfo: Codable {
    let name: String
    let image: String
}

struct Evolutions: Codable, Identifiable {
    var id = UUID().uuidString
    let from: BasicPokemonInfo
    let to: BasicPokemonInfo
    let trigger: String
}

struct ChainLink: Codable {
    let species: NamedAPIResource
    let evolution_details: [EvolutionDetail]
    let evolves_to: [ChainLink]
}

struct EvolutionDetail: Codable {
    let item: NamedAPIResource?
    let trigger: NamedAPIResource
    let held_item: NamedAPIResource?
    let known_move: NamedAPIResource?
    let known_move_type: NamedAPIResource?
    let location: NamedAPIResource?
    let min_level: Int?
    let min_happiness: Int?
    let min_beauty: Int?
    let min_affection: Int?
    let needs_overworld_rain: Bool
    let party_species: NamedAPIResource?
    let party_type: NamedAPIResource?
    let relative_physical_stats: Int?
    let time_of_day: String?
    let trade_species: NamedAPIResource?
    let turn_upside_down: Bool
}
