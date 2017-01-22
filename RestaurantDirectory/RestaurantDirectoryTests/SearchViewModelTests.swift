//
//  SearchViewModelTests.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import XCTest

class SearchViewModelTests: XCTestCase {
    
    fileprivate var mockSearchViewController:MockSearchViewController?
    
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
    
    fileprivate var dictionaryWithOneKey: [String: [Restaurant]]?
    
    fileprivate var validRestaurantDataFile1:String?
    
    var locationPickerStub:UIPickerViewStub?
    var viewRestaurantButtonStub:UIButtonStub?
    
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

        dictionaryWithOneKey = [String: [Restaurant]]()
        dictionaryWithOneKey![validArea!] = arrayWithOneRestaurant!
        
        let bundle = Bundle(for: type(of:self))
        validRestaurantDataFile1 = bundle.path(forResource: "ValidRestaurantDataFile1", ofType: "json")
        
        locationPickerStub = UIPickerViewStub()
        viewRestaurantButtonStub = UIButtonStub()
        
        mockSearchViewController = MockSearchViewController()
        mockSearchViewController!.locationPicker = locationPickerStub!
        mockSearchViewController!.viewRestaurantButton = viewRestaurantButtonStub!
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}

// MARK: initialization tests
extension SearchViewModelTests {
    
    func testInit_InstantiatesObject() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        XCTAssertNotNil(viewModel)
    }
    
    func testInit_CopiesViewToIvar() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        XCTAssertTrue(viewModel.view! as! MockSearchViewController === mockSearchViewController!)
    }
}

// MARK: loadRestaurantData tests
extension SearchViewModelTests {
    
    func testLoadRestaurantData_NilFilePath_DoesNotChange_RestaurantsDictionary() {

        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        viewModel.loadRestaurantData(filePath: nil)
        XCTAssertTrue(viewModel.restaurants.keys.count == 1)
    }
    
    func testLoadRestaurantData_InvalidFilePath_DoesNotChange_RestaurantsDictionary() {
        
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        viewModel.loadRestaurantData(filePath: "/acc/def.json")
        XCTAssertTrue(viewModel.restaurants.keys.count == 1)
    }
    
    func testLoadRestaurantData_ValidFilePath_RestaurantsDictionaryHasExpectedNumberOfKeys() {
        
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        viewModel.loadRestaurantData(filePath: validRestaurantDataFile1)
        XCTAssertTrue(viewModel.restaurants.keys.count == 3)
    }

}


// MARK: performInitialViewSetup tests
extension SearchViewModelTests {
    
    func testPerformInitialViewSetup_Calls_SetNavigationTitle_OnView() {
        let expectation = self.expectation(description: "expected setNavigationTitle() to be called")
        mockSearchViewController!.expectationForSetNavigationTitle = expectation
        
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitialViewSetup_Calls_EnableRestaurantListingsButton_WithFalse() {
        let expectation = self.expectation(description: "expected enableRestaurantListings(false) to be called")
        mockSearchViewController!.expectationForEnableRestaurantListingsButton = (expectation, false)
        
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}


// MARK: numberOfComponents  tests
extension SearchViewModelTests {
    
    func testNumberOfComponents_Returns1() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        XCTAssertEqual(viewModel.numberOfComponents(), 1)
    }
    
}

// MARK: numberOfRowsInComponent  tests
extension SearchViewModelTests {
    
    func testNumberOfRowsInComponent_Returns_NumberOfKeysInRestaurantsDictionary() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        XCTAssertEqual(viewModel.numberOfRowsInComponent(0), dictionaryWithOneKey!.keys.count)
    }
    
}



// MARK: titleForRow  tests
extension SearchViewModelTests {
    
