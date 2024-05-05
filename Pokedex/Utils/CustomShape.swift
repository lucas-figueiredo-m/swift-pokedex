//
//  CustomShape.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 04/05/24.
//

import SwiftUI

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
    
}

#Preview ("CustomShape", traits: .fixedLayout(width: 428, height: 120)) {
    CustomShape()
        .padding()
}
