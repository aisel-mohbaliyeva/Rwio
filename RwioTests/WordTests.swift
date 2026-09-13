//
//  RwioTests.swift
//  RwioTests
//
//  Created by Aysel Mohbaliyeva on 12.09.26.
//

import Testing
@testable import Rwio

struct WordTests {
    @Test func testWordDefaultWeight() {
        let word = Word(englishText: "apple", translationText: "alma")
        #expect(word.weight == 5)
    }
    @Test func testWordStoresText() {
        let word = Word(englishText: "book", translationText: "kitab")
        #expect(word.englishText == "book")
        #expect(word.translationText == "kitab")
    }
}
