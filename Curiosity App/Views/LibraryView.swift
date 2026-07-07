//
//  LibraryView.swift
//  Curiosity App
//
//  Created by Emily Prieto on 7/7/26.
//

import SwiftUI
import Foundation
import Combine


struct LibraryView: View {
    @EnvironmentObject var store: LibraryStore
    
    var reflectionsByCategory: [DiscoveryCategory: [Reflection]] {
        Dictionary(grouping: store.reflections, by: { $0.category})
    }
    
    var body: some View {
        ZStack {
            Color("Soft Linen").ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    
                    Text("Saved Collection")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("Ink Black"))
                        .padding(.horizontal)
                    
                    if store.reflections.isEmpty {
                        VStack(spacing: 12) {
                            Text("Nothing saved yet")
                                .font(.body)
                                .foregroundStyle(.secondary)
                            Text("Discover something and feed your brain!")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 60)
                    } else {
                        
                        ForEach(DiscoveryCategory.allCases) {
                            category in let entries = (reflectionsByCategory[category] ?? [])
                                .sorted(by: { $0.date < $1.date })
                            
                            if !entries.isEmpty {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(category.rawValue.uppercased())
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .tracking(2)
                                        .foregroundStyle(Color("Dusty Olive"))
                                        .padding(.horizontal)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 16) {
                                            ForEach(entries) {
                                                reflection in LibraryCard(reflection: reflection)
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}
