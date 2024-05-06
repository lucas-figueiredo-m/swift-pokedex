//
//  PokemonEvolutionsView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 06/05/24.
//

import SwiftUI
import Kingfisher

struct PokemonEvolutionsView: View {
    let pokemon: PokemonModel
    let viewModel: PokemonEvolutionViewModel
    
    init(pokemon: PokemonModel) {
        self.pokemon = pokemon
        self.viewModel = PokemonEvolutionViewModel(pokemon: pokemon)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                if viewModel.evolutions.count > 0 {
                    ForEach(viewModel.evolutions) { evolution in
                        PokemonEvolutionItemView(evolution: evolution)
                    }
                } else {
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        Text("This pokemón has no evolutions")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    PokemonEvolutionsView(pokemon: DevPreview.pokemon)
}
