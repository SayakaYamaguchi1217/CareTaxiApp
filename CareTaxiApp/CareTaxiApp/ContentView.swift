//
//  ContentView.swift
//  CareTaxiApp
//
//  Created by p10p093 on 2025/07/15.
//

import SwiftUI

struct ContentView: View {
    @State private var showRatingDialog = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 背景画面（例：ホーム）
                VStack(spacing: 20) {
                    Text("介護タクシーアプリ")
                        .font(.title)
                        .padding()
                    
                    Button(action: {
                        showRatingDialog = true
                    }) {
                        Text("ドライバーを評価する")
                            .frame(width: 200, height: 44)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: ListView()) {
                        Text("List")
                            .frame(width: 200, height: 44)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: RequestButtonView()) {
                        Text("リクエストボタン")
                            .frame(width: 200, height: 44)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: ArrangementView()) {
                        Text("配置")
                            .frame(width: 200, height: 44)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("新規登録画面")
                            .frame(width: 200, height: 44)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            
            // ダイアログが表示されているときだけ表示
            if showRatingDialog {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                RatingDialogView(isPresented: $showRatingDialog)
                    .transition(.scale)
                    .zIndex(1)
            }
        }
        .animation(.easeInOut, value: showRatingDialog) // 表示アニメーション
    }
}

#Preview {
    ContentView()
}
