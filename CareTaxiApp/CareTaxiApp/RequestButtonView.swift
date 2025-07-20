//
//  RequestButtonView.swift
//  CareTaxiApp
//
//  Created by p10p093 on 2025/07/20.
//

import SwiftUI

struct RequestButtonView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                // 中央のコンテンツ
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: ListView()) {
                        Text("リスト")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // 必須！

                // 左上のボタン
                Button(action: {
                    print("リクエストボタンがタップされました")
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.cyan)
                            .frame(width: 80, height: 80)
                        
                        VStack(spacing: 2) {
                            Image(systemName: "sparkles")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("リクエスト")
                                .font(.caption2)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.top, 16)
                .padding(.leading, 16)
            }
        }
    }
}

#Preview {
    RequestButtonView()
}
