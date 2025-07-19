//
//  RatingDialogView.swift
//  CareTaxiApp
//
//  Created by p10p093 on 2025/07/15.
//

import SwiftUI

struct RatingDialogView: View {
    @Binding var isPresented: Bool
    @State private var rating: Int = 0
    @State private var inputText = ""

    var body: some View {
        VStack(spacing: 16) {
            Text("ドライバーの評価をお願いします")
                .font(.headline)

            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .foregroundColor(.gray)

            Text("ダミー会社名株式会社")
                .font(.body)
                .foregroundColor(.secondary)

            Divider()

            Text("今回の満足度と評価をご入力ください。")
                .font(.callout)

            HStack(spacing: 8) {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: rating >= index ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(rating >= index ? .yellow : .gray)
                        .onTapGesture {
                            rating = index
                        }
                }
            }

            TextEditor(text: $inputText)
                .frame(height: 100)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .overlay(alignment: .topLeading) {
                    if inputText.isEmpty {
                        Text("運転が丁寧で親切なドライバーさんでした")
                            .foregroundColor(Color(uiColor: .placeholderText))
                            .padding(8)
                    }
                }

            Button(action: {
                print("評価送信: \(rating) ★, コメント: \(inputText)")
                isPresented = false // 閉じる
            }) {
                Text("評価する")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(rating > 0 ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(rating == 0)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    RatingDialogView(isPresented: .constant(true))
}
