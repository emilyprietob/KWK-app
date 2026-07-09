//
//  ReflectionDetailView.swift
//  Curiosity App
//
//  Created by Emily Prieto on 7/7/26.
//
import SwiftUI

struct ReflectionDetailView: View {
    let reflection: Reflection
    @EnvironmentObject var store: LibraryStore
    @Environment(\.dismiss) private var dismiss
    
    @State private var editedText: String = ""
    
    var discovery: Discovery? {
        Discovery.all.first(where: { $0.title == reflection.discoveryTitle })
    }
    
    var body: some View {
        ZStack {
            Color("Soft Linen").ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    // Category label
                    Text(reflection.category.rawValue.uppercased())
                        .font(.caption)
                        .fontWeight(.semibold)
                        .tracking(2)
                        .foregroundStyle(Color("Dusty Olive"))
                        .padding(.bottom, 8)
                    
                    // Prompt as title
                    Text(reflection.reflectionPrompt)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("Ink Black"))
                        .padding(.bottom, 6)
                    
                    // Original date
                    Text("Saved \(reflection.date.formatted(date: .long, time: .omitted))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 20)
                    
                    Divider()
                        .padding(.bottom, 20)
                    
                    // Discovery image
                    if let discovery = discovery {
                        Image(discovery.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .clipped()
                            .padding(.bottom, 24)
                    }
                    
                    // Editable reflection text
                    TextEditor(text: $editedText)
                        .font(.body)
                        .foregroundStyle(Color("Ink Black"))
                        .frame(minHeight: 200)
                        .padding(12)
                        .background(Color("Soft Linen"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.bottom, 8)
                    
                    // Word count
                    Text("\(editedText.split(separator: " ").count) words")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.bottom, 24)
                    
                    // Save button
                    Button("Save changes") {
                        let updated = Reflection(
                            id: reflection.id,
                            discoveryTitle: reflection.discoveryTitle,
                            category: reflection.category,
                            reflectionPrompt: reflection.reflectionPrompt,
                            text: editedText,
                            date: reflection.date // which preserves the original date
                        )
                        store.update(updated)
                        dismiss()
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Burgundy"))
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            editedText = reflection.text
        }
    }
}