    func testTitleForRow_ValidRow_Returns_ExpectedKeyFromDictionary() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        let title = viewModel.titleForRow(0, component:0)!
        XCTAssertTrue(title.compare(validArea!) == .orderedSame)
    }
    
    func testTitleForRow_NegativeRowIndex_Returns_Nil() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        XCTAssertNil(viewModel.titleForRow(-1, component:0))
    }
    
    func testTitleForRow_RowIndexEqualToNumberOfKeys_Returns_Nil() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        XCTAssertNil(viewModel.titleForRow(1, component:0))
    }
    
    func testTitleForRow_RowIndexGreaterThanNumberOfKeys_Returns_Nil() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        XCTAssertNil(viewModel.titleForRow(2, component:0))
    }
    
}



// MARK: didSelectRow  tests
extension SearchViewModelTests {
    
    func testDidSelectRow_ValidRow_UpdatedSelectedAreaIvar() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        viewModel.didSelectRow(0, component: 0)
        XCTAssertTrue(viewModel.selectedArea!.compare(validArea!) == .orderedSame)
    }
    
    func testDidSelectRow_ValidRow_Calls_EnableRestaurantListingsButton_WithTrue() {
        
        let expectation = self.expectation(description: "expected enableRestaurantListings(true) to be called")
        mockSearchViewController!.expectationForEnableRestaurantListingsButton = (expectation, true)

        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        viewModel.didSelectRow(0, component: 0)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testTitleForRow_NegativeRowIndex_DoesNotUpdateSelectedAreaIvar() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        viewModel.selectedArea = "Canary Wharf"
        viewModel.didSelectRow(-1, component: 0)
        XCTAssertTrue(viewModel.selectedArea!.compare(validArea!) != .orderedSame)
    }
    
    func testTitleForRow_RowIndexEqualToNumberOfKeys_DoesNotUpdateSelectedAreaIvar() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        viewModel.selectedArea = "Canary Wharf"
        viewModel.didSelectRow(1, component: 0)
        XCTAssertTrue(viewModel.selectedArea!.compare(validArea!) != .orderedSame)
    }
    
    func testTitleForRow_RowIndexGreaterThanNumberOfKeys_DoesNotUpdateSelectedAreaIvar() {
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        viewModel.selectedArea = "Canary Wharf"
        viewModel.didSelectRow(2, component: 0)
        XCTAssertTrue(viewModel.selectedArea!.compare(validArea!) != .orderedSame)
    }
    
}



// MARK: onViewListings  tests
extension SearchViewModelTests {
    
    func testOnViewListings_Calls_DisplayResultsScreen() {
        
        let expectation = self.expectation(description: "expected displayResultsScreen() to be called")
        mockSearchViewController!.expectationForDisplayResultsScreen = expectation
        
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        
        viewModel.onViewListings()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}



// MARK: viewModelForSelectedArea  tests
extension SearchViewModelTests {

    func testViewModelForSelectedArea_NilSelectedArea_ReturnsNil() {
        
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        viewModel.selectedArea = nil
        
        XCTAssertNil(viewModel.viewModelForSelectedArea())
    }
    
    func testViewModelForSelectedArea_InvalidSelectedArea_ReturnsNil() {
        
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        viewModel.selectedArea = "Canary Wharf"
        
        XCTAssertNil(viewModel.viewModelForSelectedArea())
    }
    
    func testViewModelForSelectedArea_ValidSelectedArea_DoesNotReturnNil() {
        
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        viewModel.selectedArea = validArea!
        
        XCTAssertNotNil(viewModel.viewModelForSelectedArea())
    }
    
    func testViewModelForSelectedArea_ValidSelectedArea_ReturnsTableViewCellViewModel_WithSelectedAreaCopiedToIvar() {
        
        let viewModel = SearchViewModel(view: mockSearchViewController!)
        viewModel.restaurants = dictionaryWithOneKey!
        viewModel.selectedArea = validArea!
        
        let tableViewModel = viewModel.viewModelForSelectedArea()
        XCTAssertTrue(tableViewModel!.area.compare(validArea!) == .orderedSame)
    }
    
    
}


