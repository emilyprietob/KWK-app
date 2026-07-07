//
//  LibraryCard.swift
//  Curiosity App
//
//  Created by Emily Prieto on 7/6/26.
//
import SwiftUI

struct LibraryCard: View {
    let reflection: Reflection
    
    var discovery: Discovery? {
        Discovery.all.first(where: { $0.title == reflection.discoveryTitle })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            if let found = discovery {
                Image(found.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 120)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color("Soft Linen"))
                    .frame(width: 160, height: 120)

            }
            
            Text(reflection.discoveryTitle)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color("Ink Black"))
                .lineLimit(2)
            
            Text(reflection.date.formatted(date: .abbreviated, time: .omitted))
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(width: 160)
    }
    
}
