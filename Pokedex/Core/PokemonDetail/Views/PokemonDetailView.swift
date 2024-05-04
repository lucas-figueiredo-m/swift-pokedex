//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokemon: PokemonModel
//    @StateObject private var viewModel: PokemonDetailViewModel
//    
//    init(detailUrl: String) {
//        _viewModel = StateObject(wrappedValue: PokemonDetailViewModel(detailUrl: detailUrl))
//    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                ScrollView() {
                    VStack() {
                        PokemonThumbnail(thumbnail: pokemon.sprites.other.officialArtwork.front_default)
                        
                        PokemonStatsView(stats: pokemon.stats)
                        
//                        PokemonAbilitiesView(abilities: pokemon.abilities)
                        
//                        PokemonMovesView(moves: pokemon.moves)
                        
                        
                    }
                    .padding()
                    
                }
            }
        }
        .navigationTitle(pokemon.capitalizedName)
        .background(colorBackground)
    }
}

let pokemonItem = DevPreview.pokemon

#Preview {
    PokemonDetailView(pokemon: pokemonItem)
}
