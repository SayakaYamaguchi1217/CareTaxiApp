//
//  SignUpView.swift
//  CareTaxiApp
//
//  Created by p10p093 on 2025/07/28.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phoneNumber: String = ""
    @State private var postalCode: String = ""
    @State private var prefecture: String = ""
    @State private var city: String = ""
    @State private var address: String = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("利用者名")
                    TextField("", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Text("メールアドレス")
                    TextField("", text: $email)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Text("パスワード")
                    SecureField("", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Text("電話番号")
                    TextField("", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Text("郵便番号")
                    TextField("", text: $postalCode)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Text("都道府県")
                    TextField("", text: $prefecture)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Text("市区町村")
                    TextField("", text: $city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Text("番地等")
                    TextField("", text: $address)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        // 登録処理
                        print("登録ボタンが押されました")
                    }) {
                        Text("登録する")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.top, 24)
                }
                .padding()
            }
            .navigationTitle("新規登録")
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


#Preview {
    SignUpView()
}
