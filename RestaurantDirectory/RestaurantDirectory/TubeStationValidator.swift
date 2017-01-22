//
//  TubeStationValidator.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 18/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation

class TubeStationValidator: NSObject {
    
    func validate(_ value:String) -> Bool {
        
        if ((value.characters.count < 4) || (value.characters.count > 30)) {
            return false
        }
        
        let specialCharacters = Set("+,!#$%^*();\\/|<>\"".characters)
        if (value.characters.filter {specialCharacters.contains($0)}).count > 0 {
            return false
        }
        
        let numbers = Set("0123456789".characters)
        if (value.characters.filter {numbers.contains($0)}).count > 0 {
            return false
        }
        
        guard let regexValidator = try? NSRegularExpression(pattern: "([A-Za-z'])", options: .caseInsensitive) else {
            return false
        }
        
        if regexValidator.numberOfMatches(in: value,
                                          options: NSRegularExpression.MatchingOptions.reportCompletion,
                                          range: NSMakeRange(0, value.characters.count)) > 0 {
            return true
        }
        
        return false
    }
    
}
