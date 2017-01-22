//
//  SearchViewControllerProtocol.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 19/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation

protocol SearchViewControllerProtocol : class {
    func setNavigationTitle(_ title:String)
    func enableRestaurantListingsButton(_ state:Bool)
    func displayResultsScreen()
}
