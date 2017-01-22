//
//  RestaurantDirectorySpecification.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 18/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation
import Quick
import Nimble

class RestaurantDirectorySpecification : QuickSpec {
    
    // mocks and stubs for tests around SearchViewController funcationality
    var locationPickerStub:UIPickerViewStub?
    var viewRestaurantButtonStub:UIButtonStub?
    var searchViewController:MockSearchViewController?
    var searchViewModel:SearchViewModel?
    
    // mocks and stubs for tests around RestaurantTableViewCell funcationality
    var restaurantNameLabelStub:UILabelStub?
    var restaurantRatingLabelStub:UILabelStub?
    var restaurantDistanceLabelStub:UILabelStub?
    var restaurantLocationLabelStub:UILabelStub?
    var restaurantCuisineLabelStub:UILabelStub?
    var restaurantTableViewCell:MockRestaurantTableViewCell?
    
    var validRestaurantDataFile1:String?
    var validRestaurant: Restaurant?
    var cellViewModel: RestaurantTableViewCellViewModel?
    
    func prepareForSearchViewControllerTests() {
        let bundle = Bundle(for: type(of:self))
        validRestaurantDataFile1 = bundle.path(forResource: "ValidRestaurantDataFile1", ofType: "json")
        
        locationPickerStub = UIPickerViewStub()
        viewRestaurantButtonStub = UIButtonStub()
        
        searchViewController = MockSearchViewController()
        searchViewController!.locationPicker = locationPickerStub!
        searchViewController!.viewRestaurantButton = viewRestaurantButtonStub!
        
        searchViewModel = SearchViewModel(view: searchViewController!)
        searchViewModel!.loadRestaurantData(filePath: validRestaurantDataFile1!)
        
        searchViewController!.viewModel = searchViewModel!
    }
    
    func prepareForRestaurantTableViewCellTests() {
        
        restaurantNameLabelStub = UILabelStub()
        restaurantRatingLabelStub = UILabelStub()
        restaurantDistanceLabelStub = UILabelStub()
        restaurantLocationLabelStub = UILabelStub()
        restaurantCuisineLabelStub = UILabelStub()
        
        restaurantTableViewCell = MockRestaurantTableViewCell()
        restaurantTableViewCell!.name = restaurantNameLabelStub!
        restaurantTableViewCell!.rating = restaurantRatingLabelStub!
        restaurantTableViewCell!.distance = restaurantDistanceLabelStub!
        restaurantTableViewCell!.location = restaurantLocationLabelStub!
        restaurantTableViewCell!.cuisine = restaurantCuisineLabelStub!

        var validDictionary = [String : AnyObject]()
        validDictionary["area"] = "Oxford Street" as AnyObject
        validDictionary["rating"] = "5" as AnyObject
        validDictionary["cuisine"] = "Indian" as AnyObject
        validDictionary["distance"] = "0.05" as AnyObject
        validDictionary["tubeStation"] = "Bayswater" as AnyObject
        validDictionary["restaurantName"] = "Curry King" as AnyObject
        
        validRestaurant = Restaurant(validDictionary)
        
        cellViewModel = RestaurantTableViewCellViewModel(model: validRestaurant!)
        cellViewModel!.view = restaurantTableViewCell!
        
        restaurantTableViewCell!.viewModel = cellViewModel!
    }
    
    override func spec() {
   
        
        beforeEach {
            
        }
    
        describe("the main screen of the app is loaded") {
            context("no area has been selected") {
                it("the Next button is not enabled") {
            
                    self.prepareForSearchViewControllerTests()
                    self.searchViewController!.viewDidLoad()
                    
                    expect(self.viewRestaurantButtonStub!.isEnabled).to(equal(false))
                    
                }
            }
        }
        
        describe("the main screen of the app is loaded") {
            context("an area in London has been selected") {
                it("the Next button is enabled") {
    
                    self.prepareForSearchViewControllerTests()
                    self.searchViewController!.pickerView(self.locationPickerStub!, didSelectRow: 0, inComponent: 0)
                    
                    expect(self.viewRestaurantButtonStub!.isEnabled).to(equal(true))
                }
            }
        }
        
        describe("the user has selected a location") {
            context("the Next button is tapped") {
                it("a new screen appears with a list of restaurants in that location") {
                    self.prepareForSearchViewControllerTests()
                    self.searchViewController!.pickerView(self.locationPickerStub!, didSelectRow: 0, inComponent: 0)
                    self.searchViewController!.onViewListings(self)
                    
                    expect(self.searchViewController!.displayResultsScreenCalled).to(equal(true))
                }
            }
        }
        
        
        describe("the list of restaurants is visible on the screen") {
            context("a restaurant’s name is displayed in that list") {
                it("the listing should be accompanied with the name of the nearest tube station") {
                    
                    self.prepareForRestaurantTableViewCellTests()
                    self.restaurantTableViewCell!.setup()
                    
                    let expectedValue = "\(self.validRestaurant!.distance!) miles(s) from \(self.validRestaurant!.tubeStation!)"
                    expect(self.restaurantDistanceLabelStub!.text).to(equal(expectedValue))
                }
            }
        }
        
        
        describe("the list of restaurants is visible on the screen") {
            context("a restaurant’s name is displayed in that list") {
                it("the listing should be accompanied by the approximate distance in miles to the nearest tube station") {
                    
                    self.prepareForRestaurantTableViewCellTests()
                    self.restaurantTableViewCell!.setup()
                    
                    let expectedValue = "\(self.validRestaurant!.distance!) miles(s) from \(self.validRestaurant!.tubeStation!)"
                    expect(self.restaurantDistanceLabelStub!.text).to(equal(expectedValue))
                }
            }
        }
        
        
        describe("the list of restaurants is visible on the screen") {
            context("a restaurant’s name is displayed in that list") {
                it("the listing should be accompanied by an integer between 1 to 5 that indicates the quality of the restaurant, with 1 being the poorest and 5 the best") {
                    
                    self.prepareForRestaurantTableViewCellTests()
                    self.restaurantTableViewCell!.setup()
                    
                    let expectedValue = "\(self.validRestaurant!.rating!) stars"
                    expect(self.restaurantRatingLabelStub!.text).to(equal(expectedValue))
                }
            }
        }
        
        
        describe("the list of restaurants is visible on the screen") {
            context("a restaurant’s name is displayed in that list") {
                it("the listing should be accompanied by the cuisine served at the restaurant") {
                 
                    self.prepareForRestaurantTableViewCellTests()
                    self.restaurantTableViewCell!.setup()
                    
                    let expectedValue = self.validRestaurant!.cuisine!
                    expect(self.restaurantCuisineLabelStub!.text).to(equal(expectedValue))
                }
            }
        }
        
        
    }
}
