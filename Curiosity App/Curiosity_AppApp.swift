//
//  Curiosity_AppApp.swift
//  Curiosity App
//
//  Created by Emily Prieto on 6/25/26.
//

import SwiftUI

@main
struct Curiosity_AppApp: App {
    @StateObject var store = LibraryStore()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack {
                    HomeView()
                }
                .tabItem {
                    Label("Discover", systemImage: "sparkles")
                }
                
                NavigationStack {
                    LibraryView()
                }
                .tabItem {
                    Label("Library", systemImage: "books.vertical")
                }
            }
            .environmentObject(store)
        }
    }
}
