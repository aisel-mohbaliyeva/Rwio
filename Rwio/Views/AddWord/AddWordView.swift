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
            TextField("English word", text:$englishText )
            TextField("Azerbaijani translation", text: $azerbaijaniText)
            Button("Save") {
            let newWord =
                Word(englishText: englishText, azerbaijaniText: azerbaijaniText)
                context.insert(newWord)
                englishText = ""
                azerbaijaniText = ""
                
            }
        }
    }
}

#Preview {
    AddWordView()
}
