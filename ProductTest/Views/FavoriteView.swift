//
//  FavoriteView.swift
//  ProductTest
//
//  Created by Rama Muhammad S on 10/11/23.
//

import SwiftUI

struct FavoriteView: View {
   
    var items: [Item] = []
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    VStack(alignment: .leading){
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 16),
                            GridItem(.flexible(), spacing: 16)
                        ], spacing: 20){
                            ForEach(items, id: \.self){
                                item in
                            }
                        }
                    }
                }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
