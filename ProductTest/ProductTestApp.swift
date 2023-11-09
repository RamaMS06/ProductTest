//
//  ProductTestApp.swift
//  ProductTest
//
//  Created by Rama Muhammad S on 09/11/23.
//

import SwiftUI

@main
struct ProductTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
