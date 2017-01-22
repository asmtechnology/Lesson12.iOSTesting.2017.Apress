//
//  RatingValidator.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 18/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation

class RatingValidator: NSObject {
    
    func validate(_ value:String) -> Bool {
        if (value.characters.count != 1){
            return false
        }
        
        let whitespace = Set(" ".characters)
        if (value.characters.filter {whitespace.contains($0)}).count > 0 {
            return false
        }
        
        let specialCharacters = Set("[\\]^_`:;<=>?@/+,!#&$%^'-.*~({|});|<>\"".characters)
        if (value.characters.filter {specialCharacters.contains($0)}).count > 0 {
            return false
        }
        
        let alphaUppercase = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)
        if (value.characters.filter {alphaUppercase.contains($0)}).count > 0 {
            return false
        }
        
        let alphaLowercase = Set("abcdefghijklmnopqrstuvwxyz".characters)
        if (value.characters.filter {alphaLowercase.contains($0)}).count > 0 {
            return false
        }
        
        if Int(value)! > 5 {
            return false
        }
        
        guard let regexValidator = try? NSRegularExpression(pattern: "([0-5])", options: .caseInsensitive) else {
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
