//
//  AccueilView.swift
//  ReddiTech
//
//  Created by William Risal on 14/02/2022.
//

import SwiftUI

struct AccueilView: View {
    
    @State var findPoste = ""
    @State private var scaleValue: CGFloat = 1
    var title: String
    var fontSize: CGFloat = 12.0
    var categories: [String] = ["humour","Divertissement"]
    var kilometres: Double = 10.0
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Color.flatDarkCardBackground
            HStack {
                HStack {
                    VStack {
                        Text(title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .padding(5)
                            .frame(width: 370)
                        HStack {
                            if let ImageUrl = URL(string: "https://images.unsplash.com/photo-1645359493337-f315e4fa9698?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80") {
                                AsyncImage(url: ImageUrl){ image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .cornerRadius(10)
                                .frame(width: 300, height: 120, alignment: .center)
                            }
                        }
                        HStack {
                            VStack {
                                Image(systemName: "arrow.up")
                                .padding(.horizontal, -2.0)
                                Text("1.6k")
                            }
                            Spacer()
                            ForEach(categories, id: \.self) { category in
                                CategoryPill(categoryName: category)
                            }
                        }
                    }
                }
                .padding(.horizontal, 5)
            }
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}


struct CategoryPill: View {
    
    var categoryName: String
    var fontSize: CGFloat = 12.0
    
    var body: some View {
        ZStack {
            Text(categoryName)
                .font(.system(size: fontSize, weight: .regular))
                .lineLimit(2)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.green)
                .cornerRadius(5)
        }
    }
}
extension UIColor {
    
    static let flatDarkBackground = UIColor(red: 36, green: 36, blue: 36)
    static let flatDarkCardBackground = UIColor(red: 46, green: 46, blue: 46)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
}

extension Color {
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
    
    public static var flatDarkBackground: Color {
        return Color(decimalRed: 36, green: 36, blue: 36)
    }
    
    public static var flatDarkCardBackground: Color {
        return Color("colorforlist")
    }
}

struct AccueilView_Previews: PreviewProvider {
    static var previews: some View {
        AccueilView(title: "william")
    }
}
