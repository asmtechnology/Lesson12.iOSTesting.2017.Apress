//
//  RestaurantTableViewModelTests.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import XCTest

class RestaurantTableViewModelTests: XCTestCase {
    
    let areaKey = "area"
    let ratingKey = "rating"
    let cuisineKey = "cuisine"
    let distanceKey = "distance"
    let tubeStationKey = "tubeStation"
    let restaurantNameKey = "restaurantName"
    
    fileprivate var validArea: String?
    
    private var validDictionary: [String : AnyObject]?
    private var validRestaurant: Restaurant?
    fileprivate var arrayWithOneRestaurant: [Restaurant]?
    
    fileprivate var mockRestaurantTableViewController:MockRestaurantTableViewController?
    
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
        
        mockRestaurantTableViewController = MockRestaurantTableViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}




// MARK: initialization tests
extension RestaurantTableViewModelTests {
    
    func testInit_ValidArea_ValidRestaurantList_InstantiatesObject() {
        let viewModel = RestaurantTableViewModel(validArea!, restaurantList:arrayWithOneRestaurant!)
        XCTAssertNotNil(viewModel)
    }
    
    func testInit_ValidArea_InvalidValidRestaurantList_DoesNotInstantiatesObject() {
        let viewModel = RestaurantTableViewModel(validArea!, restaurantList:nil)
        XCTAssertNil(viewModel)
    }
    
    
    func testInit_ValidArea_ValidRestaurantList_CopiesAreaToIvar() {
        let viewModel = RestaurantTableViewModel(validArea!, restaurantList:arrayWithOneRestaurant!)
        
        if let lhs = validArea,
            let rhs = viewModel?.area {
            XCTAssertTrue(lhs.compare(rhs) == .orderedSame)
        }
    }
    
}

// MARK: performInitialViewSetup tests
extension RestaurantTableViewModelTests {
    
    func testPerformInitialViewSetup_Calls_SetNavigationTitle_OnView() {
        let expectation = self.expectation(description: "expected setNavigationTitle() to be called")
        mockRestaurantTableViewController!.expectationForSetNavigationTitle = expectation
        
        let viewModel = RestaurantTableViewModel(validArea!, restaurantList:arrayWithOneRestaurant!)
        viewModel!.view = mockRestaurantTableViewController
        viewModel!.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
}


// MARK: numberOfSections  tests
extension RestaurantTableViewModelTests {
    
    func testNumberOfSections_Returns1() {
        let viewModel =  RestaurantTableViewModel(validArea!, restaurantList:arrayWithOneRestaurant!)
        XCTAssertEqual(viewModel!.numberOfSections(), 1)
    }
    
}


// MARK: numberOfRowsInSection tests
extension RestaurantTableViewModelTests {
    
    func testNumberOfRowsInSection_ValidViewModel_returnsNumberOfRestaurantsInViewModel() {
        let viewModel =  RestaurantTableViewModel(validArea!, restaurantList:arrayWithOneRestaurant!)
        XCTAssertEqual(viewModel!.numberOfRowsInSection(0), 1)
    }
}



// MARK: cellViewModel tests
extension RestaurantTableViewModelTests {
    
    func testCellViewModel_RowIndexLessThan0_ReturnsNil() {
        let viewModel =  RestaurantTableViewModel(validArea!, restaurantList:arrayWithOneRestaurant!)
        XCTAssertNil(viewModel!.cellViewModel(forIndexPath: IndexPath(row: -1, section: 0)))
    }
    
    func testCellViewModel_RowIndexEqualToNumberOfRestaurants_ReturnsNil() {
        let viewModel =  RestaurantTableViewModel(validArea!, restaurantList:arrayWithOneRestaurant!)
        XCTAssertNil(viewModel!.cellViewModel(forIndexPath: IndexPath(row: 1, section: 0)))
    }
    
    func testCellViewModel_RowIndexGreaterThanNumberOfRestaurants_ReturnsNil() {
        let viewModel =  RestaurantTableViewModel(validArea!, restaurantList:arrayWithOneRestaurant!)
        XCTAssertNil(viewModel!.cellViewModel(forIndexPath: IndexPath(row: 2, section: 0)))
    }
    
    func testCellViewModel_RowIndexLessThanNumberOfRestaurants_DoesNotReturnNil() {
        let viewModel =  RestaurantTableViewModel(validArea!, restaurantList:arrayWithOneRestaurant!)
        XCTAssertNotNil(viewModel!.cellViewModel(forIndexPath: IndexPath(row: 0, section: 0)))
    }


    func testCellViewModel_ValidRowIndex_ReturnsViewModelWithExpectedModelObject() {
        let viewModel =  RestaurantTableViewModel(validArea!, restaurantList:arrayWithOneRestaurant!)
        let cellViewModel = viewModel!.cellViewModel(forIndexPath: IndexPath(row: 0, section: 0))
        
        let expectedModelObject = viewModel!.restaurantList[0]
        XCTAssertEqual(cellViewModel!.model!, expectedModelObject)
    }
    
}

