//
//  MockRestaurantTableViewModel.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation
import XCTest

class MockRestaurantTableViewModel : RestaurantTableViewModel {
    
    var performInitialViewSetupExpectation: XCTestExpectation?
    var numberOfSectionsExpectation: XCTestExpectation?
    var numberOfRowsInSectionExpectation: XCTestExpectation?
    var cellViewModelExpectation: (XCTestExpectation, expectedIndexPath:IndexPath)?
    
    override func performInitialViewSetup() {
        performInitialViewSetupExpectation?.fulfill()
    }
    
    override func numberOfSections() -> Int {
        numberOfSectionsExpectation?.fulfill()
        return 0
    }
    
    override func numberOfRowsInSection(_ section:Int) -> Int {
        numberOfRowsInSectionExpectation?.fulfill()
        return 0
    }
    
    override func cellViewModel(forIndexPath indexPath:IndexPath) -> RestaurantTableViewCellViewModel? {
        if let (expectation, expectedValue) = self.cellViewModelExpectation {
            if indexPath == expectedValue {
                expectation.fulfill()
            }
        }
        
        return nil
    }

    
}
