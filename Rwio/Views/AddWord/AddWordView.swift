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
    @State private var azerbaijaniText = ""
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                TextField("EN", text: $englishText)
                    .textFieldStyle(.roundedBorder)
                TextField("AZ", text: $azerbaijaniText)
                    .textFieldStyle(.roundedBorder)
            }
            Button("Save") {
                let newWord = Word(
                    englishText: englishText.trimmingCharacters(in: .whitespaces), azerbaijaniText: azerbaijaniText.trimmingCharacters(in: .whitespaces)
                    )
                context.insert(newWord)
                englishText = ""
                azerbaijaniText = ""
            }
            .disabled(englishText.trimmingCharacters(in: .whitespaces).isEmpty || azerbaijaniText.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .padding()
        .navigationTitle("Add Word")
    }
}

#Preview {
    AddWordView()
}
