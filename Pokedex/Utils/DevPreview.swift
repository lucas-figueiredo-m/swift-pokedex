//
//  DevPreview.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 04/05/24.
//

import Foundation




class DevPreview {
    
    static let pokemon = PokemonModel(data: pokemonData, specie: pokemonSpecie)
    
    static let pokemonSpecie = PokemonSpeciesModel(
        egg_groups_temp: [
            NamedAPIResource(name: "monster", url: "https://pokeapi.co/api/v2/egg-group/1/"),
            NamedAPIResource(name: "water1", url: "https://pokeapi.co/api/v2/egg-group/2/")
        ],
        genera_temp: [
            PokemonGenus(
            genus: "Pokémon Minitortue",
            language: NamedAPIResource(name: "fr", url: "https://pokeapi.co/api/v2/language/5/")
        ),
            PokemonGenus(
                genus: "Tiny Turtle Pokémon",
                language: NamedAPIResource(name: "en", url: "https://pokeapi.co/api/v2/language/9/")
            )
        ],
        habitat_temp: NamedAPIResource(name: "waters-edge", url: "https://pokeapi.co/api/v2/pokemon-habitat/9/"),
        flavor_text_entries_temp: [
            PokemonFlavorText(
                flavor_text: "Shoots water at\nprey while in the\nwater. Withdraws into\nits shell when in\ndanger.",
                language: NamedAPIResource(name: "en", url: "https://pokeapi.co/api/v2/language/9/"),
                version: NamedAPIResource(name: "yellow", url: "https://pokeapi.co/api/v2/version/3/")
            ),
            PokemonFlavorText(
                flavor_text: "SQUIRTLE’s shell is not merely used\nfor protection.\nThe shell’s rounded shape and thegrooves on its surface help minimize\nresistance in water, enabling this\nPOKéMON to swim at high speeds.",
                language: NamedAPIResource(name: "en", url: "https://pokeapi.co/api/v2/language/9/"),
                version: NamedAPIResource(name: "ruby", url: "https://pokeapi.co/api/v2/version/7/")
            ),
            
        ],
        isLegendary: false,
        isMythical: false
    )
    
    static let pokemonData = PokemonDataModel(
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
        species: NamedAPIResource(name: "squirtle", url: "https://pokeapi.co/api/v2/pokemon-species/7/"),
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
