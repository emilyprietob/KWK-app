//
//  CategoryCard.swift
//  Curiosity App
//
//  Created by Emily Prieto on 7/9/26.
//
import SwiftUI

struct CategoryCard: View {
    let category: DiscoveryCategory

    var discovery: Discovery? {
        Discovery.all.first(where: { $0.category == category })
    }

    var body: some View {
        NavigationLink {
            DiscoveryView(category: category)
        } label: {
            ZStack(alignment: .bottomLeading) {

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

                LinearGradient(
                    colors: [.clear, Color("Ink Black").opacity(0.7)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 160)

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
    }
}
