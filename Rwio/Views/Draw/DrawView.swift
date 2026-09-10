//
//  DrawView.swift
//  Rwio
//
//  Created by Aysel Mohbaliyeva on 08.09.26.
//

import SwiftUI
import SwiftData

struct DrawView: View {
    @Query var words: [Word]
    @Environment(\.modelContext) private var context
    
    @State private var currentWord: Word?
    @State private var showEnglish = true
    @State private var showAnswer = false
    
    
    var body: some View {
        VStack {
            if let word = currentWord {
                if showEnglish {
                    Text(word.englishText)
                } else {
                    Text(word.azerbaijaniText)
                }
                Button("Flip Card") {
                    showEnglish.toggle()
                    showAnswer = true
                }
                if showAnswer {
                    HStack {
                        Button("I Knew") {
                            if word.weight > 1 {
                                word.weight -= 1
                            }
                        }
                        Button("I Didn't Know") {
                            word.weight += 1
                        }
                    }
                }
            } else {
                Text("Tap the button to draw a card")
            }
            Button("Draw Card") {
                currentWord = WordPickerService.pickRandomWord(from: words)
                showEnglish = true
                showAnswer = false
            }
            .disabled(words.isEmpty)
        }
    }
}

#Preview {
    DrawView()
}
