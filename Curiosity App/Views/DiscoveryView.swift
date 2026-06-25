//
//  DiscoveryView.swift
//  Curiosity App
//
//  Created by Emily Prieto on 6/25/26.
//
import SwiftUI

struct DiscoveryView : View {
    let category: DiscoveryCategory
    
    var body: some View {
        ZStack {
            Color("Cream").ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(category.emoji)
                    .font(.system(size: 70))
                
                Text(category.rawValue)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("Evergreen"))
                
                Text("Today's discovery will appear here.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Evergree"))
                
                
                Button("Feed my brain") {
                    print("Reflection coming soon!")
                }
                .padding()
                .background(Color("Sky Blue"))
                .foregroundStyle(Color("Evergreen"))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
    }
}
