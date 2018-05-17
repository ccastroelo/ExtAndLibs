//
//  StringExtTest.swift
//  ExtAndLibsTests
//
//  Created by Claudio on 13/04/2018.
//

import XCTest
@testable import ExtAndLibs

class StringExtTest: XCTestCase {
    let str = "maria"
    
    func testLength5(){
        XCTAssertEqual(str.length, 5)
    }
    
    func testLengthEmpty(){
        let strAux = ""
        XCTAssertEqual(strAux.length, 0)
    }
    
    func testContainsDoubleCaracterContent(){
        XCTAssert(str.contains("a"))
    }
    
    func testContainsTestFalse(){
        XCTAssertFalse(str.contains("e"))
    }
    
    func testContainEmpty(){
        XCTAssertFalse(str.contains(""))
    }
    
    func testIndexOf(){
        XCTAssertEqual(str.indexOfCharacter("r"), 2)
    }
    
    func testIndexOfFirstOcourrence(){
        XCTAssertEqual(str.indexOfCharacter("a"), 1)
    }
    
    func testIndexOfNotContain(){
        XCTAssertNil(str.indexOfCharacter("e"))
    }

    func testSubstringWithRange(){
        XCTAssertEqual(str.substringWithRange(1, end: 3), "ari")
    }

    func testSubstringWithRangeExtrapol(){
        XCTAssertEqual(str.substringWithRange(1, end: 13), "aria")
    }
    
    func testSubstringWithRangeStartInZeroThroOne(){
        XCTAssertEqual(str.substringWithRange(0, end: 1), "ma")
    }
    
    func testSubstringWithRangeStartInZeroThroZero(){
        XCTAssertEqual(str.substringWithRange(0, end: 0), "m")
    }
    
    func testSubstringWithRangeStartInMinusTwoThroOne(){
        XCTAssertEqual(str.substringWithRange(-1, end: 2), "")
    }
    
    func testSubstringWithRangeStartInTwoThroMinusOne(){
        XCTAssertEqual(str.substringWithRange(2, end: -1), "")
    }
    
    func testSubstringWithRangeStartBigThenEnd(){
        XCTAssertEqual(str.substringWithRange(3, end: 1), "")
    }

    func testSubstringWithRangeStartIn4Thro4(){
        XCTAssertEqual(str.substringWithRange(4, end: 4), "a")
    }

    func testSubstringWithRangeLocation(){
        XCTAssertEqual(str.substringWithRange(0, location: 2), "ma")
    }
    
    func testSubstringWithRangeLocationExtrapol(){
        XCTAssertEqual(str.substringWithRange(1, location: 13), "aria")
    }
    
    func testSubstringWithRangeLocationStartInZeroThroOne(){
        XCTAssertEqual(str.substringWithRange(0, location: 1), "m")
    }
    
    func testSubstringWithRangeLocationStartInZeroThroZero(){
        XCTAssertEqual(str.substringWithRange(0, location: 0), "")
    }
    
    func testSubstringWithRangeLocationStartInMinusTwoThroOne(){
        XCTAssertEqual(str.substringWithRange(-1, location: 2), "")
    }
    
    func testSubstringWithRangeLocationStartInTwoThroMinusOne(){
        XCTAssertEqual(str.substringWithRange(2, location: -1), "")
    }
    
    func testSubstringWithRangeLocationStartBigThenEnd(){
        XCTAssertEqual(str.substringWithRange(3, location: 1), "i")
    }
    
    func testSubstringWithRangeLocationStartIn4Thro4(){
        XCTAssertEqual(str.substringWithRange(4, location: 1), "a")
    }
    
    func testIsValidEmailTrue(){
        let email = "claudiocastro@gmail.com"
        XCTAssert(email.isValidEmail)
    }
    
    func testIsValidEmailWithOutAt(){
        let email = "claudiocastro.gmail.com"
        XCTAssertFalse(email.isValidEmail)
    }
    
    func testIsValidEmailWithOutDomain(){
        let email = "claudiocastro@gmail"
        XCTAssertFalse(email.isValidEmail)
    }
    
    func testIsValidEmailWithOutUser(){
        let email = "@gmail.com"
        XCTAssertFalse(email.isValidEmail)
    }
    
/*    func testIsValidEmailWithpointOnUser(){
        let email = ".@gmail.com"
        XCTAssertFalse(email.isValidEmail)
    }  */
    
    func testIsValidEmailWithTwoAt(){
        let email = "claudiocastro@@gmail.com"
        XCTAssertFalse(email.isValidEmail)
    }
    
    func testCapitalizingFirstLetter(){
        XCTAssertEqual(str.capitalizingFirstLetter, "Maria")
    }

    
    
    
}
