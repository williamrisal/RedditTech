//
//  SearchView.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 28/02/2022.
//

import SwiftUI

struct SearchView: View {
    
    enum Field: Hashable {
            case search
    }
    
    @State var search = ""
    @State var listRez = [SearchResultDataInner]()
    var searchService = SearchService()
    @FocusState private var focusedField: Field?
    
    var body: some View {
        
        VStack{
            // SearchBar
            HStack{
                NavigationLink(destination: ContentView(), label: {
                    Image(systemName: "arrow.backward.circle.fill").resizable().frame(width: 30, height: 30)
                        .foregroundColor(Color.blackBg)
                })
                Image(systemName: "magnifyingglass")
                TextField("Search Reddit", text: $search)
                    .padding(10)
                    .font(Font.system(size: 15, weight: .medium))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5)).onChange(of: search){
                        SearchString(str: $0)
                    }.focused($focusedField, equals: .search).onAppear {
                        focusedField = .search
                    }
            }.padding(.horizontal)

            
            // list
            List(listRez, id: \.data.id){ child in
                SearchResultComponent(sd: child).listRowSeparator(.hidden)
            }.listStyle(PlainListStyle())
        }.navigationTitle("").navigationBarHidden(true).transition(.slide).animation(.default)
    }
    
    func SearchString(str: String){
        Task {
            let rez = await searchService.getSearchResult(search: str)
            if(rez != nil){
                listRez = (rez.data?.children)!
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
