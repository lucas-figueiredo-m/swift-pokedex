//
//  PokemonStatsView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import SwiftUI

struct PokemonStatsView: View {
    let stats: [PokemonStats]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Stats")
            LazyVGrid(columns: columns, spacing: rowSpacing) {
                ForEach(stats) { stat in
                    HStack {
                        Spacer()
                        VStack {
                            Text(stat.statName)
                            Text("\(stat.base_stat)")
                        }
                        Spacer()
                        
                    }
                    .frame(height: 60)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            
        }
    }
}

let stats: [PokemonStats] = [
    PokemonStats(
        stat: NamedAPIResource(
            name: "hp",
            url: ""
        ),
        effort: 0,
        base_stat: 39
    ),
    PokemonStats(
        stat: NamedAPIResource(
            name: "attack",
            url: ""
        ),
        effort: 0,
        base_stat: 39
    ),
    PokemonStats(
        stat: NamedAPIResource(
            name: "defense",
            url: ""
        ),
        effort: 0,
        base_stat: 39
    ),
    PokemonStats(
        stat: NamedAPIResource(
            name: "special-attack",
            url: ""
        ),
        effort: 0,
        base_stat: 39
    ),
    PokemonStats(
        stat: NamedAPIResource(
            name: "spacial-defense",
            url: ""
        ),
        effort: 0,
        base_stat: 39
    ),
    PokemonStats(
        stat: NamedAPIResource(
            name: "speed",
            url: ""
        ),
        effort: 0,
        base_stat: 39
    ),
    
]

#Preview("PokemonStatsView", traits: .sizeThatFitsLayout) {
    PokemonStatsView(stats: stats)
        .background(colorBackground)
        .padding()
}
