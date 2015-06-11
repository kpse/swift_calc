//
//  Statement.swift
//  calc
//
//  Created by kpse on 6/11/15.
//  Copyright (c) 2015 kpse. All rights reserved.
//

import UIKit
import XCTest


class StatementTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStatementCreate() {
        let s = StatementFactory.create("0")
        XCTAssert(s.eval() == 0, "Pass")
    }
    
    func testComplex() {
        let a1 = StatementFactory.create("1")
        let a2 = StatementFactory.create("2")
        let r = ComplexStatement(a1:a1, a2:a2, op: AddOperator())
        XCTAssert(r.eval() == 3, "Pass")
    }
}