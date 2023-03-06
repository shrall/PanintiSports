//
//  PanintiSportsApp.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import SwiftUI

@main
struct PanintiSportsApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
