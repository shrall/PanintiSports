//
//  Persistence.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "PanintiSports")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        )
    }
}
