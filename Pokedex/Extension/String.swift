//
//  String.swift
//  Pokedex
//
//  Created by Lucas Martins Figueiredo on 05/05/24.
//

import Foundation

extension String {
    func getSubstringIn(start: Int?, end: Int?) -> String {
        let strStart = start ?? 0
        let strEnd = end ?? self.count - 1
        
    
        if strStart < 0 || strEnd > (self.count - 1) {
            debugPrint("substring start and end must be within string length")
            return self
        }
        
        let startIndex = self.index(self.startIndex, offsetBy: strStart)
        let endIndex = self.index(self.startIndex, offsetBy: strEnd)
        
        return String(self[startIndex..<endIndex])
        
        
    }
}
