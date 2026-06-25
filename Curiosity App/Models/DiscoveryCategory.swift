//
//  DiscoveryCategory.swift
//  Curiosity App
//
//  Created by Emily Prieto on 6/25/26.
//
import SwiftUI

enum DiscoveryCategory: String, CaseIterable, Identifiable {
    case art = "Art"
    case literature = "Literature"
    case music = "Music"
    
    var id: String {
        rawValue
    }
    
    var emoji: String {
        switch self {
            case .art: return "🎨"
            case .literature: return "📚"
            case .music: return "🎶"
        }
    }
}
