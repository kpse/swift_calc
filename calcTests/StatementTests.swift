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
    
    func testComplex2() {
        let a1 = StatementFactory.create("1")
        let a2 = StatementFactory.create("2")
        let a3 = StatementFactory.create("3")
        let r = ComplexStatement(a1:a1, a2:a2, op: AddOperator())
        let r2 = ComplexStatement(a1:r, a2:a3, op: AddOperator())
        XCTAssert(r2.eval() == 6, "Pass")
    }
    
    func testComplexMultiplicationPriority() {
        let a1 = StatementFactory.create("1")
        let a2 = StatementFactory.create("2")
        let a3 = StatementFactory.create("3")
        let r = ComplexStatement(a1:a1, a2:a2, op: AddOperator())
        let r2 = ComplexStatement(a1:r, a2:a3, op: MultipleOperator())
        XCTAssert(r2.eval() == 7, "Pass")
    }

    func testComplexMltiplicationPriority2() {
        let a1 = StatementFactory.create("1")
        let a2 = StatementFactory.create("2")
        let a3 = StatementFactory.create("3")
        let r = ComplexStatement(a1:a1, a2:a2, op: MultipleOperator())
        let r2 = ComplexStatement(a1:r, a2:a3, op: AddOperator())
        XCTAssert(r2.eval() == 5, "Pass")
    }
    
    func testComplexDivisionPriority() {
        let a1 = StatementFactory.create("1")
        let a2 = StatementFactory.create("3")
        let a3 = StatementFactory.create("3")
        let r = ComplexStatement(a1:a1, a2:a2, op: AddOperator())
        let r2 = ComplexStatement(a1:r, a2:a3, op: DivideOperator())
        XCTAssert(r2.eval() == 2, "Pass")
    }
    
    func testComplexDivisionPriority2() {
        let a1 = StatementFactory.create("3")
        let a2 = StatementFactory.create("3")
        let a3 = StatementFactory.create("1")
        let a4 = StatementFactory.create("1")
        let r = ComplexStatement(a1:a1, a2:a2, op: DivideOperator())
        let r2 = ComplexStatement(a1:a3, a2:a4, op: DivideOperator())
        let r3 = ComplexStatement(a1:r, a2:r2, op: AddOperator())
        XCTAssert(r3.eval() == 2, "Pass")
    }
    
}