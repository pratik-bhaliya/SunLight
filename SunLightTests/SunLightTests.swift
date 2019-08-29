//
//  SunLightTests.swift
//  SunLightTests
//
//  Created by Pratik Bhaliya on 29/8/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import XCTest
@testable import SunLight

class SunLightTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
       XCTAssert(passwordCheck(password: "12sfs"), "Your password is not enough")
        
        let i = 0
        XCTAssert(i == 0, "Result should be achievable")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func passwordCheck(password: String) -> Bool {
        return password.count > 3
    }
    
    func usernameCheck(userName: String) -> Bool {
        return true
    }

}
