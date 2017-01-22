//
//  RestaurantTableViewControllerTests.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import XCTest

class RestaurantTableViewControllerTests: XCTestCase {
    
    let areaKey = "area"
    let ratingKey = "rating"
    let cuisineKey = "cuisine"
    let distanceKey = "distance"
    let tubeStationKey = "tubeStation"
    let restaurantNameKey = "restaurantName"
    
    fileprivate var validArea: String?
    
    private var validDictionary: [String : AnyObject]?
    fileprivate var validRestaurant: Restaurant?
    fileprivate var arrayWithOneRestaurant: [Restaurant]?
    
    override func setUp() {
        super.setUp()

        validArea = "Oxford Street"
        
        validDictionary = [String : AnyObject]()
        validDictionary![areaKey] = validArea as AnyObject
        validDictionary![ratingKey] = "5" as AnyObject
        validDictionary![cuisineKey] = "Indian" as AnyObject
        validDictionary![distanceKey] = "0.05" as AnyObject
        validDictionary![tubeStationKey] = "Bayswater" as AnyObject
        validDictionary![restaurantNameKey] = "Curry King" as AnyObject
        
        validRestaurant = Restaurant(validDictionary)
        
        arrayWithOneRestaurant = [Restaurant]()
        arrayWithOneRestaurant?.append(validRestaurant!)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewDidLoad_Calls_PerformInitialSetup_OnViewModel() {
        
        let expectation = self.expectation(description: "expected performInitialViewSetup() to be called")
        
        let tableViewController = RestaurantTableViewController()
        
        let viewModel = MockRestaurantTableViewModel(validArea!, restaurantList: arrayWithOneRestaurant)
        viewModel!.performInitialViewSetupExpectation = expectation
        
        tableViewController.viewModel = viewModel
        
        tableViewController.viewDidLoad()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testNumberOfSections_Calls_NumberOfSections_OnViewModel() {
        let expectation = self.expectation(description: "expected numberOfSections() to be called")
        
        let tableViewController = RestaurantTableViewController()
        
        let viewModel = MockRestaurantTableViewModel(validArea!, restaurantList: arrayWithOneRestaurant)
        viewModel!.numberOfSectionsExpectation = expectation
        
        tableViewController.viewModel = viewModel
        
        let _ = tableViewController.numberOfSections(in: UITableViewStub())
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}
