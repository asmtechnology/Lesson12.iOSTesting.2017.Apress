//
//  MockSearchViewController.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//


import Foundation
import XCTest

class MockSearchViewController : SearchViewController {
 
    var expectationForSetNavigationTitle:XCTestExpectation?
    var expectationForEnableRestaurantListingsButton:(XCTestExpectation, Bool)?
    var expectationForDisplayResultsScreen:XCTestExpectation?
    
    var displayResultsScreenCalled:Bool
    
    init() {
        displayResultsScreenCalled = false
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        displayResultsScreenCalled = false
        super.init(coder: aDecoder)
    }
    
    override func setNavigationTitle(_ title:String) {
        expectationForSetNavigationTitle?.fulfill()
        super.setNavigationTitle(title)
    }
    
    override func enableRestaurantListingsButton(_ state:Bool) {
        guard let (expectation, expectedValue) = self.expectationForEnableRestaurantListingsButton else {
            super.enableRestaurantListingsButton(state)
            return
        }
        
        if state == expectedValue {
            expectation.fulfill()
        }
    
        super.enableRestaurantListingsButton(state)
    }
    
    override func displayResultsScreen() {
        expectationForDisplayResultsScreen?.fulfill()
        displayResultsScreenCalled = true
    }
}
