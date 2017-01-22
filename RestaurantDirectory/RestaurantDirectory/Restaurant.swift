//
//  Restaurant.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 18/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation

class Restaurant : NSObject {
    
    var area:String?
    var rating:String?
    var cuisine:String?
    var distance:String?
    var tubeStation:String?
    var restaurantName:String?
    
    var restaurantNameValidator:RestaurantNameValidator?
    var tubeStationValidator:TubeStationValidator?
    var cuisineValidator:CuisineValidator?
    var ratingValidator:RatingValidator?
    
    let areaKey = "area"
    let ratingKey = "rating"
    let cuisineKey = "cuisine"
    let distanceKey = "distance"
    let tubeStationKey = "tubeStation"
    let restaurantNameKey = "restaurantName"
    
    
    init?(_ dictionary:[String : AnyObject]?) {
        
        guard let dictionary = dictionary,
            let area = dictionary[areaKey] as? String,
            let rating = dictionary[ratingKey] as? String,
            let cuisine = dictionary[cuisineKey] as? String,
            let distance = dictionary[distanceKey] as? String,
            let tubeStation = dictionary[tubeStationKey] as? String,
            let restaurantName = dictionary[restaurantNameKey]  as? String else {
                return nil
        }
        
        super.init()
        
        let restaurantNameValidator = self.restaurantNameValidator ?? RestaurantNameValidator()
        if restaurantNameValidator.validate(restaurantName) == false {
            return nil
        }
        
        let tubeStationValidator = self.tubeStationValidator ?? TubeStationValidator()
        if tubeStationValidator.validate(tubeStation) == false {
            return nil
        }
        
        let cuisineValidator = self.cuisineValidator ?? CuisineValidator()
        if cuisineValidator.validate(cuisine) == false {
            return nil
        }
        
        let ratingValidator = self.ratingValidator ?? RatingValidator()
        if ratingValidator.validate(rating) == false {
            return nil
        }
        
        
        self.area = area
        self.rating = rating
        self.cuisine = cuisine
        self.distance = distance
        self.tubeStation = tubeStation
        self.restaurantName = restaurantName
    }
    
    
    
}
