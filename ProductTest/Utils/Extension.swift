//
//  Extension.swift
//  ProductTest
//
//  Created by Rama Muhammad S on 09/11/23.
//

import Foundation

extension Double {
    var formattedAsRupiah: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal

        if let formattedValue = formatter.string(from: NSNumber(value: ceil(self))) {
            return "Rp \(formattedValue)"
        }
        return ""
    }
    
    func validateDiscount(discount: Int64) -> Double{
        let valueDiscount = Double(discount) / 100 * self
        let totalDiscount = self - valueDiscount
        return totalDiscount
    }
}
