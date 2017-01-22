//
//  MockRestaurantTableViewCell.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation
import XCTest

class MockRestaurantTableViewCell : RestaurantTableViewCell {
    
    var expectationForSetRestaurantLocation:(XCTestExpectation, String)?
    var expectationForSetRestaurantRating:(XCTestExpectation, String)?
    var expectationForSetRestaurantCuisine:(XCTestExpectation, String)?
    var expectationForSetRestaurantDistance:(XCTestExpectation, String)?
    var expectationForSetRestaurantName:(XCTestExpectation, String)?
    
    override func setRestaurantLocation(_ location:String) {
        guard let (expectation, expectedValue) = self.expectationForSetRestaurantLocation else {
            super.setRestaurantLocation(location)
            return
        }
        
        if location.compare(expectedValue) == .orderedSame {
            expectation.fulfill()
        }
        
        super.setRestaurantLocation(location)
    }
    
    override func setRestaurantRating(_ rating:String) {
        guard let (expectation, expectedValue) = self.expectationForSetRestaurantRating else {
            super.setRestaurantRating(rating)
            return
        }
        
        if rating.compare(expectedValue) == .orderedSame {
            expectation.fulfill()
        }
        
        super.setRestaurantRating(rating)
    }
    
    override func setRestaurantCuisine(_ cuisine:String) {
        guard let (expectation, expectedValue) = self.expectationForSetRestaurantCuisine else {
            super.setRestaurantCuisine(cuisine)
            return
        }
        
        if cuisine.compare(expectedValue) == .orderedSame {
            expectation.fulfill()
        }
        
        super.setRestaurantCuisine(cuisine)
    }
    
    override func setRestarantDistance(_ distance:String) {
        guard let (expectation, expectedValue) = self.expectationForSetRestaurantDistance else {
            super.setRestarantDistance(distance)
            return
        }
        
        if distance.compare(expectedValue) == .orderedSame {
            expectation.fulfill()
        }
        
        super.setRestarantDistance(distance)
    }
    
    override func setRestaurantName(_ restaurantName:String) {
        guard let (expectation, expectedValue) = self.expectationForSetRestaurantName else {
            super.setRestaurantName(restaurantName)
            return
        }
        
        if restaurantName.compare(expectedValue) == .orderedSame {
            expectation.fulfill()
        }
        
        super.setRestaurantName(restaurantName)
    }
    
}
