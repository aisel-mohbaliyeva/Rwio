//
//  RwioApp.swift
//  Rwio
//
//  Created by Aysel Mohbaliyeva on 02.09.26.
//

import SwiftUI
import SwiftData

@main
struct RwioApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Word.self)
    }
}
