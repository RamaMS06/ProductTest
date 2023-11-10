//
//  ContentView.swift
//  ProductTest
//
//  Created by Rama Muhammad S on 09/11/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)],
        animation: .easeInOut)
    
    private var items: FetchedResults<Item>
    @State private var searchQuery = ""
    @State private var isFilterFavorite = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing){
                VStack(alignment: .leading){
                    Spacer(minLength: 16)
                    HStack{
                        Image(systemName: "magnifyingglass").resizable().frame(width: 16, height: 16).foregroundColor(.white.opacity(0.4))
                        TextField("", text: $searchQuery, prompt: Text("Cari Produk").foregroundColor(.white.opacity(0.4)))
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .tint(.white)
                            .onChange(of: searchQuery){
                                newValue in
                                items.nsPredicate = newValue.isEmpty ? nil : NSPredicate(format: "name CONTAINS[c] %@", newValue)
                            }.padding(.horizontal, 8)
                    }.padding().frame(height: 45).background(RoundedRectangle(cornerRadius: 8).stroke(Color.white.opacity(0.4), lineWidth: 1)).padding(.horizontal, 8)
                    
                    FavoriteItem(isFilterFavorite: $isFilterFavorite, items: items)
                    
                    ScrollView{
                        VStack(alignment: .leading){
                            Spacer(minLength: 16)
                            Text("Berdasarkan pencarianmu").font(.title3).bold().foregroundColor(.white)
                            Spacer(minLength: 16)
                            LazyVGrid(columns: [
                                GridItem(.flexible(), spacing: 16),
                                GridItem(.flexible(), spacing: 16)
                            ], spacing: 24){
                                ForEach(items, id: \.self){
                                    item in
                                    ProductItemView(product: item, tapFavorite: {
                                        ProductController.shared.updateProduct(item: item, viewContext: viewContext)
                                    })
                                }
                            }
                        }
                    }.padding(.horizontal, 8)
                }.onAppear{
                    if items.isEmpty{
                        ProductController.shared.fetchProduct(viewContext: viewContext)
                    }
                }.background(.black.opacity(0.85))
                
            }
            
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
