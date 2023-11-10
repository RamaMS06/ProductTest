//
//  RupiahFormatter.swift
//  ProductTestTests
//
//  Created by Rama Muhammad S on 09/11/23.
//

import XCTest
@testable import ProductTest

final class RupiahFormatterTests: XCTestCase {
   
    func testRupiahFormatter3Digit() throws{
        let value = 10000.0
        let rupiahFormat = value.formattedAsRupiah
        
        XCTAssertEqual(rupiahFormat, "Rp 10.000")
    }
    
    func testRupiahFormatter6Digit() throws{
        let value = 1500000.0
        let rupiahFormat = value.formattedAsRupiah
        
        XCTAssertEqual(rupiahFormat, "Rp 1.500.000")
    }
    
    func testValidateDiscount() throws{
        let value = 20000.0
        let discountValue = value.validateDiscount(discount: 31)
        
        XCTAssertEqual(discountValue, 13800.0)
    }

}
