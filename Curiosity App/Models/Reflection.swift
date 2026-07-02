//
//  Reflection.swift
//  Curiosity App
//
//  Created by Emily Prieto on 7/1/26.
//
import SwiftUI
import Foundation


struct Reflection: Identifiable {
    let id = UUID()
    let discoveryTitle: String
    let category: DiscoveryCategory
    let reflectionPrompt: String
    let text: String
    let date: Date
    
    var wordCount: Int {
        text.split(separator: " ").count
    }
}
