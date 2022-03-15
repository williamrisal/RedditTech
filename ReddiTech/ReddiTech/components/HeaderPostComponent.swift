//
//  HeaderPostComponent.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 22/02/2022.
//

import SwiftUI

struct HeaderPostComponent: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "xmark")
                    .padding()
                Spacer()
            }
            Spacer()
            Text("Tire du post et suivie des commentaires")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: Alignment.leading)
                .padding()
            Text("Tire du post et suivie des commentaires")
                .frame(maxWidth: .infinity, alignment: Alignment.leading)
                .padding()
        }.frame(maxWidth: .infinity, maxHeight: 200, alignment: Alignment.leading)
            .background(
                Image("postBanner")
                    .resizable()
            )
            .foregroundColor(Color.white)
            .cornerRadius(8)
    }
}

struct HeaderPostComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderPostComponent()
    }
}
