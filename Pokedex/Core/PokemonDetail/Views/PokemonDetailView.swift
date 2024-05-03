//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @State var pokemon: PokemonModel = PokemonModel(id: 0, name: "", height: 0, is_default: false, order: 0, weight: 0, abilities: [], moves: [], sprites: PokemonSprites(other: OtherSprites(officialArtwork: OfficialArtworkSprite(front_default: ""))), stats: [], types: [])
    let detailUrl: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                ScrollView() {
                    VStack() {
                        PokemonThumbnail(thumbnail: pokemon.sprites.other.officialArtwork.front_default)
                        
                        PokemonStatsView(stats: pokemon.stats)
                        
                        PokemonAbilitiesView(abilities: pokemon.abilities)
                        
                        PokemonMovesView(moves: pokemon.moves)
                        
                        
                    }
                    .padding()
                    
                }
            }
        }
        .navigationTitle(pokemon.capitalizedName)
        .background(colorBackground)
        .onAppear {
            PokemonService.instance.getPokemonDetail(path: detailUrl) { result in
                switch result {
                case .success(let pokemon):
                    self.pokemon = pokemon
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}

#Preview {
    PokemonDetailView(detailUrl: "https://pokeapi.co/api/v2/stat/1/")
}
