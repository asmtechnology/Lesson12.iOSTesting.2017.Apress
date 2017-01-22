//
//  SearchViewControllerTests.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import XCTest

class SearchViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewDidLoad_Calls_PerformInitialSetup_OnViewModel() {
        
        let expectation = self.expectation(description: "expected performInitialViewSetup() to be called")
        
        let searchViewController = SearchViewController()
        
        let viewModel = MockSearchViewModel(view:searchViewController)
        viewModel.performInitialViewSetupExpectation = expectation
        
        searchViewController.viewModel = viewModel
        
        searchViewController.viewDidLoad()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testOnViewListings_Calls_OnViewListings_OnViewModel() {
        
        let expectation = self.expectation(description: "expected onViewListings() to be called")
        
        let searchViewController = SearchViewController()
        
        let viewModel = MockSearchViewModel(view:searchViewController)
        viewModel.onViewListingsExpectation = expectation
        
        searchViewController.viewModel = viewModel
        
        searchViewController.onViewListings(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testPickerViewTitleForRow_Calls_TitleForRow_OnViewModel() {
        
        let expectation = self.expectation(description: "expected titleForRow() to be called")
        
        let searchViewController = SearchViewController()
        
        let viewModel = MockSearchViewModel(view:searchViewController)
        viewModel.titleForRowExpectation = expectation
        
        searchViewController.viewModel = viewModel
        
        let _ = searchViewController.pickerView(UIPickerViewStub(), titleForRow: 0, forComponent: 0)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testPickerViewDidSelectRow_Calls_DidSelectRow_OnViewModel() {
        
        let expectation = self.expectation(description: "expected didSelectRow() to be called")
        
        let searchViewController = SearchViewController()
        
        let viewModel = MockSearchViewModel(view:searchViewController)
        viewModel.didSelectRowExpectation = expectation
        
        searchViewController.viewModel = viewModel
        
        searchViewController.pickerView(UIPickerViewStub(), didSelectRow: 0, inComponent: 0)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testNumberOfComponentsInPickerView_Calls_NumberOfComponents_OnViewModel() {
        
        let expectation = self.expectation(description: "expected numberOfComponents() to be called")
        
        let searchViewController = SearchViewController()
        
        let viewModel = MockSearchViewModel(view:searchViewController)
        viewModel.numberOfComponentsExpectation = expectation
        
        searchViewController.viewModel = viewModel
        
        let _ = searchViewController.numberOfComponents(in: UIPickerViewStub())
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPickerViewNumberOfRowsInComponent_Calls_NumberOfRowsInComponent_OnViewModel() {
        
        let expectation = self.expectation(description: "expected numberOfRowsInComponent() to be called")
        
        let searchViewController = SearchViewController()
        
        let viewModel = MockSearchViewModel(view:searchViewController)
        viewModel.numberOfRowsInComponentExpectation = expectation
        
        searchViewController.viewModel = viewModel
        
        let _ = searchViewController.pickerView(UIPickerViewStub(), numberOfRowsInComponent: 0)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

    
}
