//
//  HomeView.swift
//  Curiosity App
//
//  Created by Emily Prieto on 6/25/26.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: LibraryStore

    var dominantCategory: DiscoveryCategory? {
        let counts = Dictionary(grouping: store.reflections, by: { $0.category })
        return counts.max(by: { $0.value.count < $1.value.count })?.key
    }

    var companionTagline: String {
        switch dominantCategory {
        case .art:
            return "Painting the world one discovery at a time."
        case .literature:
            return "Lost in words and loving it."
        case .music:
            return "Currently living in a song."
        case nil:
            return "Ready to explore something new."
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color("Soft Linen").ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {

                        // Header
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 4) {

                                    // Edition label
                                    Text("ISSUE No. 001  ·  \(Date.now.formatted(.dateTime.month(.wide).day().year()))")
                                        .font(.caption2)
                                        .fontWeight(.semibold)
                                        .tracking(1.5)
                                        .foregroundStyle(Color("Dusty Olive"))
                                        .padding(.bottom, 8)

                                    // Masthead
                                    Text("Curio")
                                        .font(.system(size: 52, weight: .bold, design: .serif))
                                        .foregroundStyle(Color("Ink Black"))

                                    // Tagline
                                    Text("What will you discover today?")
                                        .font(.subheadline)
                                        .italic()
                                        .foregroundStyle(Color("Dusty Olive"))
                                }

                                Spacer()

                                // Companion
                                VStack(spacing: 4) {
                                    Text("✦")
                                        .font(.system(size: 36))
                                        .foregroundStyle(Color("Burgundy"))

                                    Text(companionTagline)
                                        .font(.caption2)
                                        .italic()
                                        .foregroundStyle(Color("Dusty Olive"))
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: 100)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, 24)
                            .padding(.bottom, 20)

                            // Editorial rule
                            Divider()
                                .padding(.horizontal)
                                .padding(.bottom, 16)

                            // Section label
                            Text("TODAY'S DISCOVERIES")
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .tracking(2)
                                .foregroundStyle(.secondary)
                                .padding(.horizontal)
                                .padding(.bottom, 16)
                        }

                        // Category cards
                        VStack(spacing: 16) {
                            ForEach(DiscoveryCategory.allCases) { category in
                                CategoryCard(category: category)
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.bottom, 32)
                    }
                }
            }
            .navigationBarHidden(true)
            
        }
    }
}
