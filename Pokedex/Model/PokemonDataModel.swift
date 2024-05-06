//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 27/04/24.
//

import Foundation
import SwiftUI

struct PokemonDataModel: Codable, Identifiable {
    let id: Int
    let name: String
    let height: Int
    let is_default: Bool
    let order: Int
    let weight: Int
    let abilities: [PokemonAbility]
    
    //    let forms: Any
    //    let gamo_indices: Any
    //    let held_items: Any
    //    let location_area_encounters: Any
    let moves: [PokemonMove]
    //    let past_types: Any
    let sprites: PokemonSprites
    //    var cries: Any
    let species: NamedAPIResource
    let stats: [PokemonStats]
    let types: [PokemonType]
    
    var capitalizedName: String {
        return name.removeDash().capitalized
    }
    
    var backgroundColor: Color {
        
        return pokemonBackgroundColor[types.first?.type.name ?? "unknown"] ?? colorBackground
    }
}

struct PokemonAbility: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    var is_hidden: Bool
    var slot: Int
    var ability: NamedAPIResource
    
    var abilityName: String {
        return ability.capitalizedName
    }
}

struct PokemonSprites: Codable {
    let other: OtherSprites
}

struct OtherSprites: Codable {
    let officialArtwork: OfficialArtworkSprite
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtworkSprite: Codable {
    let front_default: String
}

struct PokemonStats: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    let stat: NamedAPIResource
    let effort: Int
    let base_stat: Double
    var statName: String {
        let name = stat.capitalizedName.replacingOccurrences(of: "-", with: " ")
        
        let splitted = name.split(separator: " ")
        
        if splitted.count == 2 {
            let firstWord = String(splitted[0]).getSubstringIn(start: 0, end: 2)
            let secondWord = String(splitted[1]).getSubstringIn(start: 0, end: 3)
            
            return "\(firstWord) \(secondWord)"
        }
        
        return name
    }
}

struct PokemonMove: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    let move: NamedAPIResource
    var moveName: String {
        return move.capitalizedName
    }
}

struct PokemonType: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    let slot: Int
    let type: NamedAPIResource
    var typeName: String {
        return type.capitalizedName
    }
}
