//
//  Reflection.swift
//  Curiosity App
//
//  Created by Emily Prieto on 7/1/26.
//
import SwiftUI
import Foundation
import Combine


struct Reflection: Identifiable {
    let id: UUID
    let discoveryTitle: String
    let category: DiscoveryCategory
    let reflectionPrompt: String
    let text: String
    let date: Date
    
    var wordCount: Int {
        text.split(separator: " ").count
    }
    
    init(id: UUID = UUID(), discoveryTitle: String, category: DiscoveryCategory,
    reflectionPrompt: String, text: String, date: Date) {
        self.id = id
        self.discoveryTitle = discoveryTitle
        self.category = category
        self.reflectionPrompt = reflectionPrompt
        self.text = text
        self.date = date
    }
    
}
