//
//  LoginView.swift
//  ReddiTech
//
//  Created by William Risal on 15/02/2022.
//

import SwiftUI

struct LoginView: View {
    @State var email:String  = ""
    @State var password:String = ""
    @State var colorButton =  Color.green
    var body: some View {
        VStack{
            TextField("Email", text: $email)
                .padding()
                .background(Color(UIColor.lightGray))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(UIColor.lightGray))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button(action: {colorButton = Color.gray} ) {
                Text("LOGIN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(colorButton)
                .cornerRadius(15.0)            }
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
