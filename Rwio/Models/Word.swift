//
//  Word.swift
//  Rwio
//
//  Created by Aysel Mohbaliyeva on 05.09.26.
//

import SwiftData

@Model
class Word {
    var englishText: String
    var translationText: String
    var weight: Int
    
    init(englishText: String, translationText: String) {
        self.englishText = englishText
        self.translationText = translationText
        self.weight = 5
    }
}
