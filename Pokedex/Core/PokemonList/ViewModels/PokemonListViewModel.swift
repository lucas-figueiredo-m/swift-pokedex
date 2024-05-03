//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 03/05/24.
//

import Foundation


class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [NamedAPIResource] = []
    @Published var isLoading = false
    @Published var isFinished = false
    @Published var isStarting = true
    @Published var offset: Int = 0
    @Published var searchText = ""
    
    var searchResult: [NamedAPIResource] {
        if searchText.isEmpty {
            return pokemons
        } else {
            return pokemons.filter { $0.name.contains(searchText.lowercased()) }
        }
    }
    
    init() {
        getPokemons()
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
    
    func loadMoreContent() {
        if self.isLoading || self.isStarting {
            return
        }
        self.isLoading = true
        
        PokemonService.instance.getPokemonList(offset: self.offset) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemons):
                    self.pokemons.append(contentsOf: pokemons.results)
                    self.offset += 20
                    self.isLoading = false
                    if pokemons.count < self.offset {
                        self.isFinished = true
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
}
