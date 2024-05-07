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
    
    private func handleTriggerText(detail: EvolutionDetail) -> String {
        if detail.trigger.name == "use-item" {
            guard let trigger = detail.item else {
                return detail.trigger.capitalizedName.removeDash()
            }
            
            return trigger.capitalizedName.removeDash()
        }
        
        if detail.trigger.name == "level-up" {
            guard let minLevel = detail.min_level else {
                return detail.trigger.capitalizedName.removeDash()
            }
            
            return "Lvl \(minLevel)"
        }
        
        if detail.trigger.name == "trade" {
            guard let heldItem = detail.held_item else {
                return detail.trigger.capitalizedName.removeDash()
            }
            
            return "Trade holding \(heldItem.capitalizedName.removeDash())"
        }
        
        return detail.trigger.capitalizedName.removeDash()
    }
    
    private func buildImageUrl (url: String) -> String? {
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
    
    private func buildPokemonEvolutionsRecursion(chain: ChainLink) -> [Evolutions] {
        var tempEvolutions: [Evolutions] = []
        
        let currentPokemon = BasicPokemonInfo(
            name: chain.species.capitalizedName.removeDash(),
            rawName: chain.species.name,
            image: buildImageUrl(url: chain.species.url) ?? defaultPokemonImage
        )
        
        for evolution in chain.evolves_to {
            let nextPokemon = BasicPokemonInfo(
                name: evolution.species.capitalizedName.removeDash(),
                rawName: evolution.species.name,
                image: buildImageUrl(url: evolution.species.url) ?? defaultPokemonImage
            )
            let evolution = Evolutions(
                from: currentPokemon,
                to: nextPokemon,
                trigger: handleTriggerText(detail: evolution.evolution_details[0])
            )
            tempEvolutions.append(evolution)
        }
        
        for evolution in chain.evolves_to {
            tempEvolutions.append(contentsOf: buildPokemonEvolutionsRecursion(chain: evolution))
        }
        
        return tempEvolutions
    }
    
    private func buildPokemonEvolutions() {
        self.evolutions = buildPokemonEvolutionsRecursion(chain: pokemon.evolution.chain)
    }
    
}
