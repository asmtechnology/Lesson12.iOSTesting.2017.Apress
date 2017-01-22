//
//  RestaurantTableViewCellViewModelTests.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import XCTest

class RestaurantTableViewCellViewModelTests: XCTestCase {
    
    let areaKey = "area"
    let ratingKey = "rating"
    let cuisineKey = "cuisine"
    let distanceKey = "distance"
    let tubeStationKey = "tubeStation"
    let restaurantNameKey = "restaurantName"
    
    private var validDictionary: [String : AnyObject]?
    fileprivate var validRestaurant: Restaurant?

    var restaurantNameLabelStub:UILabelStub?
    var restaurantRatingLabelStub:UILabelStub?
    var restaurantDistanceLabelStub:UILabelStub?
    var restaurantLocationLabelStub:UILabelStub?
    var restaurantCuisineLabelStub:UILabelStub?
    
    fileprivate var mockRestaurantTableViewCell:MockRestaurantTableViewCell?
    
    override func setUp() {
        super.setUp()
        

        validDictionary = [String : AnyObject]()
        validDictionary![areaKey] = "Notting Hill" as AnyObject
        validDictionary![ratingKey] = "5" as AnyObject
        validDictionary![cuisineKey] = "Indian" as AnyObject
        validDictionary![distanceKey] = "0.05" as AnyObject
        validDictionary![tubeStationKey] = "Bayswater" as AnyObject
        validDictionary![restaurantNameKey] = "Curry King" as AnyObject
        
        validRestaurant = Restaurant(validDictionary)
        
        
        restaurantNameLabelStub = UILabelStub()
        restaurantRatingLabelStub = UILabelStub()
        restaurantDistanceLabelStub = UILabelStub()
        restaurantLocationLabelStub = UILabelStub()
        restaurantCuisineLabelStub = UILabelStub()

        mockRestaurantTableViewCell = MockRestaurantTableViewCell()
        
        mockRestaurantTableViewCell!.name = restaurantNameLabelStub!
        mockRestaurantTableViewCell!.rating = restaurantRatingLabelStub!
        mockRestaurantTableViewCell!.distance = restaurantDistanceLabelStub!
        mockRestaurantTableViewCell!.location = restaurantLocationLabelStub!
        mockRestaurantTableViewCell!.cuisine = restaurantCuisineLabelStub!
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}



// MARK: initialization tests
extension RestaurantTableViewCellViewModelTests {
    
    func testInit_NilModel_InstantiatesObject() {
        let viewModel = RestaurantTableViewCellViewModel(model: nil)
        XCTAssertNotNil(viewModel)
    }
    
    func testInit_ValidModel_InstantiatesObject() {
        let viewModel = RestaurantTableViewCellViewModel(model: validRestaurant!)
        XCTAssertNotNil(viewModel)
    }
    
    func testInit_ValidModel_CopiesModelToIvar() {
        let viewModel = RestaurantTableViewCellViewModel(model: validRestaurant)
        XCTAssertTrue(viewModel.model === validRestaurant!)
    }
}

// MARK: setup tests
extension RestaurantTableViewCellViewModelTests {
    
    func testSetup_ValidModel_ValidView_Calls_SetRestaurantLocation_OnView() {
        
        let expectation = self.expectation(description: "expected setRestaurantName() to be called")
        mockRestaurantTableViewCell!.expectationForSetRestaurantName = (expectation, validRestaurant!.restaurantName!)
        
        let viewModel = RestaurantTableViewCellViewModel(model: validRestaurant!)
        viewModel.view = mockRestaurantTableViewCell!
        
        viewModel.setup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testSetup_ValidModel_ValidView_Calls_SetRestaurantRating_OnView() {
        
        let expectedValue = "\(validRestaurant!.rating!) stars"
        
        let expectation = self.expectation(description: "expected setRestaurantRating() to be called")
        mockRestaurantTableViewCell!.expectationForSetRestaurantRating = (expectation, expectedValue)
        
        let viewModel = RestaurantTableViewCellViewModel(model: validRestaurant!)
        viewModel.view = mockRestaurantTableViewCell!
        
        viewModel.setup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testSetup_ValidModel_ValidView_Calls_SetRestaurantCuisine_OnView() {
        
        let expectation = self.expectation(description: "expected setRestaurantCuisine() to be called")
        mockRestaurantTableViewCell!.expectationForSetRestaurantCuisine = (expectation, validRestaurant!.cuisine!)
        
        let viewModel = RestaurantTableViewCellViewModel(model: validRestaurant!)
        viewModel.view = mockRestaurantTableViewCell!
        
        viewModel.setup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testSetup_ValidModel_ValidView_Calls_SetRestaurantDistance_OnView() {
        
        let expectedValue = "\(validRestaurant!.distance!) miles(s) from \(validRestaurant!.tubeStation!)"
        
        let expectation = self.expectation(description: "expected setRestarantDistance() to be called")
        mockRestaurantTableViewCell!.expectationForSetRestaurantDistance = (expectation, expectedValue)
        
        let viewModel = RestaurantTableViewCellViewModel(model: validRestaurant!)
        viewModel.view = mockRestaurantTableViewCell!
        
        viewModel.setup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testSetup_ValidModel_ValidView_Calls_SetRestaurantName_OnView() {
        
        let expectation = self.expectation(description: "expected setRestaurantName() to be called")
        mockRestaurantTableViewCell!.expectationForSetRestaurantName = (expectation, validRestaurant!.restaurantName!)
        
        let viewModel = RestaurantTableViewCellViewModel(model: validRestaurant!)
        viewModel.view = mockRestaurantTableViewCell!
        
        viewModel.setup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}

