//
//  PokemonThumbnail.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import SwiftUI

struct PokemonThumbnail: View {
    let thumbnail: String
    var body: some View {
        AsyncImage(url: URL(string: thumbnail)) {image in
            image.image?.resizable().scaledToFill()
        }
        .frame(width: 250, height: 250)
        .padding()
        .background(.white)
        .clipShape(Circle())
    }
}

#Preview("PokemonThumbnail", traits: .sizeThatFitsLayout) {
    PokemonThumbnail(thumbnail: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
        .padding()
        .background(colorBackground)
}
