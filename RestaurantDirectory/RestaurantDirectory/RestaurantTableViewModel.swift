//
//  RestaurantTableViewModel.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 20/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation

class RestaurantTableViewModel : NSObject {
    
    var area:String
    var restaurantList:[Restaurant]
    var view:RestaurantTableViewControllerProtocol?
    
    init? (_ area:String, restaurantList:[Restaurant]?) {
        guard let restaurantList = restaurantList else {
            return nil
        }
        
        self.area = area
        self.restaurantList = restaurantList
        
        super.init()
    }
    
    func performInitialViewSetup() {
        view?.setNavigationTitle("Restaurants in \(area).")
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section:Int) -> Int {
        return restaurantList.count
    }
    
    func cellViewModel(forIndexPath indexPath:IndexPath) -> RestaurantTableViewCellViewModel? {
        let row = indexPath.row
        if row < 0 || row >= self.restaurantList.count {
            return nil
        }
        
        let restaurant = restaurantList[row]
        return RestaurantTableViewCellViewModel(model:restaurant)
    }
}
