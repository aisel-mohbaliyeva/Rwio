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
    var azerbaijaniText: String
    var weight: Int
    
    init(englishText: String, azerbaijaniText: String) {
        self.englishText = englishText
        self.azerbaijaniText = azerbaijaniText
        self.weight = 5
    }
}
