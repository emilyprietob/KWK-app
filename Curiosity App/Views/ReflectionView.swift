//
//  ReflectionView.swift
//  Curiosity App
//
//  Created by Emily Prieto on 7/1/26.
//
import SwiftUI

struct ReflectionView: View {
    let discovery : Discovery
    let onSave: (Reflection) -> Void
    
    @State private var reflectionText = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("Soft Linen").ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    // Category
                    Text(discovery.category.rawValue.uppercased())
                        .font(.caption)
                        .fontWeight(.semibold)
                        .tracking(2)
                        .foregroundStyle(Color("Dusty Olive"))
                        .padding(.bottom, 8)
                    
                    // Discovery title
                    Text(discovery.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("Ink Black"))
                        .padding(.bottom, 4)
                    
                    // Date stamp
                    Text(Date.now.formatted(date: .long, time: .omitted))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 24)
                    
                    Divider()
                        .padding(.bottom, 20)
                    
                    // Reflection prompt as "pull quote"???
                    Text(discovery.reflectionPrompt)
                        .font(.body)
                        .italic()
                        .foregroundStyle(Color("Dusty Olive"))
                        .padding(.bottom, 20)
                    
                    //Text editor
                    TextEditor(text: $reflectionText)
                        .font(.body)
                        .foregroundStyle(Color("Ink Black"))
                        .frame(minHeight: 200)
                        .padding(12)
                        .background(Color("Soft Linen"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.bottom, 12)
                    
                    // Word count
                    Text("\(reflectionText.split(separator: " ").count) words")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.bottom, 24)
                    
                    // Save button
                    Button("Save Reflection") {
                        let reflection = Reflection(
                            discoveryTitle: discovery.title,
                            category: discovery.category,
                            reflectionPrompt: discovery.reflectionPrompt,
                            text: reflectionText,
                            date: Date.now
                        )
                        onSave(reflection)
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(reflectionText.isEmpty ? Color.gray : Color("Burgundy"))
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    .disabled(reflectionText.isEmpty)
                }
                .padding()
            }
            
        }
        .navigationTitle("My Reflection")
        .navigationBarTitleDisplayMode(.inline)
    }
}
