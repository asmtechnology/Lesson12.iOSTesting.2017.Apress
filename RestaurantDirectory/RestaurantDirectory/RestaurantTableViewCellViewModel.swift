//
//  RestaurantTableViewCellViewModel.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation

class RestaurantTableViewCellViewModel : NSObject {
 
    var model:Restaurant?
    var view:RestaurantTableViewCellProtocol?
    
    init(model:Restaurant?) {
        self.model = model
        super.init()
    }

    func setup() {
        
        guard let view = view ,
            let model = model,
            let area = model.area,
            let rating = model.rating,
            let cuisine = model.cuisine,
            let distance = model.distance,
            let tubeStation = model.tubeStation,
            let restaurantName = model.restaurantName else {
                return
        }

        view.setRestaurantLocation(area)
        view.setRestaurantRating("\(rating) stars")
        view.setRestaurantCuisine(cuisine)
        view.setRestarantDistance("\(distance) miles(s) from \(tubeStation)")
        view.setRestaurantName(restaurantName)
    }
}
