//
//  ProductController.swift
//  ProductTest
//
//  Created by Rama Muhammad S on 10/11/23.
//

import Foundation
import CoreData

class ProductController{
    static let shared = ProductController()
    
    func fetchProduct(viewContext: NSManagedObjectContext){
        
        for data in ProductModel.dataProduct{
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
        
        do{
            try viewContext.save()
        }catch{}
    }
    
    func updateProduct(item: Item, viewContext: NSManagedObjectContext){
        viewContext.perform {
            item.isFavorite.toggle()
            
            let product = Favorite(context: viewContext)
            product.addToData(item)
            
            do{
                try viewContext.save()
            }catch{
            }
        }
    }
}
