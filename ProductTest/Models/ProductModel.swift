//
//  ProductModel.swift
//  ProductTest
//
//  Created by Rama Muhammad S on 09/11/23.
//

import Foundation

struct ProductModel{
    var name: String
    var isProductNew: Bool
    var image: String
    var cashback: Int64
    var price: Double
    var discount: Int64
    var isFavorite: Bool = false
    
    static let dataProduct = [
         ProductModel(name: "ADVAN Laptop 360 Stylus 2in1 Touchscreen - Intel i3 14.1'' FHD IPS", isProductNew: true, image: "https://images.tokopedia.net/img/cache/900/VqbcmM/2023/8/1/b67e7467-07bd-42f3-b46d-310f495c55e2.jpg", cashback: 8, price: 5999999, discount: 45, isFavorite: true),
         ProductModel(name: "Haylou Solar Pro LS18 Smartwatch Canggih dengan fitur AOD ip68", isProductNew: true, image: "https://images.tokopedia.net/img/cache/900/VqbcmM/2023/10/31/fb256efb-c1b7-498e-97ec-d82d0bdd04c3.jpg", cashback: 4, price: 579000, discount: 14),
         ProductModel(name: "Lenovo Legion Go Ryzen Z1 Extreme 512GB SSD 16GB IPS Touch Win11", isProductNew: false, image: "https://images.tokopedia.net/img/cache/900/VqbcmM/2023/11/8/ddd972d0-7054-4116-af13-96b90096656f.jpg", cashback: 0, price: 13499000, discount: 18)
    ]
}
