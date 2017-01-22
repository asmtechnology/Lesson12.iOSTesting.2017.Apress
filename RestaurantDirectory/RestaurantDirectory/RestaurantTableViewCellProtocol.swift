//
//  RestaurantTableViewCellProtocol.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation

protocol RestaurantTableViewCellProtocol : class {
    func setRestaurantLocation(_ location:String)
    func setRestaurantRating(_ rating:String)
    func setRestaurantCuisine(_ cuisine:String)
    func setRestarantDistance(_ distance:String)
    func setRestaurantName(_ restaurantName:String)
}
