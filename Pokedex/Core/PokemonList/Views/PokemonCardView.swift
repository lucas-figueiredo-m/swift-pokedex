//
//  PokemonCardView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import SwiftUI

struct PokemonCardView: View {
    @State var pokemon: PokemonModel = PokemonModel(id: 0, name: "", height: 0, is_default: false, order: 0, weight: 0, abilities: [], moves: [], sprites: PokemonSprites(other: OtherSprites(officialArtwork: OfficialArtworkSprite(front_default: ""))), stats: [], types: [])
    let detailUrl: String
    
    var body: some View {
        HStack (alignment: .center, spacing: 6) {
            Text("#\(pokemon.id)")
            Text(pokemon.capitalizedName)
            
            Spacer()
            
            AsyncImage(url: URL(string: pokemon.sprites.other.officialArtwork.front_default)) {image in
                image.image?.resizable().scaledToFill()
            }
                .frame(width: 75, height: 75)
        }
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

//#Preview ("PokemonCardView", traits: .sizeThatFitsLayout) {
//    PokemonCardView()
//        .padding()
//}
