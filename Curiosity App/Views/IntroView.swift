//
//  IntroView.swift
//  Curiosity App
//
//  Created by Emily Prieto on 7/9/26.
//
import SwiftUI

struct IntroView: View {
    var onEnter: () -> Void

    @State private var displayedText = ""
    @State private var showTagline = false
    @State private var showButton = false

    let fullTitle = "Curio"

    var body: some View {
        ZStack {
            Color("Soft Linen").ignoresSafeArea()

            VStack(spacing: 24) {
                Spacer()

                // Companion placeholder — replace with drawing later
                Text("✦")
                    .font(.system(size: 48))
                    .foregroundStyle(Color("Burgundy"))

                // Typing title
                Text(displayedText)
                    .font(.system(size: 64, weight: .bold, design: .serif))
                    .foregroundStyle(Color("Ink Black"))

                // Tagline
                Text("a place for curious minds")
                    .font(.subheadline)
                    .italic()
                    .foregroundStyle(Color("Dusty Olive"))
                    .opacity(showTagline ? 1 : 0)

                Spacer()

                // Button
                Button("Open my journal") {
                    onEnter()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Burgundy"))
                .foregroundStyle(.white)
                .clipShape(Capsule())
                .padding(.horizontal, 40)
                .opacity(showButton ? 1 : 0)
                .padding(.bottom, 48)
            }
        }
        .onAppear {
            typeTitle()
        }
    }

    func typeTitle() {
        for (index, char) in fullTitle.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.15) {
                displayedText.append(char)

                if displayedText.count == fullTitle.count {
                    withAnimation(.easeIn(duration: 0.6).delay(0.3)) {
                        showTagline = true
                    }
                    withAnimation(.easeIn(duration: 0.6).delay(0.6)) {
                        showButton = true
                    }
                }
            }
        }
    }
}
