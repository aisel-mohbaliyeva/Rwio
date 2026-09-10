//
//  WordPickerService.swift
//  Rwio
//
//  Created by Aysel Mohbaliyeva on 08.09.26.
//

import Foundation

struct WordPickerService {
    static func pickRandomWord(from words: [Word]) -> Word? {
        if words.isEmpty {
            return nil
        }
        let totalWeight = words.reduce(0) { $0 + $1.weight }
        var randomValue = Int.random(in: 0..<totalWeight)
        for word in words {
            randomValue -= word.weight
            if randomValue < 0 {
                return word
            }
        }
        return words.last
    }
    
}
