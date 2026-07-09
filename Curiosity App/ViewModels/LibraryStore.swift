//
//  LibraryStore.swift
//  Curiosity App
//
//  Created by Emily Prieto on 7/6/26.
//
import SwiftUI
import Foundation
import Combine

class LibraryStore: ObservableObject {
    @Published var reflections: [Reflection] = []
    
    func update(_ updated: Reflection) {
        if let index = reflections.firstIndex(where: { $0.id == updated.id }) {
            reflections[index] = updated
        }
    }
}


