//
//  LabeledPokemonView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 07/05/24.
//

import SwiftUI
import Kingfisher

struct LabeledPokemonView: View {
    let image: String
    let name: String
    
    var body: some View {
        VStack {
            KFImage(URL(string: image))
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text(name)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
        }
    }
}

#Preview("LabeledPokemonView", traits: .sizeThatFitsLayout) {
    LabeledPokemonView(
        image: DevPreview.evolution.evolutions[0].from.image,
        name: DevPreview.evolution.evolutions[0].from.name
    )
        .padding()
        .background(colorBackground)
}
