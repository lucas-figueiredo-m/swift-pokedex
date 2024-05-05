//
//  Int.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 04/05/24.
//

import Foundation

extension Int {
    func formatAsId() -> String {
        return "#" + String(format: "%04d", self)
    }
}
