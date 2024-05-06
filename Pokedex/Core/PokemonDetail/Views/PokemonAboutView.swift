//
//  PokemonAboutView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 05/05/24.
//

import SwiftUI

struct PokemonAboutView: View {
    let pokemon: PokemonModel
    
    var firstAbilities: String {
        var abilities: [PokemonAbility] = pokemon.data.abilities
        
        if abilities.count > 3 {
            abilities = Array(pokemon.data.abilities[0..<3])
        }
        
        let abilityNames = abilities.map { $0.abilityName.removeDash() }
        
        return abilityNames.joined(separator: ", ")
        
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(pokemon.specie.pokemonDescription)
            VStack(alignment: .leading, spacing: 12) {
                PokemonAboutItemView(title: "Species", content: pokemon.specie.genera)
                PokemonAboutItemView(title: "Egg Groups", content: pokemon.specie.eggGroups)
                PokemonAboutItemView(title: "Height", content: pokemon.data.height.toHeightString())
                PokemonAboutItemView(title: "Weight", content: pokemon.data.weight.toWeightString())
                PokemonAboutItemView(title: "Abilities", content: firstAbilities)
            }
        }
    }
}

#Preview {
    PokemonAboutView(pokemon: DevPreview.pokemon)
}
