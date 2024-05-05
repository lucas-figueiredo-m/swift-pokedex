//
//  StatProgressView.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 04/05/24.
//

import SwiftUI

struct StatProgressView: View {
    let statName: String
    let value: Double
    
    
    var tintColor: Color {
        if value < statMax / 3 {
            return .red
        }
        
        if value >= statMax/3 && value < 2 * statMax / 3 {
            return .yellow
        }
        
        return .green
    }
    
    
    var body: some View {
        HStack {
            HStack {
                Text(statName)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                Spacer()
                Text("\(value.formatted())")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray.darker(by: 30))
            }
            .frame(maxWidth: 150)
            
            ProgressView(value: value, total: statMax)
                .tint(tintColor)
            
        }
    }
}

#Preview("StatProgressView", traits: .sizeThatFitsLayout) {
    VStack {
        StatProgressView(statName: "Test", value: 12)
        StatProgressView(statName: "Test", value: 128)
        StatProgressView(statName: "Test", value: 240)
    }
    .padding()
    .background(colorBackground)
}
