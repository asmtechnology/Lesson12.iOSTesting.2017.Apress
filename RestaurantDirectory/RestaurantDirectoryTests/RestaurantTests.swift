//
//  RestaurantTests.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 20/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import XCTest

class RestaurantTests: XCTestCase {
    
    var invalidDictionary1: [String : AnyObject]?
    var invalidDictionary2: [String : AnyObject]?
    var invalidDictionary3: [String : AnyObject]?
    var invalidDictionary4: [String : AnyObject]?
    var invalidDictionary5: [String : AnyObject]?
    var invalidDictionary6: [String : AnyObject]?
    
    var validDictionary1: [String : AnyObject]?
    
    let areaKey = "area"
    let ratingKey = "rating"
    let cuisineKey = "cuisine"
    let distanceKey = "distance"
    let tubeStationKey = "tubeStation"
    let restaurantNameKey = "restaurantName"
    
    override func setUp() {
        super.setUp()

        validDictionary1 = [String : AnyObject]()
        validDictionary1![areaKey] = "Holland Park" as AnyObject
        validDictionary1![ratingKey] = "5" as AnyObject
        validDictionary1![cuisineKey] = "Indian" as AnyObject
        validDictionary1![distanceKey] = "0.05" as AnyObject
        validDictionary1![tubeStationKey] = "Bayswater" as AnyObject
        validDictionary1![restaurantNameKey] = "Curry King" as AnyObject
        
        
        invalidDictionary1 = [String : AnyObject]()
        invalidDictionary1![ratingKey] = "5" as AnyObject
        invalidDictionary1![cuisineKey] = "Indian" as AnyObject
        invalidDictionary1![distanceKey] = "0.05" as AnyObject
        invalidDictionary1![tubeStationKey] = "Bayswater" as AnyObject
        invalidDictionary1![restaurantNameKey] = "Curry King" as AnyObject
        
        invalidDictionary2 = [String : AnyObject]()
        invalidDictionary2![areaKey] = "Holland Park" as AnyObject
        invalidDictionary2![cuisineKey] = "Indian" as AnyObject
        invalidDictionary2![distanceKey] = "0.05" as AnyObject
        invalidDictionary2![tubeStationKey] = "Bayswater" as AnyObject
        invalidDictionary2![restaurantNameKey] = "Curry King" as AnyObject
        
        invalidDictionary3 = [String : AnyObject]()
        invalidDictionary3![areaKey] = "Holland Park" as AnyObject
        invalidDictionary3![ratingKey] = "5" as AnyObject
        invalidDictionary3![distanceKey] = "0.05" as AnyObject
        invalidDictionary3![tubeStationKey] = "Bayswater" as AnyObject
        invalidDictionary3![restaurantNameKey] = "Curry King" as AnyObject
        
        invalidDictionary4 = [String : AnyObject]()
        invalidDictionary4![areaKey] = "Holland Park" as AnyObject
        invalidDictionary4![ratingKey] = "5" as AnyObject
        invalidDictionary4![cuisineKey] = "Indian" as AnyObject
        invalidDictionary4![tubeStationKey] = "Bayswater" as AnyObject
        invalidDictionary4![restaurantNameKey] = "Curry King" as AnyObject
        
        invalidDictionary5 = [String : AnyObject]()
        invalidDictionary5![areaKey] = "Holland Park" as AnyObject
        invalidDictionary5![ratingKey] = "5" as AnyObject
        invalidDictionary5![cuisineKey] = "Indian" as AnyObject
        invalidDictionary5![distanceKey] = "0.05" as AnyObject
        invalidDictionary5![restaurantNameKey] = "Curry King" as AnyObject
        
        invalidDictionary6 = [String : AnyObject]()
        invalidDictionary6![areaKey] = "Holland Park" as AnyObject
        invalidDictionary6![ratingKey] = "5" as AnyObject
        invalidDictionary6![cuisineKey] = "Indian" as AnyObject
        invalidDictionary6![distanceKey] = "0.05" as AnyObject
        invalidDictionary6![tubeStationKey] = "Bayswater" as AnyObject
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testInit_NilDictionary_DoesNotCreateInstance() {
        let restaurant = Restaurant(nil)
        XCTAssertNil(restaurant)
    }
    
    func testInit_DictionaryMissingKey_area_DoesNotCreateInstance() {
        let restaurant = Restaurant(invalidDictionary1)
        XCTAssertNil(restaurant)
    }
    
    func testInit_DictionaryMissingKey_rating_DoesNotCreateInstance() {
        let restaurant = Restaurant(invalidDictionary2)
        XCTAssertNil(restaurant)
    }
    
    func testInit_DictionaryMissingKey_cuisine_DoesNotCreateInstance() {
        let restaurant = Restaurant(invalidDictionary3)
        XCTAssertNil(restaurant)
    }
    
    func testInit_DictionaryMissingKey_distance_DoesNotCreateInstance() {
        let restaurant = Restaurant(invalidDictionary4)
        XCTAssertNil(restaurant)
    }
    
    func testInit_DictionaryMissingKey_tubeStation_DoesNotCreateInstance() {
        let restaurant = Restaurant(invalidDictionary5)
        XCTAssertNil(restaurant)
    }
    
    func testInit_DictionaryMissingKey_restaurantName_DoesNotCreateInstance() {
        let restaurant = Restaurant(invalidDictionary6)
        XCTAssertNil(restaurant)
    }
    

    
    func testInit_ValidDictionary_CreateInstance() {
        let restaurant = Restaurant(validDictionary1)
        XCTAssertNotNil(restaurant)
    }
    
    func testInit_ValidDictionary_CopiesArea() {
        let restaurant = Restaurant(validDictionary1)
        XCTAssertEqual(restaurant!.area!, validDictionary1?[areaKey] as! String)
    }
    
    func testInit_ValidDictionary_CopiesRating() {
        let restaurant = Restaurant(validDictionary1)
        XCTAssertEqual(restaurant!.rating!, validDictionary1?[ratingKey] as! String)
    }
    
    func testInit_ValidDictionary_CopiesCuisine() {
        let restaurant = Restaurant(validDictionary1)
        XCTAssertEqual(restaurant!.cuisine!, validDictionary1?[cuisineKey] as! String)
    }
    
    func testInit_ValidDictionary_CopiesDistance() {
        let restaurant = Restaurant(validDictionary1)
        XCTAssertEqual(restaurant!.distance!, validDictionary1?[distanceKey] as! String)
    }
    
    func testInit_ValidDictionary_CopiesTubeStation() {
        let restaurant = Restaurant(validDictionary1)
        XCTAssertEqual(restaurant!.tubeStation!, validDictionary1?[tubeStationKey] as! String)
    }
    
    func testInit_ValidDictionary_CopiesRestaurantName() {
        let restaurant = Restaurant(validDictionary1)
        XCTAssertEqual(restaurant!.restaurantName!, validDictionary1?[restaurantNameKey] as! String)
    }
}
