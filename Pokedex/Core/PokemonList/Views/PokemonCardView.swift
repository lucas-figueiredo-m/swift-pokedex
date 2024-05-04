//
//  PokemonCardView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import SwiftUI
import Kingfisher

struct PokemonCardView: View {
     var pokemon: PokemonModel
    
    var body: some View {
        HStack (alignment: .center, spacing: 6) {
            VStack(alignment: .leading) {
                Text("#\(pokemon.id)")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                Text(pokemon.capitalizedName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
            }
            .padding(.leading)
            
            Spacer()
            
            KFImage(URL(string: pokemon.sprites.other.officialArtwork.front_default))
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .padding(.trailing)
                .padding(.vertical)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

let pokemon = DevPreview.pokemon

#Preview ("PokemonCardView", traits: .sizeThatFitsLayout) {
    PokemonCardView(pokemon: pokemon)
        .padding()
        .background(colorBackground)
}
