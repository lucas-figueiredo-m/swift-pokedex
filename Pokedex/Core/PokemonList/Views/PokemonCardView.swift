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
                Text("#\(pokemon.data.id)")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                Text(pokemon.data.capitalizedName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
            }
            .padding(.leading)
            
            Spacer()
            
            KFImage(URL(string: pokemon.data.sprites.other.officialArtwork.front_default))
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .padding(.trailing)
                .padding(.vertical)
        }
        .background(pokemon.data.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview ("PokemonCardView", traits: .sizeThatFitsLayout) {
    PokemonCardView(pokemon: DevPreview.pokemon)
        .padding()
        .background(colorBackground)
}
