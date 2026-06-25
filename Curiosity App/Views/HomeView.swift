//
//  HomeView.swift
//  Curiosity App
//
//  Created by Emily Prieto on 6/25/26.
//
import SwiftUI

struct HomeView: View {
    var body : some View {
        NavigationStack {
            ZStack {
                Color("Cream").ignoresSafeArea()
                
                VStack(spacing: 24) {
                    Text("App Name")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Welcome back. Let's discover something beautiful!")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    VStack(spacing: 14) {
                        ForEach(DiscoveryCategory.allCases) { category in
                            NavigationLink {
                                DiscoveryView(category: category)
                            } label: {
                                CategoryButton(category: category)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Text("creature")
                        .font(.system(size: 52))
                    
                    Text("Your companion is waiting for inspiration!")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .padding()
            }
        }
    }
}
