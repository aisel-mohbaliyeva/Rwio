//
//  HomeView.swift
//  Rwio
//
//  Created by Aysel Mohbaliyeva on 09.09.26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink("Draw Card") {
                    DrawView()
                }
                NavigationLink("My Words") {
                    WordListView()
                }
                NavigationLink("Add Word") {
                    AddWordView()
                }
            }
            .navigationTitle("Rwio")
        }
    }
}

#Preview {
    HomeView()
}
