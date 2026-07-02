//
//  DiscoveryView.swift
//  Curiosity App
//
//  Created by Emily Prieto on 6/25/26.
//
import SwiftUI

struct DiscoveryView : View {
    let category: DiscoveryCategory
    
    @State private var reflections: [Reflection] = []
    @State private var navigateToReflection = false
    
    var discovery: Discovery? {
        Discovery.all.first(where: { $0.category == category })
    }
    
    var body: some View {
        ZStack {
            Color("Soft Linen").ignoresSafeArea()
            
            ScrollView {
                if let discovery = discovery {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        // Category label
                        Text(category.rawValue.uppercased())
                            .font(.caption)
                            .fontWeight(.semibold)
                            .tracking(2)
                            .foregroundColor(Color("Dusty Olive"))
                            .padding(.bottom, 8)
                        
                        // Title
                        Text(discovery.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color("Ink Black"))
                            .padding(.bottom, 6)
                        
                        // Subtitle
                        Text("\(discovery.creator) · \(discovery.year)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .padding(.bottom, 16)
                        
                        Divider()
                            .padding(.bottom, 20)
                        
                        // Image
                        Image(discovery.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .padding(.bottom, 20)
                        
                        // Description
                        Text(discovery.description)
                            .font(.body)
                            .lineSpacing(6)
                            .foregroundStyle(Color("Ink Black"))
                            .padding(.bottom, 28)
                        
                        Divider()
                            .padding(.bottom, 20)
                        
                        // Reflection Prompt
                        Text(discovery.reflectionPrompt)
                            .font(.body)
                            .italic()
                            .foregroundStyle(Color("Dusty Olive"))
                            .padding(.bottom, 28)
                        
                        // Button
                        Button("Feed my brain") {
                            navigateToReflection = true
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("Burgundy"))
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                    }
                    .padding()
                    
                } else {
                    Text("Nothing found.")
                        .foregroundStyle(.secondary)
                        .padding()
                }
            }
            
            .navigationDestination(isPresented: $navigateToReflection) {
                if let discovery = discovery {
                    ReflectionView(discovery: discovery) {
                        reflection in reflections.append(reflection)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ShareLink(item: "Check out \(discovery?.title ?? "this") on APPName")
            }
        }
    }
}
