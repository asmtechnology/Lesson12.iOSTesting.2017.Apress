//
//  RatingVlidatorTests.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 20/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import XCTest

class RatingVlidatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

}


// MARK: String length validation
extension RatingVlidatorTests {
    
    func testValidate_InputGreaterThanOneCharacterLength_ReturnsFalse() {
        let validator = RatingValidator()
        XCTAssertFalse(validator.validate("22"), "string can not have more than 1 character.")
    }
    
    func testValidate_InputOneCharacterInLength_ReturnsTrue() {
        let validator = RatingValidator()
        XCTAssertTrue(validator.validate("1"), "string with 1 character should have been valid.")
    }
}


// MARK: numeric character validation
extension RatingVlidatorTests {
    
    func testValidate_SingleCharacterRating0_ReturnsTrue() {
        let validator = RatingValidator()
        XCTAssertTrue(validator.validate("0"), "rating of 0 should have been valid.")
    }
    
    func testValidate_SingleCharacterRating1_ReturnsTrue() {
        let validator = RatingValidator()
        XCTAssertTrue(validator.validate("1"), "rating of 1 should have been valid.")
    }
    
    func testValidate_SingleCharacterRating2_ReturnsTrue() {
        let validator = RatingValidator()
        XCTAssertTrue(validator.validate("2"), "rating of 2 should have been valid.")
    }
    
    func testValidate_SingleCharacterRating3_ReturnsTrue() {
        let validator = RatingValidator()
        XCTAssertTrue(validator.validate("3"), "rating of 3 should have been valid.")
    }
    
    func testValidate_SingleCharacterRating4_ReturnsTrue() {
        let validator = RatingValidator()
        XCTAssertTrue(validator.validate("4"), "rating of 4 should have been valid.")
    }
    
    func testValidate_SingleCharacterRating5_ReturnsTrue() {
        let validator = RatingValidator()
        XCTAssertTrue(validator.validate("5"), "rating of 5 should have been valid.")
    }
    
    func testValidate_SingleCharacterRating6_ReturnsFalse() {
        let validator = RatingValidator()
        XCTAssertFalse(validator.validate("6"), "rating of 6 is not valid.")
    }
    
    func testValidate_SingleCharacterRating7_ReturnsFalse() {
        let validator = RatingValidator()
        XCTAssertFalse(validator.validate("7"), "rating of 7 is not valid.")
    }
    
    func testValidate_SingleCharacterRating8_ReturnsFalse() {
        let validator = RatingValidator()
        XCTAssertFalse(validator.validate("8"), "rating of 8 is not valid.")
    }
    
    func testValidate_SingleCharacterRating9_ReturnsFalse() {
        let validator = RatingValidator()
        XCTAssertFalse(validator.validate("9"), "rating of 9 is not valid.")
    }
    
}




// MARK: alphanumeric character validation
extension RatingVlidatorTests {
    
    func testValidate_SingleCharacterRating_UppercaseAlphanumeric_ReturnsFalse() {
        let validator = RatingValidator()
        for asciiCode in 65 ... 90 {
            let rating = String(Character(UnicodeScalar(asciiCode)!))
            XCTAssertFalse(validator.validate(rating), "character \(rating) is not allowed in a rating.")
        }
    }
    
    func testValidate_SingleCharacterRating_LowercaseAlphanumeric_ReturnsFalse() {
        let validator = RatingValidator()
        for asciiCode in 97 ... 122 {
            let rating = String(Character(UnicodeScalar(asciiCode)!))
            XCTAssertFalse(validator.validate(rating), "character \(rating) is not allowed in a rating.")
        }
    }
    
}


// MARK: special character validation
extension RatingVlidatorTests {
    
    func testValidate_SingleCharacterRating_ASCII32to47_ReturnsFalse() {
        let validator = RatingValidator()
        for asciiCode in 32 ... 47 {
            let rating = String(Character(UnicodeScalar(asciiCode)!))
            XCTAssertFalse(validator.validate(rating), "character \(rating) is not allowed in a rating.")
        }
    }
    
    func testValidate_SingleCharacterRating_ASCII58to64_ReturnsFalse() {
        let validator = RatingValidator()
        for asciiCode in 58 ... 64 {
            print ("\(asciiCode)")
            let rating = String(Character(UnicodeScalar(asciiCode)!))
            XCTAssertFalse(validator.validate(rating), "character \(rating) is not allowed in a rating.")
        }
    }
    
    func testValidate_SingleCharacterRating_ASCII91to96_ReturnsFalse() {
        let validator = RatingValidator()
        for asciiCode in 91 ... 96 {
            print ("\(asciiCode)")
            let rating = String(Character(UnicodeScalar(asciiCode)!))
            XCTAssertFalse(validator.validate(rating), "character \(rating) is not allowed in a rating.")
        }
    }
    
    func testValidate_SingleCharacterRating_ASCII123to126_ReturnsFalse() {
        let validator = RatingValidator()
        for asciiCode in 123 ... 126 {
            let rating = String(Character(UnicodeScalar(asciiCode)!))
            XCTAssertFalse(validator.validate(rating), "character \(rating) is not allowed in a rating.")
        }
    }
    
}
