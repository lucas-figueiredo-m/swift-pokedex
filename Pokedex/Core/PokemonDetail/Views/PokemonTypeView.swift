//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 04/05/24.
//

import SwiftUI

struct PokemonTypeView: View {
    @Environment(\.self) var environment
    let type: String
    let backgroundColor: Color
    
    var isBackgroundBright: Bool {
        return backgroundColor.isBrightColor(for: environment)
    }
    
    var body: some View {
        Text(type)
            .font(.headline)
            .fontWeight(.semibold)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundStyle(isBackgroundBright ? .black : .white)
            .background(backgroundColor.brightness(0.05))
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.2), radius: 8, x: 2, y: 4)
    }
    
    
}

#Preview("PokemonTypeView", traits: .sizeThatFitsLayout) {
    PokemonTypeView(type: DevPreview.pokemon.data.types[0].typeName, backgroundColor: DevPreview.pokemon.data.backgroundColor)
        .padding()
        .background(DevPreview.pokemon.data.backgroundColor)
}
