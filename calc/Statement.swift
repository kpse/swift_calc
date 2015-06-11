//
//  Statement.swift
//  calc
//
//  Created by kpse on 6/11/15.
//  Copyright (c) 2015 kpse. All rights reserved.
//

import Foundation

class Statement {
    func eval() -> Double {
        return 0
    }
    var priority : Int {
        return 0
    }
    func postpone(op: Operator, arg: Statement) -> Statement {
        return self
    }
}

class SimpleStatement : Statement {
    let arg : Double
    init(a1: Double) {
        arg = a1
    }
    override func eval() -> Double {
        return arg
    }
    func postpone(op: Operator, arg2: Statement) -> Statement {
        return ComplexStatement(a1: SimpleStatement(a1: arg), a2: arg2, op: op)
    }
    override var priority : Int {
        return 3
    }
}

class ComplexStatement: Statement {
    let arg1: Statement, arg2: Statement
    
    let op : Operator
    init(a1: Statement, a2: Statement, op: Operator) {
        arg1 = a1
        arg2 = a2
        self.op = op
    }
    override func eval() -> Double {
        return op.execute(arg1, arg2: arg2)
    }
    class func curry(a1: Statement, op: Operator)(a2: Statement) -> Statement {
        return ComplexStatement(a1: a1, a2: a2, op: op)
    }
    override var priority : Int {
        return op.prioriry
    }

    override func postpone(op: Operator, arg: Statement) -> Statement {
        return ComplexStatement(a1: arg1, a2: ComplexStatement(a1: arg2, a2: arg, op: op), op: self.op)
    }
}

class StatementFactory {
    class func create(text: String?) -> Statement {
        if let t = text {
            return SimpleStatement(a1: (t as NSString).doubleValue)
        }
        else {
            return SimpleStatement(a1: 0.0)
        }
    }
}
