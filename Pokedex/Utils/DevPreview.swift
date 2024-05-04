//
//  DevPreview.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 04/05/24.
//

import Foundation




class DevPreview {
    
    static let pokemon = PokemonModel(
        id: 7,
        name: "squirtle",
        height: 5,
        is_default: true,
        order: 10,
        weight: 90,
        abilities: [
            PokemonAbility(is_hidden: false, slot: 1, ability: NamedAPIResource(name: "torrent", url: "")),
            PokemonAbility(is_hidden: true, slot: 3, ability: NamedAPIResource(name: "rain-dish", url: "")),
            
        ],
        moves: [
            PokemonMove(move: NamedAPIResource(name: "mega-punch", url: "https://pokeapi.co/api/v2/move/5/")),
            PokemonMove(move: NamedAPIResource(name: "ice-punch", url: "https://pokeapi.co/api/v2/move/8/")),
            PokemonMove(move: NamedAPIResource(name: "mega-kick", url: "https://pokeapi.co/api/v2/move/25/")),
            PokemonMove(move: NamedAPIResource(name: "head-butt", url: "https://pokeapi.co/api/v2/move/29/")),
            PokemonMove(move: NamedAPIResource(name: "tacke", url: "https://pokeapi.co/api/v2/move/33/")),
            PokemonMove(move: NamedAPIResource(name: "body-slam", url: "https://pokeapi.co/api/v2/move/34/")),
            PokemonMove(move: NamedAPIResource(name: "take-down", url: "https://pokeapi.co/api/v2/move/36/")),
            PokemonMove(move: NamedAPIResource(name: "double-edge", url: "https://pokeapi.co/api/v2/move/38/")),
            
        ],
        sprites: PokemonSprites(
            other: OtherSprites(
                officialArtwork: OfficialArtworkSprite(
                    front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png")
            )
        ),
        stats: [
            PokemonStats(stat: NamedAPIResource(name: "hp", url: ""), effort: 0, base_stat: 44),
            PokemonStats(stat: NamedAPIResource(name: "attack", url: ""), effort: 0, base_stat: 48),
            PokemonStats(stat: NamedAPIResource(name: "defense", url: ""), effort: 1, base_stat: 65),
            PokemonStats(stat: NamedAPIResource(name: "special-attack", url: ""), effort: 0, base_stat: 50),
            PokemonStats(stat: NamedAPIResource(name: "special-defense", url: ""), effort: 0, base_stat: 64),
            PokemonStats(stat: NamedAPIResource(name: "speed", url: ""), effort: 0, base_stat: 43),
            
        ],
        types: [
            PokemonType(slot: 1, type: NamedAPIResource(name: "water", url: ""))
        ]
    )
}
