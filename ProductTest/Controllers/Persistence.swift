//
//  Persistence.swift
//  ProductTest
//
//  Created by Rama Muhammad S on 09/11/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for data in ProductModel.dataProduct {
            let newItem = Item(context: viewContext)
            newItem.name = data.name
            newItem.newest = data.isProductNew
            newItem.imageURL = data.image
            newItem.cashback = data.cashback
            newItem.price = data.price
            newItem.timestamp = Date()
            newItem.discount = data.discount
            newItem.isFavorite = data.isFavorite
        }
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ProductTest")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
