//
//  PokemonEvolutionItemView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 06/05/24.
//

import SwiftUI
import Kingfisher

struct PokemonEvolutionItemView: View {
    let evolution: Evolutions
    
    var body: some View {
        HStack {
            VStack {
                KFImage(URL(string: evolution.from.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text(evolution.from.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
            }
            Spacer()
            VStack {
                Text(evolution.trigger)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                Image(systemName: "arrow.forward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 25)
            }
            Spacer()
            VStack {
                KFImage(URL(string: evolution.to.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text(evolution.to.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview("PokemonEvolutionItemView", traits: .sizeThatFitsLayout) {
    PokemonEvolutionItemView(evolution: DevPreview.evolution.evolutions[0])
        .padding()
        .background(colorBackground)
}
