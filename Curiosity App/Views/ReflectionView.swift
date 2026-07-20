//
//  ReflectionView.swift
//  Curiosity App
//
//  Created by Emily Prieto on 7/1/26.
//
import SwiftUI

struct ReflectionView: View {
    let discovery: Discovery
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
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .tracking(2)
                        .foregroundStyle(Color("Dusty Olive"))
                        .padding(.bottom, 6)

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

                    // Pull quote with left accent bar
                    HStack(alignment: .top, spacing: 12) {
                        Rectangle()
                            .fill(Color("Burgundy"))
                            .frame(width: 3)

                        Text(discovery.reflectionPrompt)
                            .font(.body)
                            .italic()
                            .foregroundStyle(Color("Ink Black"))
                            .lineSpacing(4)
                    }
                    .padding(.bottom, 32)

                    // Writing area — open page feel
                    ZStack(alignment: .topLeading) {
                        if reflectionText.isEmpty {
                            Text("Begin writing...")
                                .font(.body)
                                .foregroundStyle(Color("Ink Black").opacity(0.25))
                                .padding(.top, 8)
                                .padding(.leading, 4)
                        }

                        TextEditor(text: $reflectionText)
                            .font(.body)
                            .foregroundStyle(Color("Ink Black"))
                            .lineSpacing(6)
                            .scrollContentBackground(.hidden)
                            .background(Color.clear)
                            .frame(minHeight: 240)
                    }
                    .padding(.bottom, 8)

                    // Word count — magazine style
                    Text("\(reflectionText.split(separator: " ").filter { !$0.isEmpty }.count) words")
                        .font(.caption2)
                        .tracking(1)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.bottom, 40)

                    // Save button
                    Button("Save reflection") {
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
        .navigationBarTitleDisplayMode(.inline)
    }
}
