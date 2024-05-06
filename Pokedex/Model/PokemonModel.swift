//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 05/05/24.
//

import Foundation

struct PokemonModel: Codable, Identifiable {
    var id = UUID().uuidString
    let data: PokemonDataModel
    let specie: PokemonSpeciesModel
}
