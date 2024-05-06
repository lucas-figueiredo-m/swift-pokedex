//
//  Constant.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 30/04/24.
//

import SwiftUI

let rowSpacing: CGFloat = 4
let columns = [GridItem(.flexible(), spacing: rowSpacing), GridItem(.flexible(), spacing: rowSpacing)]

let statMax: Double = 200

let pokemonAbout = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam lobortis dapibus ligula ut elementum. Maecenas quis laoreet ex. Pellentesque vel est vitae diam eleifend maximus vel vitae libero. Nulla pulvinar lacus quam, at pretium ante laoreet eget. Suspendisse nec urna."

let defaultPokemonImage = ""

let colorBackground: Color = Color("ColorBackground")
let colorFire: Color = Color("ColorFire")
let colorWater: Color = Color("ColorWater")
let colorElectric: Color = Color("ColorElectric")
let colorFighting: Color = Color("ColorFighting")
let colorFlying: Color = Color("ColorFlying")
let colorPoison: Color = Color("ColorPoison")
let colorGround: Color = Color("ColorGround")
let colorRock: Color = Color("ColorRock")
let colorBug: Color = Color("ColorBug")
let colorGhost: Color = Color("ColorGhost")
let colorSteel: Color = Color("ColorSteel")
let colorPsychic: Color = Color("ColorPsychic")
let colorIce: Color = Color("ColorIce")
let colorDragon: Color = Color("ColorDragon")
let colorDark: Color = Color("ColorDark")
let colorFairy: Color = Color("ColorFairy")
let colorUnknown: Color = Color("ColorUnknown")
let colorShadow: Color = Color("ColorShadow")
let colorGrass: Color = Color("ColorGrass")

let pokemonBackgroundColor: [String: Color] = [
    "normal": colorBackground,
    "fighting": colorFighting,
    "flying": colorFlying,
    "poison": colorPoison,
    "ground": colorGround,
    "rock": colorRock,
    "bug": colorBug,
    "ghost": colorGhost,
    "steel": colorSteel,
    "fire": colorFire,
    "water": colorWater,
    "grass": colorGrass,
    "electric": colorElectric,
    "psychic": colorPsychic,
    "ice": colorIce,
    "dragon": colorDragon,
    "dark": colorDark,
    "fairy": colorFairy,
    "unknown": colorUnknown,
    "shadow": colorShadow,
]

