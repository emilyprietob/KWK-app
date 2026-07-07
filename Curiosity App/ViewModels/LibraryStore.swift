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
}


