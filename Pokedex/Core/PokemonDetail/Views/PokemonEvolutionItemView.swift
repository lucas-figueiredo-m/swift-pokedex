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
    @StateObject var viewModel: PokemonEvolutionItemViewModel
    
    init(evolution: Evolutions) {
        self.evolution = evolution
        _viewModel = StateObject(
            wrappedValue: PokemonEvolutionItemViewModel(
                fromPokemonName: evolution.from.rawName,
                toPokemonName: evolution.to.rawName
            ))
    }
    
    var body: some View {
        HStack {
            if let fromPokemon = viewModel.fromPokemon {
                NavigationLink {
                    PokemonDetailView(pokemon: fromPokemon)
                } label: {
                    LabeledPokemonView(image: evolution.from.image, name: evolution.from.name)
                }
            } else {
                LabeledPokemonView(image: evolution.from.image, name: evolution.from.name)
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
            
            if let toPokemon = viewModel.toPokemon {
                NavigationLink {
                    PokemonDetailView(pokemon: toPokemon)
                } label: {
                    LabeledPokemonView(image: evolution.to.image, name: evolution.to.name)
                }
            } else {
                LabeledPokemonView(image: evolution.to.image, name: evolution.to.name)
            }
        }
    }
}

#Preview("PokemonEvolutionItemView", traits: .sizeThatFitsLayout) {
    PokemonEvolutionItemView(evolution: DevPreview.evolution.evolutions[0])
        .padding()
        .background(colorBackground)
}
