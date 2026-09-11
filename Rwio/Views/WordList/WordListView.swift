//
//  WordListView.swift
//  Rwio
//
//  Created by Aysel Mohbaliyeva on 07.09.26.
//

import SwiftUI
import SwiftData

struct WordListView: View {
    @Environment(\.modelContext) private var context
    @Query var words: [Word]
    
    var body: some View {
        Group {
            if words.isEmpty{
                Text("No words yet. Add your first word!")
            } else {
                List {
                    ForEach(words) { word in
                        HStack {
                            Text(word.englishText)
                            Text(" - ")
                            Text(word.translationText)
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            context.delete(words[index])
                        }
                    }
                }
            }
        }
        .navigationTitle("My Words")
    }
}

#Preview {
    WordListView()
}
