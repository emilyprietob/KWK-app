//
//  DiscoveryView.swift
//  Curiosity App
//
//  Created by Emily Prieto on 6/25/26.
//
import SwiftUI

struct DiscoveryView : View {
    let category: DiscoveryCategory
    var discovery: Discovery? {
        Discovery.all.first(where: { $0.category == category })
    }
    
    var body: some View {
        ZStack {
            Color("Sand").ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(category.emoji)
                    .font(.system(size: 70))
                
                Text(category.rawValue)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("Evergreen"))
                
                if let discovery = discovery {
                    Text(discovery.title)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(discovery.description)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("Evergreen"))
                    Text(discovery.reflectionPrompt)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("Evergreen"))
                } else {
                    Text("Nothing found :(")
                }
                    
                    
                
                Button("Feed my brain") {
                    print("Reflection coming soon!")
                }
                .padding()
                .background(Color("Sky Reflection"))
                .foregroundStyle(Color("Evergreen"))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
    }
}
