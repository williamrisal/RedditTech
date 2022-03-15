//
//  Utils.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 22/02/2022.
//

import Foundation

struct IdentifablePost: Codable, Identifiable{
    var id = UUID()
    var data : InnerPost
}

struct utils {
    func pushDefault(value : String, key: String){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getDefault(key: String) -> Any{
        return UserDefaults.standard.object(forKey: key) as? String ?? "no exist or nil"
    }
    
    func splintLink(link : String) -> String? {
        if(link.contains("?")){
            let str = link.split(separator: "?")
            if(str.count > 1){
                return String(link.split(separator: "?")[0])
            }else{
                return nil
            }
            
        } else {
            return nil
        }
    }
    
    func timestampToDate(timestamp: Double) -> String {
        let epocTime = TimeInterval(timestamp)
        let myDate = Date(timeIntervalSince1970: epocTime)
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        let string = formatter.localizedString(for: myDate, relativeTo: Date())
        return (string)
    }
}
