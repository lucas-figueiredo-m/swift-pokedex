//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import SwiftUI
import PagerTabStripView

struct PokemonDetailView: View {
    var pokemon: PokemonModel
    //    @StateObject private var viewModel: PokemonDetailViewModel
    //
    //    init(detailUrl: String) {
    //        _viewModel = StateObject(wrappedValue: PokemonDetailViewModel(detailUrl: detailUrl))
    //    }
    
    init(pokemon: PokemonModel) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        VStack {
            VStack {
                
                PokemonDetailHeaderView(pokemon: pokemon)
                    .padding(.horizontal)
                PokemonThumbnail(thumbnail: pokemon.sprites.other.officialArtwork.front_default)
                    .zIndex(3)
                    .offset(y: 40)
                    .padding(.top, -40)
                VStack() {
                    
                    PagerTabStripView {
                        PokemonStatsView(stats: pokemon.stats)
                            .pagerTabItem(tag: 1) {
                                Text("About")
                            }
                            .padding()
                        PokemonStatsView(stats: pokemon.stats)
                            .pagerTabItem(tag: 2) {
                                Text("Base Stats")
                            }
                        PokemonStatsView(stats: pokemon.stats)
                            .pagerTabItem(tag: 3) {
                                Text("Evolutions")
                            }
                        
                    }
                    
                    Spacer()
                    
                }
                .padding()
                .background(.white)
                .clipShape(CustomShape())
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .background(pokemon.backgroundColor)
        }
        .navigationTitle(pokemon.capitalizedName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.white)
    }
}

#Preview {
    PokemonDetailView(pokemon: DevPreview.pokemon)
}
