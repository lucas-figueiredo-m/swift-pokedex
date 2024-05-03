//
//  PokemonAbilitiesView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import SwiftUI

struct PokemonAbilitiesView: View {
    let abilities: [PokemonAbility]
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 6) {
            Text("Abilities")
            ForEach(abilities) { ability in
                HStack {
                    Text(ability.abilityName)
                    Spacer()
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
    }
}

let abilities: [PokemonAbility] = [
    PokemonAbility(
        is_hidden: false,
        slot: 0,
        ability: NamedAPIResource(
            name: "overgrow", url: ""
        )
    ),
    PokemonAbility(
        is_hidden: false,
        slot: 0,
        ability: NamedAPIResource(
            name: "chlorophyll", url: ""
        )
    )
    
]

#Preview("PokemonAbilitiesView", traits: .sizeThatFitsLayout) {
    PokemonAbilitiesView(abilities: abilities)
        .padding()
        .background(colorBackground)
}
