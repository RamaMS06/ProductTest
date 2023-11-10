//
//  ItemView.swift
//  ProductTest
//
//  Created by Rama Muhammad S on 09/11/23.
//

import SwiftUI

struct ProductItemView: View {
    let product: Item
    var tapFavorite: () -> ()

    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 16)
                .fill(.black.opacity(0.5))
            VStack(alignment: .center){
                AsyncImage(url: URL(string: product.imageURL ?? ""), scale: 3){
                    phase in
                    if let image = phase.image {
                        image.resizable().aspectRatio(contentMode: .fill).frame(alignment: .center)
                    }else if phase.error != nil{
                        Text("Failed to load image")
                    }
                    else{
                        ProgressView()
                    }
                }.clipShape(RoundedRectangle(cornerRadius: 16))
                VStack(alignment: .leading){
                    GeometryReader{ geo in
                        if product.newest{
                            Text("Produk Terbaru").font(.system(size: 12, weight: .bold)).foregroundColor(.orange).shimmer(.init(tint: .white.opacity(0.5), highlight: .white, blur: 5, speed: 1.5))
                        }else{
                            EmptyView()
                        }
                    }
                    GeometryReader{
                        geo in
                        Text(product.name ?? "").lineLimit(1).frame(width: geo.size.width, alignment: .leading).foregroundColor(.white).font(.system(size: 14, weight: .semibold))
                    }
                    Spacer(minLength: 12)
                    GeometryReader{
                        geo in
                        Text(product.price.validateDiscount(discount: product.discount).formattedAsRupiah).font(.system(size: 18, weight: .heavy)).foregroundColor(.white)
                    }
                    Spacer(minLength: 16)
                    GeometryReader{
                        geo in
                        HStack(alignment: .firstTextBaseline){
                            Text(product.price.formattedAsRupiah).font(.system(size: 12)).foregroundColor(.white.opacity(0.6)).strikethrough(true, color: .white.opacity(0.6))
                            Text("\(product.discount)%").font(.system(size: 13)).foregroundColor(Color(uiColor: .systemRed)).bold()
                        }
                    }
                    
                    Spacer(minLength: 18)
                    ZStack{
                        if product.cashback == 0 {
                            EmptyView()
                        }else{
                            Text("Cashback \(product.cashback)%").foregroundColor(.white.opacity(0.9)).font(.system(size: 12, weight: .bold)).padding(.horizontal, 4).padding(.vertical, 4)
                        }
                    }.background(Color(uiColor: .systemGreen)).clipShape(RoundedRectangle(cornerRadius: 4))
                    
                    HStack{
                        Spacer()
                        Image(systemName: product.isFavorite ? "bookmark.fill" : "bookmark")
                            .foregroundColor(Color(uiColor: product.isFavorite ? .systemYellow : .white))
                            .onTapGesture {
                                self.tapFavorite()
                            }
                    }
                    
                }.padding(.bottom, 16).padding(.leading, 8).padding(.trailing, 8)
            }
        }
    }
    
    private func addToFavorites(){
        let viewContext = PersistenceController.preview.container.viewContext
        
        viewContext.perform {
            product.isFavorite.toggle()
            do{
                try viewContext.save()
            }catch{
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
