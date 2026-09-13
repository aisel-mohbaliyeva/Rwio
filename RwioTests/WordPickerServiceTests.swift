//
//  WordPickerServiceTests.swift
//  RwioTests
//
//  Created by Aysel Mohbaliyeva on 12.09.26.
//

import Testing
@testable import Rwio

struct WordPickerServiceTests {
    @Test func testPickFromEmptyArray() {
        let word: [Word] = []
        let result = WordPickerService.pickRandomWord(from: word)
        #expect(result == nil)
    }
    @Test func testPickFromSingleWord() {
        let word = Word(englishText: "sun", translationText: "günəş")
        let words = [word]
        let result = WordPickerService.pickRandomWord(from: words)
        #expect(result === word)
    }
    @Test func testPickAlwaysReturnsWord() {
        let words = [
            Word(englishText: "cat", translationText: "pişik"),
            Word(englishText: "dog",
                 translationText: "it"),
            Word(englishText: "bird",
                 translationText: "quş")
        ]
        for _ in 1...10 {
            let result = WordPickerService.pickRandomWord(from: words)
            #expect(result != nil)
        }
    }
    @Test func testHigherWeightPickedMoreOften() {
        let heavyWord = Word(englishText: "hard", translationText: "çətin")
        heavyWord.weight = 100
        let lightWord = Word(englishText: "easy", translationText: "asan")
        lightWord.weight = 1
        let words = [heavyWord, lightWord]
        
        var heavyCount = 0
        for _ in 1...50 {
            let result = WordPickerService.pickRandomWord(from: words)
            if result === heavyWord {
                heavyCount += 1
            }
        }
        #expect(heavyCount > 25)
    }
}
