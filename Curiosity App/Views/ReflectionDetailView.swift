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

                    // Category
                    Text(reflection.category.rawValue.uppercased())
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .tracking(2)
                        .foregroundStyle(Color("Dusty Olive"))
                        .padding(.bottom, 6)

                    // Prompt as title
                    Text(reflection.reflectionPrompt)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("Ink Black"))
                        .padding(.bottom, 4)

                    // Original date
                    Text("Saved \(reflection.date.formatted(date: .long, time: .omitted))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 24)

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
                            .padding(.bottom, 28)
                    }

                    // Writing area — open page feel
                    ZStack(alignment: .topLeading) {
                        if editedText.isEmpty {
                            Text("Begin writing...")
                                .font(.body)
                                .foregroundStyle(Color("Ink Black").opacity(0.25))
                                .padding(.top, 8)
                                .padding(.leading, 4)
                        }

                        TextEditor(text: $editedText)
                            .font(.body)
                            .foregroundStyle(Color("Ink Black"))
                            .lineSpacing(6)
                            .scrollContentBackground(.hidden)
                            .background(Color.clear)
                            .frame(minHeight: 240)
                    }
                    .padding(.bottom, 8)

                    // Word count
                    Text("\(editedText.split(separator: " ").filter { !$0.isEmpty }.count) words")
                        .font(.caption2)
                        .tracking(1)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.bottom, 40)

                    // Save button
                    Button("Save changes") {
                        let updated = Reflection(
                            id: reflection.id,
                            discoveryTitle: reflection.discoveryTitle,
                            category: reflection.category,
                            reflectionPrompt: reflection.reflectionPrompt,
                            text: editedText,
                            date: reflection.date
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
