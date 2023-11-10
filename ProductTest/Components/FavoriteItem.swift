//
//  FavoriteItem.swift
//  ProductTest
//
//  Created by Rama Muhammad S on 10/11/23.
//

import SwiftUI

struct FavoriteItem: View{
    @Binding var isFilterFavorite: Bool
    var items: FetchedResults<Item>
    
    var body: some View{
        HStack{
            Image(systemName: isFilterFavorite ? "star.fill" : "star").foregroundColor(Color(uiColor: isFilterFavorite ? .systemYellow : .white)).frame(width: 10)
            Text("Filter").font(.system(size: 16, weight: isFilterFavorite ? .bold : .light)).foregroundColor(isFilterFavorite ? .yellow : .white)
        }.padding(.vertical, 4).padding(.horizontal, 10).background(RoundedRectangle(cornerRadius: 8).stroke(Color.white.opacity(0.4))).padding(.horizontal, 8).padding(.top, 8)
            .onTapGesture {
                isFilterFavorite.toggle()
                items.nsPredicate = isFilterFavorite ? NSPredicate(format: "isFavorite = %d", true) : nil
            }
    }
    
}

struct FavoriteItem_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
