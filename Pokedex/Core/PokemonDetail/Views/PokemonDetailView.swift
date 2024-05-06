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
    
    init(pokemon: PokemonModel) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        VStack {
            VStack {
                
                PokemonDetailHeaderView(pokemon: pokemon.data)
                    .padding(.horizontal)
                PokemonThumbnail(thumbnail: pokemon.data.sprites.other.officialArtwork.front_default)
                    .zIndex(3)
                    .offset(y: 40)
                    .padding(.top, -40)
                VStack() {
                    
                    PagerTabStripView {
                        PokemonAboutView(pokemon: pokemon)
                            .pagerTabItem(tag: 1) {
                                Text("About")
                                    .font(.headline)
                                    .foregroundStyle(.black)
                            }
                            .padding()
                        PokemonStatsView(stats: pokemon.data.stats)
                            .pagerTabItem(tag: 2) {
                                Text("Base Stats")
                                    .font(.headline)
                                    .foregroundStyle(.black)
                            }
                            .padding()
                        PokemonEvolutionsView(pokemon: pokemon)
                            .pagerTabItem(tag: 3) {
                                Text("Evolutions")
                                    .font(.headline)
                                    .foregroundStyle(.black)
                            }
                            .padding()
                        
                    }
                    
                    Spacer()
                    
                }
                .padding()
                .background(.white)
                .clipShape(CustomShape())
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .background(pokemon.data.backgroundColor)
        }
        .navigationTitle(pokemon.data.capitalizedName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.white)
        .preferredColorScheme(.dark)
    }
        
}

#Preview {
    PokemonDetailView(pokemon: DevPreview.pokemon)
}
