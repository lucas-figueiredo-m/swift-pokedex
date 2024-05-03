//
//  ContentView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 27/04/24.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonListViewModel()
    
    let columns = [GridItem(.flexible(), spacing: rowSpacing), GridItem(.flexible(), spacing: rowSpacing)]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.searchResult) { pokemon in
                        NavigationLink {
                            PokemonDetailView(detailUrl: pokemon.url)
                        } label: {
                            PokemonCardView(detailUrl: pokemon.url)
                        }
                        
                    }
                    if !viewModel.isFinished {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundColor(.black)
                            .foregroundColor(.red)
                            .task {
                                await viewModel.loadMoreContent()
                            }
                    }
                }
                
            }
            
            .navigationTitle("Pokemons")
        }
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    PokemonListView()
}
