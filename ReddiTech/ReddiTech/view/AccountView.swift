//
//  AccountView.swift
//  ReddiTech
//
//  Created by William Risal on 01/03/2022.
//

import SwiftUI

struct AccountView: View {
    
    @State var DisplayedName = ""
    let userPreferences = UserPreferencesService()
    @State var user : UserPreferences? = nil
    @State var userInf : UserInfos? = nil
    let userservice = UserInfosService()
    
    
    func loadData(){
        let t = userservice.getUserInfos()
        let usertemp = userPreferences.getUserPreferences()
        self.user = usertemp
        self.userInf = t
    }

    var body: some View {
            ScrollView {
                VStack {
                    HStack{
                        Text("YOUR ACCOUNT").bold().font(.title3).padding([.top, .leading])
                        Spacer()
                    }
                    if(userInf != nil){
                        ProfilPreviewComposant(user: userInf!)
                    }
                    if(user != nil){
                        UserSettingsComponent(userPref: self.user!)
                    }
                }
            }.navigationTitle("").navigationBarHidden(true).onAppear(perform: loadData)
    }
}
