//
//  AddWordView.swift
//  Rwio
//
//  Created by Aysel Mohbaliyeva on 07.09.26.
//

import SwiftUI
import SwiftData

struct AddWordView: View {
    @Environment(\.modelContext) private var context
    @State private var englishText = ""
    @State private var translationText = ""
    @FocusState private var isFocused: Bool
    @State private var showSaved = false
    @State private var showDuplicate = false
    @Query var words: [Word]
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                TextField("EN", text: $englishText)
                    .focused($isFocused)
                    .textFieldStyle(.roundedBorder)
                TextField("Translation", text: $translationText)
                    .focused($isFocused)
                    .textFieldStyle(.roundedBorder)
            }
            Button(showDuplicate ? "Already exists!" : (showSaved ? "Saved!" : "Save")) {
                let trimmedEnglish = englishText.trimmingCharacters(in: .whitespaces)
                let trimmedTranslation = translationText.trimmingCharacters(in: .whitespaces)

                if words.contains(where: { $0.englishText.lowercased() == trimmedEnglish.lowercased() }) {
                    showDuplicate = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showDuplicate = false
                    }
                    return
                }
                let newWord = Word(
                    englishText: trimmedEnglish, translationText: trimmedTranslation
                )
                context.insert(newWord)
                englishText = ""
                translationText = ""
                isFocused = false
                showSaved = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showSaved = false
                }
            }
            .disabled(englishText.trimmingCharacters(in: .whitespaces).isEmpty || translationText.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .padding()
        .navigationTitle("Add Word")
    }
}

#Preview {
    AddWordView()
}
