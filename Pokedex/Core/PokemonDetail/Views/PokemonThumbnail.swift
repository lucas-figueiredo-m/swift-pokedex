//
//  PokemonThumbnail.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import SwiftUI
import Kingfisher

struct PokemonThumbnail: View {
    let thumbnail: String
    var body: some View {
        KFImage(URL(string: thumbnail))
            .resizable()
            .scaledToFit()
            .frame(width: 225, height: 225)
//            .padding()
    }
}

let thumbnail = DevPreview.pokemon.data.sprites.other.officialArtwork.front_default

#Preview("PokemonThumbnail", traits: .sizeThatFitsLayout) {
    PokemonThumbnail(thumbnail: thumbnail)
        .padding()
        .background(colorBackground)
}
