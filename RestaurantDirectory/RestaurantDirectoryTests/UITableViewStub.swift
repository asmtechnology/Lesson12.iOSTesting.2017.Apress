//
//  UITableViewStub.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import UIKit

class UITableViewStub: UITableView {
    
    init() {
        super.init(frame: CGRect.zero, style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
        return RestaurantTableViewCell()
    }
}
