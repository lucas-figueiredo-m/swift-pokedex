//
//  Color.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 04/05/24.
//

import Foundation
import SwiftUI

extension Color {
    func isBrightColor(for environment: EnvironmentValues) -> Bool {
        let components = self.resolve(in: environment)
        let red = Double(components.red) * 255
        let green = Double(components.green) * 255
        let blue = Double(components.blue) * 255
        
        let evaluatedBrightness = (red * 299 + green * 587 + blue * 114) / 1000
        let threshhold = 125.0
        
        if evaluatedBrightness > threshhold {
            return true
        }
        
        return false
    }
}
