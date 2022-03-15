//
//  DataController.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 20/02/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "RedditData")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
//                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
