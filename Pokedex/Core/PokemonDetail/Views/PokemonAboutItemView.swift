//
//  PokemonAboutItemView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 05/05/24.
//

import SwiftUI

struct PokemonAboutItemView: View {
    let title: String
    let content: String
    
    var body: some View {
        HStack(alignment: .top) {
            HStack {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                Spacer()
            }
            .frame(width: 120)
            
            Text(content)
                .fontWeight(.semibold)
                .foregroundStyle(.gray.darker(by: 30))
        }
    }
}

#Preview("PokemonAboutItemView", traits: .sizeThatFitsLayout) {
    PokemonAboutItemView(title: "Species", content: "Seed")
        .padding()
        .background(colorBackground)
}
