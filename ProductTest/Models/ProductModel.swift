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
         ProductModel(name: "Lenovo Legion Go Ryzen Z1 Extreme 512GB SSD 16GB IPS Touch Win11", isProductNew: false, image: "https://images.tokopedia.net/img/cache/900/VqbcmM/2023/11/8/ddd972d0-7054-4116-af13-96b90096656f.jpg", cashback: 0, price: 13499000, discount: 18),
         ProductModel(name: "SONY Bravia OLED A80L 4K HDR Google TV 55 Inch XR-55A80L FREE ANTENNA", isProductNew: false, image: "https://images.tokopedia.net/img/cache/900/VqbcmM/2023/8/3/b96f5443-604d-47ea-9edd-cdd7cb0589d4.jpg", cashback: 0, price: 13499000, discount: 18),
         ProductModel(name: "Apple iPad Pro 2021 M1 Chip 11 inch 128GB 256GB 512GB 1TB 2TB - 128GB Wifi, Spacegray CPO", isProductNew: true, image: "https://images.tokopedia.net/img/cache/900/VqbcmM/2023/9/19/47ab242a-3552-418e-bbf6-b585efad4d49.jpg", cashback: 15, price: 10650000, discount: 14),
         ProductModel(name: "Samsung Galaxy A54 5G 8/256GB - Awesome Violet", isProductNew: true, image: "https://images.tokopedia.net/img/cache/900/VqbcmM/2023/10/11/51420256-9571-4d10-931e-d41918c12427.png", cashback: 4, price: 5999000, discount: 6)
    ]
}
