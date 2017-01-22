//
//  MockRestaurantTableViewController.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation

import UIKit
import XCTest

class MockRestaurantTableViewController : RestaurantTableViewControllerProtocol {
    
    var expectationForSetNavigationTitle:XCTestExpectation?

    func setNavigationTitle(_ title:String) -> Void {
        expectationForSetNavigationTitle?.fulfill()
    }
    
}

