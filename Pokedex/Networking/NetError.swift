//
//  NetworkError.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 27/04/24.
//

import Foundation

enum NetError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
    case unableToComplete
}
