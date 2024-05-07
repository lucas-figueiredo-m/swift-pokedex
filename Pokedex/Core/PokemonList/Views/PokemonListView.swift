//
//  ContentView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 27/04/24.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.searchResult) { pokemon in
                        NavigationLink {
                            LazyNavigationView(PokemonDetailView(pokemon: pokemon))
                        } label: {
                            PokemonCardView(pokemon: pokemon)
                        }
                    }
                }
                .padding(.horizontal)
                
                if !viewModel.isFinished {
                    LazyVStack {
                        ProgressView()
                            .padding(.horizontal, 20)
                            .padding(.vertical, 16)
                            .foregroundColor(.black)
                            .background(lightGray)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .task {
                                await viewModel.loadMoreContent()
                            }                        
                    }
                }
            }
            .background(.white)
            .preferredColorScheme(.light)
            .navigationTitle("Pokemons")
        }
        .tint(.black)
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    PokemonListView()
}
