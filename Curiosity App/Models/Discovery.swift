//
//  Discovery.swift
//  Curiosity App
//
//  Created by Emily Prieto on 6/30/26.
//
import SwiftUI
import Foundation

struct Discovery: Identifiable {
    let id = UUID()
    let category: DiscoveryCategory //so it chooses it from the already defined list
    let title: String
    let creator: String
    let year: String
    let imageName: String
    let description: String
    let reflectionPrompt: String

    
    static let all: [Discovery] = [
        Discovery(
            category: .art,
            title: "The Starry Night",
            creator: "Vincent van Gogh",
            year: "1889",
            imageName: "starry-night",
            description: "Painted in 1889 while Van Gogh was in an asylum in Saint-Rémy, The Starry Night captures a swirling night sky over a quiet village. It is one of the most recognized paintings in the world.",
            reflectionPrompt: "What emotion does this painting bring up for you?"
        ),
        Discovery(
            category: .music,
            title: "Flipturn",
            creator: "indie rock band",
            year: "2026",
            imageName: "flipturn",
            description: "Flipturn makes sunlit, restless indie rock that feels like driving with the windows down while your life is quietly changing. Press play for soaring guitars, emotional lyrics, and songs that build from intimate to euphoric.",
            reflectionPrompt: "After listening to Flipturn, what feeling stayed with you the longest? Why do you think it found you today?"
        ),
        Discovery(
            category: .literature,
            title: "Cleopatra and Frankenstein",
            creator: "Coco Mellors",
            year: "2022",
            imageName: "cleo-frank",
            description: "Cleopatra and Frankenstein is a glamorous, messy New York novel about a whirlwind marriage that looks romantic from the outside and slowly reveals the loneliness, addiction, ambition, and collateral damage underneath. It’s for anyone drawn to beautiful people making complicated choices—and the friends who get pulled into the fallout.",
            reflectionPrompt: "After reading, where in your life might you be mistaking intensity for connection?"
        )
    ]

    
}


