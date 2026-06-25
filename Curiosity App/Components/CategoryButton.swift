//
//  CategoryButton.swift
//  Curiosity App
//
//  Created by Emily Prieto on 6/25/26.
//

import SwiftUI

struct CategoryButton: View {
    let category: DiscoveryCategory
    
    var body: some View {
        HStack {
            Text(category.emoji)
            Text(category.rawValue)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("Evergreen"))
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .padding(.horizontal)
    }
}
