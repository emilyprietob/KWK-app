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
    @State private var hasSeenIntro = false

    var body: some Scene {
        WindowGroup {
            Group {
                if hasSeenIntro {
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
                } else {
                    IntroView {
                        hasSeenIntro = true
                    }
                }
            }
            .animation(.easeInOut(duration: 0.8), value: hasSeenIntro)
        }
    }
}
