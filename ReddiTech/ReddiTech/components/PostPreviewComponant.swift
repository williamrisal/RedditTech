//
//  PostPreviewComponant.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 22/02/2022.
//

import SwiftUI
import AVKit

struct PostPreviewComponant: View {
    
    @State var findPost = ""
    @State private var scaleValue: CGFloat = 1
    var innerPost : InnerPost
    var fontSize: CGFloat = 12.0
    var kilometres: Double = 10.0
    
    func shareButton() {
        let url = URL(string: "https://reddit.com/" + innerPost.permalink!)
            let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Color.flatDarkCardBackground
            HStack {
                HStack {
                    VStack {
                        Text("\(innerPost.subreddit_name_prefixed!)").font(.callout)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .padding(.leading, 5)
                            .padding(.top, 5)
                            .frame(width: 360, alignment: .leading)
                        Text("u/\(innerPost.author!)").font(.caption)
                            .fontWeight(.regular)
                            .lineLimit(2)
                            .padding(.leading, 5)
                            .frame(width: 360, alignment: .leading)
                        
                        Text(innerPost.title!)
                            .font(.headline)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .padding(5)
                            .frame(width: 360, alignment: .leading)
                        HStack {
                            if (innerPost.post_hint == "image") {
                                if let ImageUrl = URL(string: innerPost.url_overridden_by_dest!) {
                                AsyncImage(url: ImageUrl){ image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .cornerRadius(10)
                                .frame(width: 350, height: 180, alignment: .center)
                            }
                            } else if(innerPost.is_video!) {
                                VideoView(videoURL: innerPost.secure_media?.reddit_video?.fallbackURL ?? "https://www.youtube.com/watch?v=Dbe_NKFhsy0")
                                    .frame(width: innerPost.secure_media?.reddit_video?.width == nil ? 300 : CGFloat(Double(innerPost.secure_media!.reddit_video!.width)/3.5 > 400 ? Double(300) : Double(innerPost.secure_media!.reddit_video!.width)/3.5), height: innerPost.secure_media?.reddit_video?.height == nil ? 100 :  CGFloat(Double(innerPost.secure_media!.reddit_video!.height)/3.5))
                            }
                    }
                    HStack {
                        VStack {
                            HStack {
                                Image(systemName: "arrow.up")
                                Text("\(innerPost.ups!)")
                            }.foregroundColor(.gray).frame(alignment: .bottom)
                            HStack{
                                Image(systemName: "text.bubble").padding(.leading, -10)
                                Text("\(innerPost.num_comments!)")
                            }.foregroundColor(.gray).frame(alignment: .bottom)
                        }.padding(.leading, 5).padding(.bottom, 10)
                        Spacer()
                        HStack {
                            
                            Link(destination: URL(string: "https://reddit.com" + innerPost.permalink!)!){
                                
                            }
                            Button(action: shareButton) {
                                Image(systemName: "square.and.arrow.up")
                                Text("Share")
                            }
                            
                        }
                    }
                }
            }
            .padding(.horizontal, 5)
        }
    }.transition(.slide).animation(.default)
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
