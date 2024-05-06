//
//  PokemonEvolutionViewModel.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 06/05/24.
//

import Foundation

enum ImageExtractionError: Error {
    case noMatches
}

class PokemonEvolutionViewModel {
    private let pokemon: PokemonModel
    var evolutions: [Evolutions] = []
    
    init(pokemon: PokemonModel) {
        self.pokemon = pokemon
        buildPokemonEvolutions()
    }
    
    func buildImageUrl (url: String) -> String? {
        do {
            let regex  = try NSRegularExpression(pattern: "\\/\\d{1,}\\/")
            let results = regex.matches(in: url, range: NSRange(url.startIndex..., in: url))
            
            let strResult = results.map {
                String(url[Range($0.range, in: url)!])
            }
            
            guard let result = strResult.last else {
                throw ImageExtractionError.noMatches
                
            }
            let id = result.replacingOccurrences(of: "/", with: "")
            
            
            return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
        }
        catch {
            return nil
        }
    }
    
    func buildPokemonEvolutionsRecursion(chain: ChainLink) -> [Evolutions] {
        var tempEvolutions: [Evolutions] = []
        
        let currentPokemon = BasicPokemonInfo(
            name: chain.species.capitalizedName,
            image: buildImageUrl(url: chain.species.url) ?? defaultPokemonImage
        )
        
        for evolution in chain.evolves_to {
            let nextPokemon = BasicPokemonInfo(
                name: evolution.species.capitalizedName,
                image: buildImageUrl(url: evolution.species.url) ?? defaultPokemonImage
            )
            let evolution = Evolutions(
                from: currentPokemon,
                to: nextPokemon,
                trigger: evolution.evolution_details[0].trigger.capitalizedName
            )
            tempEvolutions.append(evolution)
        }
        
        for evolution in chain.evolves_to {
            tempEvolutions.append(contentsOf: buildPokemonEvolutionsRecursion(chain: evolution))
        }
        
        return tempEvolutions
    }
    
    func buildPokemonEvolutions() {
        self.evolutions = buildPokemonEvolutionsRecursion(chain: pokemon.evolution.chain)
    }
    
}
