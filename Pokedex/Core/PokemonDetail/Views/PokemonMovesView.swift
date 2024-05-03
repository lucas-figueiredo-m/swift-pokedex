//
//  PokemonMovesView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 01/05/24.
//

import SwiftUI

struct PokemonMovesView: View {
    let moves: [PokemonMove]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Moves")
            LazyVGrid(columns: columns, spacing: rowSpacing) {
                ForEach(moves) { move in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(move.moveName)
                            Text("Power: \(60)")
                        }
                        .padding(.horizontal, 15)
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

let moves: [PokemonMove] = [
    PokemonMove(
        move: NamedAPIResource(
            name: "razor-wind",
            url: ""
        )
    ),
    PokemonMove(
        move: NamedAPIResource(
            name: "swords-dance",
            url: ""
        )
    ),
    PokemonMove(
        move: NamedAPIResource(
            name: "cut",
            url: ""
        )
    )
    
]

#Preview("PokemonMovesView", traits: .sizeThatFitsLayout) {
    PokemonMovesView(moves: moves)
        .padding()
        .background(colorBackground)
}
