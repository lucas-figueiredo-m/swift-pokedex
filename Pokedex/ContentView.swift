//
//  ContentView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 27/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var pokemons: [NamedAPIResource] = []
    @State private var isLoading = false
    @State private var isFinished = false
    @State private var isStarting = true
    @State private var offset: Int = 0
    @State private var searchText = ""
    
    
    
    let columns = [GridItem(.flexible(), spacing: rowSpacing), GridItem(.flexible(), spacing: rowSpacing)]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(searchResult) { pokemon in
                        NavigationLink {
                            PokemonDetailView(detailUrl: pokemon.url)
                        } label: {
                            PokemonCardView(detailUrl: pokemon.url)
                        }
                        
                    }
                    if !isFinished {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundColor(.black)
                            .foregroundColor(.red)
                            .onAppear {
                                loadMoreContent()
                            }
                    }
                }
                
            }
            
            .navigationTitle("Pokemons")
        }
        .searchable(text: $searchText)
        .onAppear {
            getPokemons()
        }
        
    }
    
    var searchResult: [NamedAPIResource] {
        if searchText.isEmpty {
            return pokemons
        } else {
            return pokemons.filter { $0.name.contains(searchText.lowercased()) }
        }
    }
    
    func loadMoreContent() {
        if isLoading || isStarting {
            return
        }
        isLoading = true
        print("Offset: \(offset)")
        PokemonService.instance.getPokemonList(offset: offset) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemons):
                    self.pokemons.append(contentsOf: pokemons.results)
                    self.offset += 20
                    isLoading = false
                    if pokemons.count < offset {
                        isFinished = true
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    func getPokemons() {
        PokemonService.instance.getPokemonList(offset: offset) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemons):
                    self.pokemons = pokemons.results
                    self.offset += 20
                    self.isStarting = false
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
