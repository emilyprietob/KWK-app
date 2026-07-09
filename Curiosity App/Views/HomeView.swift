//
//  HomeView.swift
//  Curiosity App
//
//  Created by Emily Prieto on 6/25/26.
//
import SwiftUI

struct HomeView: View {
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

                                // Companion placeholder
                                Text("✦")
                                    .font(.system(size: 36))
                                    .foregroundStyle(Color("Burgundy"))
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
                                let discovery = Discovery.all.first(where: { $0.category == category })

                                NavigationLink(value : category) {
                                    ZStack(alignment: .bottomLeading) {

                                        // Background image
                                        if let discovery = discovery {
                                            Image(discovery.imageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 160)
                                                .clipped()
                                        } else {
                                            Rectangle()
                                                .fill(Color("Soft Linen"))
                                                .frame(height: 160)
                                        }

                                        // Dark overlay
                                        LinearGradient(
                                            colors: [.clear, Color("Ink Black").opacity(0.7)],
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                        .frame(height: 160)

                                        // Category label
                                        HStack {
                                            Text(category.rawValue.uppercased())
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                                .tracking(3)
                                                .foregroundStyle(.white)

                                            Spacer()

                                            Image(systemName: "arrow.right")
                                                .foregroundStyle(.white)
                                                .font(.caption)
                                        }
                                        .padding()
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                }
                                .buttonStyle(.plain)
                                .padding(.horizontal)
                            }
                        }
                        .padding(.bottom, 32)
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(for: DiscoveryCategory.self) {
                category in DiscoveryView(category : category)
            }
        }
    }
}
