//
//  MockRestaurantTableViewCellViewModel.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation
import XCTest

class MockRestaurantTableViewCellViewModel : RestaurantTableViewCellViewModel {
    
    var setupExpectation: XCTestExpectation?
    
    override func setup() {
        setupExpectation?.fulfill()
    }
}
