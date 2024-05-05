//
//  PokemonDetailHeaderView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 04/05/24.
//

import SwiftUI

struct PokemonDetailHeaderView: View {
    let pokemon: PokemonModel
    var body: some View {
        VStack {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Text(pokemon.capitalizedName)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                Text(pokemon.id.formatAsId())
                    .font(.subheadline)
                    .fontWeight(.black)
            }
            .foregroundStyle(.white)
            
            HStack {
                ForEach(pokemon.types) { type in
                    PokemonTypeView(type: type.typeName, backgroundColor: pokemon.backgroundColor)
                }
                
                Spacer()
                
                Text("")
            }
        }
    }
}

#Preview("PokemonDetailHeaderView", traits: .sizeThatFitsLayout) {
    PokemonDetailHeaderView(pokemon: DevPreview.pokemon)
        .background(DevPreview.pokemon.backgroundColor)
        .padding()
}
