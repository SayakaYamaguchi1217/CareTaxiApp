//
//  ListView.swift
//  CareTaxiApp
//
//  Created by p10p093 on 2025/07/20.
//

import SwiftUI

struct ListView: View {
    @State private var isAccountInfoActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.systemGroupedBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    List {
                        Section {
                            // 遷移先リンク（非表示）＋ onTapGesture
                            ZStack {
                                // SettingsRowの部分をHStackでラップして、Spacerで幅を広げる
                                HStack {
                                    SettingsRow(icon: "person.circle.fill", iconColor: .blue, text: "アカウント情報")
                                    Spacer() // これで右端までスペースを確保
                                }
                                .contentShape(Rectangle()) // タップ判定を行全体に拡げる
                                .onTapGesture {
                                    isAccountInfoActive = true
                                }
                                
                                NavigationLink(destination: AccountInfoView(), isActive: $isAccountInfoActive) {
                                    EmptyView()
                                }
                                .hidden()
                            }
                            
                            SettingsRow(icon: "envelope.circle.fill", iconColor: .pink, text: "お問い合わせ")
                            SettingsRow(icon: "doc.text.fill", iconColor: .orange, text: "利用規約")
                            SettingsRow(icon: "doc.plaintext.fill", iconColor: .gray, text: "ライセンス情報")
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    .frame(height: 300)
                    
                    // ログアウトボタン
                    Button(action: {
                        print("ログアウト tapped")
                    }) {
                        Text("ログアウト")
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(UIColor.secondarySystemGroupedBackground))
                            .cornerRadius(10)
                            .shadow(radius: 1)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .navigationTitle("設定")
            }
        }
    }
}

struct SettingsRow: View {
    let icon: String
    let iconColor: Color
    let text: String
    var onTextTap: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .background(iconColor)
                .cornerRadius(5)
            
            if let onTextTap = onTextTap {
                Text(text)
                    .onTapGesture {
                        onTextTap()
                    }
            } else {
                Text(text)
            }
            
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

struct AccountInfoView: View {
    var body: some View {
        Text("アカウント情報画面")
            .font(.title)
            .navigationTitle("アカウント情報")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ListView()
}
