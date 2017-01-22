//
//  UITextFieldStub.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 21/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import UIKit

class UITextFieldStub : UITextField {
    
    init(text:String) {
        super.init(frame: CGRect.zero)
        super.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
