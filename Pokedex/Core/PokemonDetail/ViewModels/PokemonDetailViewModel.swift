//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 03/05/24.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    @Published var pokemon: PokemonModel
    
    func getPokemonDetail(detailUrl: String) {
        PokemonService.instance.getPokemonDetail(path: detailUrl) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemon):
                    self.pokemon = pokemon
                case .failure(let error):
                    print(error.localizedDescription)
                }                
            }
        }
    }
    
    init(detailUrl: String) {
        self.pokemon = PokemonModel(
            id: 0,
            name: "",
            height: 0,
            is_default: false,
            order: 0,
            weight: 0,
            abilities: [],
            moves: [],
            sprites: PokemonSprites(
                other: OtherSprites(officialArtwork: OfficialArtworkSprite(front_default: ""))
            ),
            stats: [],
            types: []
        )
        
        getPokemonDetail(detailUrl: detailUrl)
    }
    
    
}
