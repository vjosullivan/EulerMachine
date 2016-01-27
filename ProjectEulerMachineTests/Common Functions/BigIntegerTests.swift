//
//  BigIntegerTests.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 26/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest

class BigIntegerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBICreatable() {
        let z = BigInteger(int: 0)
        XCTAssertNotNil(z)
        XCTAssertEqual("0", z.description)
    }

    func testBIAdd01() {
        let a = BigInteger(int: 12)
        let b = BigInteger(int: 34)
        let c = a.add(b)
        XCTAssertEqual("46", c.description)
    }
    
    func testBIAdd02() {
        let a = BigInteger(int: 123)
        let b = BigInteger(int: 45)
        let c = a.add(b)
        XCTAssertEqual("168", c.description)
    }

    func testBIAdd03() {
        let a = BigInteger(int: 123456789)
        let b = BigInteger(int: 456789)
        let c = a.add(b)
        XCTAssertEqual("123913578", c.description)
    }

    func testBIAdd04a() {
        let a = BigInteger(int: 987654567890567890)
        let b = BigInteger(int:      6473302928245)
        let c = a.add(b)
        XCTAssertEqual("987661041193496135", c.description)
        XCTAssertTrue(c.positive)
    }

    func testBIAdd04() {
        let a = BigInteger(int:      6473302928245)
        let b = BigInteger(int: 987654567890567890)
        let c = a.add(b)
        XCTAssertEqual("987661041193496135", c.description)
        XCTAssertTrue(c.positive)
    }

    func testBIAdd04b() {
        let a = BigInteger(int: -987654567890567890)
        let b = BigInteger(int:      -6473302928245)
        let c = a.add(b)
        XCTAssertEqual("-987661041193496135", c.description)
        XCTAssertFalse(c.positive)
    }

    func testBIAdd04c() {
        let a = BigInteger(int:      -6473302928245)
        let b = BigInteger(int: -987654567890567890)
        let c = a.add(b)
        XCTAssertEqual("-987661041193496135", c.description)
        XCTAssertFalse(c.positive)
    }
}
