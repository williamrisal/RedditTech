//
//  UserSettingsComponent.swift
//  ReddiTech
//
//  Created by Anthony Luong on 08/03/2022.
//

import SwiftUI

struct UserSettingsComponent: View {
    
    let userPreferences = UserPreferencesService()
    @State var user = UserPreferences()
    @State var userPref : UserPreferences
    @State var age : Bool
    @State var beta : Bool
    @State var autoPlay : Bool
    @State var design_beta : Bool
    @State var hideUps : Bool
    @State var nightmode : Bool
    
    init(userPref: UserPreferences){
        self.userPref = userPref
        age = userPref.over_18 ?? false
        beta = userPref.beta ?? false
        autoPlay = userPref.video_autoplay ?? false
        design_beta = userPref.design_beta ?? false
        hideUps = userPref.hide_ups ?? false
        nightmode = userPref.nightmode ?? false
    }
    
    func updateUserPreferences(preferences: UserPreferences) {
        let updatedUserPreferences = UserPreferences(beta: beta, video_autoplay: autoPlay, design_beta: design_beta, over_18: age, hide_ups: hideUps, nightmode: nightmode);
        user.beta = updatedUserPreferences.beta;
        user.over_18 = updatedUserPreferences.over_18
        user.video_autoplay = updatedUserPreferences.video_autoplay
        user.design_beta = updatedUserPreferences.design_beta
        user.hide_ups = updatedUserPreferences.hide_ups
        user.nightmode = updatedUserPreferences.nightmode
        
        userPreferences.setUserPreferences(newUserPreferences: user)
        
    }
    
    var body: some View {
        VStack {
            HStack{
                Text("Content").bold().font(.title3).padding()
                Spacer()
            }
                Toggle(isOn: $age) {
                    Text("Adult Content")
                }.padding(.horizontal).padding(.bottom).onChange(of: age) { value in
                    updateUserPreferences(preferences: user)
                }
                Spacer()
                Toggle(isOn: $autoPlay) {
                    Text("Autoplay")
            }.padding(.horizontal).padding(.bottom).onChange(of: autoPlay) { value in
                updateUserPreferences(preferences: user)
            }
            Toggle(isOn: $hideUps) {
                Text("Hide Ups")
        }.padding(.horizontal).padding(.bottom).onChange(of: hideUps) { value in
            updateUserPreferences(preferences: user)
        }
            HStack{
                Text("Theme").bold().font(.title3).padding()
                Spacer()
            }
                Toggle(isOn: $nightmode) {
                    Text("Dark Mode")
                }.padding(.horizontal).padding(.bottom).onChange(of: nightmode) { value in
                    updateUserPreferences(preferences: user)
                }
            HStack{
                Text("Beta Test").bold().font(.title3).padding()
                Spacer()
            }
            
            Toggle(isOn: $beta) {
                Text("Beta")
            }.padding(.horizontal).padding(.bottom).onChange(of: beta) { value in
                updateUserPreferences(preferences: user)
            }
            
            Toggle(isOn: $design_beta) {
                Text("Design beta")
            }.padding(.horizontal).padding(.bottom).onChange(of: design_beta) { value in
                updateUserPreferences(preferences: user)
            }
        }
    }
}

