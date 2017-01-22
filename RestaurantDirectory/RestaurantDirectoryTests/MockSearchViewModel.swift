//
//  MockSearchViewModel.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation
import XCTest

class MockSearchViewModel : SearchViewModel {

    var loadRestaurantDataExpectation:XCTestExpectation?
    var performInitialViewSetupExpectation:XCTestExpectation?
    var numberOfComponentsExpectation:XCTestExpectation?
    var numberOfRowsInComponentExpectation:XCTestExpectation?
    var titleForRowExpectation:XCTestExpectation?
    var didSelectRowExpectation:XCTestExpectation?
    var onViewListingsExpectation:XCTestExpectation?
    var viewModelForSelectedAreaExpectation:XCTestExpectation?
    
    
    override func loadRestaurantData(filePath:String?) -> Void {
        loadRestaurantDataExpectation?.fulfill()
    }
    
    override func performInitialViewSetup() {
        performInitialViewSetupExpectation?.fulfill()
    }
    
    override func numberOfComponents() -> Int {
        numberOfComponentsExpectation?.fulfill()
        return 0
    }
    
    override func numberOfRowsInComponent(_ component:Int) -> Int {
        numberOfRowsInComponentExpectation?.fulfill()
        return 0
    }
    
    override func titleForRow(_ row:Int, component:Int) -> String? {
        titleForRowExpectation?.fulfill()
        return nil
    }
    
    override func didSelectRow(_ row:Int, component:Int) -> Void {
        didSelectRowExpectation?.fulfill()
    }
    
    override func onViewListings() -> Void {
        onViewListingsExpectation?.fulfill()
    }
    
    override func viewModelForSelectedArea() -> RestaurantTableViewModel? {
        viewModelForSelectedAreaExpectation?.fulfill()
        return nil
    }
    
}
