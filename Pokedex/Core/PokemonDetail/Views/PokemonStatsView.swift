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
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(stats) { stat in
                        StatProgressView(statName: stat.statName, value: stat.base_stat)
                    }
                    
                }
                //            LazyVGrid(columns: columns, spacing: rowSpacing) {
                //                ForEach(stats) { stat in
                //                    HStack {
                //                        Spacer()
                //                        VStack {
                //                            Text(stat.statName)
                //                            Text("\(stat.base_stat)")
                //                        }
                //                        Spacer()
                //                        
                //                    }
                //                    .frame(height: 60)
                //                    .background(.white)
                //                    .clipShape(RoundedRectangle(cornerRadius: 10))
                //                }
                //            }
                
                
            }
        }
    }
}

let stats = DevPreview.pokemon.data.stats

#Preview("PokemonStatsView", traits: .sizeThatFitsLayout) {
    PokemonStatsView(stats: stats)
        .background(colorBackground)
        .padding()
}
