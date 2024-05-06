//
//  PokemonSpeciesModel.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 05/05/24.
//

import Foundation

struct PokemonSpeciesModel: Codable {
    let egg_groups_temp: [NamedAPIResource]
    let genera_temp: [PokemonGenus]
    let habitat_temp: NamedAPIResource?
    let flavor_text_entries_temp: [PokemonFlavorText]
    let isLegendary: Bool
    let isMythical: Bool
    
    enum CodingKeys: String, CodingKey {
        case egg_groups_temp = "egg_groups"
        case genera_temp = "genera"
        case habitat_temp = "habitat"
        case flavor_text_entries_temp = "flavor_text_entries"
        case isLegendary = "is_legendary"
        case isMythical = "is_mythical"
    }
    
    var eggGroups: String {
        return egg_groups_temp
            .map { $0.capitalizedName.removeDash() }
            .joined(separator: ", ")
    }
    
    var genera: String {
        return genera_temp
            .filter { $0.language.name == "en" }
            .map {
                $0.genus
                    .replacingOccurrences(of: "Pokémon", with: "")
                    .trimmingCharacters(in: .whitespacesAndNewlines)
            }
            .joined(separator: ", ")
    }
    
    var habitat: String {
        return habitat_temp?.capitalizedName ?? "No registered habitat"
    }
    
    var pokemonDescription: String {
        return flavor_text_entries_temp
            .filter { $0.language.name == "en" && $0.version.name == "ruby" }
            .map { String($0.flavor_text.lowercased().map { $0.isNewline ? " " : $0 }) }
            .joined(separator: ", ")
            .split(separator: ". ")
            .map { String($0).capitalizingFirstLetter() }
            .joined(separator: ". ")
    }
    
    
}

struct PokemonGenus: Codable {
    let genus: String
    let language: NamedAPIResource
}

struct PokemonFlavorText: Codable {
    var flavor_text: String
    let language: NamedAPIResource
    let version: NamedAPIResource
}
