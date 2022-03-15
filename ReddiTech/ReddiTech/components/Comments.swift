//
//  Comments.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 22/02/2022.
//

import SwiftUI

struct Comments: View {
    var body: some View {
        VStack{
            Text("Adison • 2deh")
                .frame(maxWidth: .infinity, alignment: Alignment.leading)
            Text("Voici le comentaire")
                .frame(maxWidth: .infinity, alignment: Alignment.leading)
            HStack{
                Image(systemName: "arrow.up")
                Text("Vote")
                Image(systemName: "arrow.down")
            }
            .frame(maxWidth: .infinity, alignment: Alignment.trailing)
        }
        .padding()
    }
}

struct Comments_Previews: PreviewProvider {
    static var previews: some View {
        Comments()
    }
}
