//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject private var viewModel: PokemonDetailViewModel
    
    init(detailUrl: String) {
        _viewModel = StateObject(wrappedValue: PokemonDetailViewModel(detailUrl: detailUrl))
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                ScrollView() {
                    VStack() {
                        PokemonThumbnail(thumbnail: viewModel.pokemon.sprites.other.officialArtwork.front_default)
                        
                        PokemonStatsView(stats: viewModel.pokemon.stats)
                        
                        PokemonAbilitiesView(abilities: viewModel.pokemon.abilities)
                        
                        PokemonMovesView(moves: viewModel.pokemon.moves)
                        
                        
                    }
                    .padding()
                    
                }
            }
        }
        .navigationTitle(viewModel.pokemon.capitalizedName)
        .background(colorBackground)
    }
}

#Preview {
    PokemonDetailView(detailUrl: "https://pokeapi.co/api/v2/stat/1/")
}
