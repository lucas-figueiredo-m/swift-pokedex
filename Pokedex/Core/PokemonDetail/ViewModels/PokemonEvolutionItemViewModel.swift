//
//  PokemonEvolutionItemViewModel.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 07/05/24.
//

import Foundation
import SwiftUI

class PokemonEvolutionItemViewModel: ObservableObject {
    @Published var fromPokemon: PokemonModel? = nil
    @Published var toPokemon: PokemonModel? = nil
    let toPokemonName: String
    let fromPokemonName: String
    
    init(fromPokemonName: String, toPokemonName: String) {
        self.fromPokemonName = fromPokemonName
        self.toPokemonName = toPokemonName
        
        
        Task {
            await getPokemon()
        }
    }
    
    func getPokemon() async {
        do {
            let fromPokemon = try await PokemonService.instance.getPokemonDetail(pokemonName: fromPokemonName)
            let toPokemon = try await PokemonService.instance.getPokemonDetail(pokemonName: toPokemonName)
            DispatchQueue.main.async {
                self.fromPokemon = fromPokemon
                self.toPokemon = toPokemon
            }
        } catch let error {
            print("Error: \(error)")
        }
    }
    
}
