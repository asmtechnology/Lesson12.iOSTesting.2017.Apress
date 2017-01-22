//
//  RestaurantTableViewCellTests.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import XCTest

class RestaurantTableViewCellTests: XCTestCase {
    
    let areaKey = "area"
    let ratingKey = "rating"
    let cuisineKey = "cuisine"
    let distanceKey = "distance"
    let tubeStationKey = "tubeStation"
    let restaurantNameKey = "restaurantName"
    
    private var validDictionary: [String : AnyObject]?
    fileprivate var validRestaurant: Restaurant?
    
    override func setUp() {
        super.setUp()

        validDictionary = [String : AnyObject]()
        validDictionary![areaKey] = "Oxford Street" as AnyObject
        validDictionary![ratingKey] = "5" as AnyObject
        validDictionary![cuisineKey] = "Indian" as AnyObject
        validDictionary![distanceKey] = "0.05" as AnyObject
        validDictionary![tubeStationKey] = "Bayswater" as AnyObject
        validDictionary![restaurantNameKey] = "Curry King" as AnyObject
        
        validRestaurant = Restaurant(validDictionary)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetup_Calls_Setup_OnViewModel() {
        let expectation = self.expectation(description: "expected setup() to be called")
        
        let tableViewCell = RestaurantTableViewCell()
        
        let viewModel = MockRestaurantTableViewCellViewModel(model: validRestaurant!)
        viewModel.setupExpectation = expectation
        
        tableViewCell.viewModel = viewModel
        
        tableViewCell.setup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}
