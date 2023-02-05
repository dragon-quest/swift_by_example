//
//  CounterApp.swift
//  Counter
//

import SwiftUI

@main
struct CounterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
