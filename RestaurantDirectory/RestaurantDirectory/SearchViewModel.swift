//
//  SearchViewModel.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 19/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation

class SearchViewModel : NSObject {
    
    var restaurants: [String: [Restaurant]]
    var selectedArea:String?
    
    weak var view:SearchViewControllerProtocol?
    
    init(view:SearchViewControllerProtocol) {

        self.view = view
        self.restaurants = [String: [Restaurant]]()

        super.init()
        
        let path = Bundle.main.path(forResource: "RestaurantData", ofType: "json")
        loadRestaurantData(filePath:path)
    }
    
    
    func loadRestaurantData(filePath:String?) -> Void {
        
        guard let filePath = filePath,
            let fileData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let array = try? JSONSerialization.jsonObject(with: fileData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray else {
                return
        }
        
        for item in array! {
            guard let dictionary = item as? [String : AnyObject] else {
                continue
            }
            
            if let restaurant = Restaurant(dictionary),
                let area = restaurant.area {
                
                if self.restaurants[area] == nil {
                    self.restaurants[area] = [Restaurant]()
                }
                
                self.restaurants[area]?.append(restaurant)
            }
        }
    }
    
    func performInitialViewSetup() {
        view?.setNavigationTitle("Restaurant Finder")
        view?.enableRestaurantListingsButton(false)
    }
    
    func numberOfComponents() -> Int {
        return 1
    }
    
    func numberOfRowsInComponent(_ component:Int) -> Int {
        return self.restaurants.count
    }
    
    func titleForRow(_ row:Int, component:Int) -> String? {
        let keys = [String](self.restaurants.keys)
        
        if row < 0 || row >= keys.count {
            return nil
        }
        
        return keys[row]
    }
    
    func didSelectRow(_ row:Int, component:Int) -> Void {
        let keys = [String](self.restaurants.keys)
        
        if row < 0 || row >= keys.count {
            return
        }
        
        self.selectedArea = keys[row]
        
        self.view?.enableRestaurantListingsButton(true)
    }
    
    func onViewListings() -> Void {
        self.view?.displayResultsScreen()
    }
    
    func viewModelForSelectedArea() -> RestaurantTableViewModel? {
        guard let selectedArea = self.selectedArea else {
            return nil
        }
        
        let keys = [String](self.restaurants.keys)
        if keys.contains(selectedArea) == false {
            return nil
        }
        
        return RestaurantTableViewModel(selectedArea, restaurantList:self.restaurants[selectedArea])
    }
    
}
