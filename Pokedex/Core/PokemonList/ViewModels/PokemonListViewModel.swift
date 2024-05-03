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
        Task {
            await getPokemons()
        }
    }
    
    func getPokemons() async {
        do {
            let pokemons = try await PokemonService.instance.getPokemonList(offset: offset)
            DispatchQueue.main.async {
                self.pokemons = pokemons.results
                self.offset += 20
                self.isStarting = false
            }
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    func loadMoreContent() async {
        if self.isLoading || self.isStarting {
            return
        }
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        do {
            let pokemons = try await PokemonService.instance.getPokemonList(offset: offset)
            DispatchQueue.main.async {
                self.pokemons.append(contentsOf: pokemons.results)
                self.offset += 20
                self.isLoading = false
                if pokemons.count < self.offset {
                    self.isFinished = true
                }
            }
        } catch let error {
            DispatchQueue.main.async {
                self.isLoading = false
            }
            print("Error on loadMoreContent: \(error)")
        }
    }
}
