//
//  Statement.swift
//  calc
//
//  Created by kpse on 6/11/15.
//  Copyright (c) 2015 kpse. All rights reserved.
//

import Foundation

class Operator {
    func execute(arg1: Double, arg2: Double) -> Double {
        return 0
    }
}
class AddOperator: Operator {
    override func execute(arg1: Double, arg2: Double) -> Double {
        return arg1 + arg2
    }
}
class SubstractOperator: Operator {
    override func execute(arg1: Double, arg2: Double) -> Double {
        return arg1 - arg2
    }
}
class MultipleOperator: Operator {
    override func execute(arg1: Double, arg2: Double) -> Double {
        return arg1 * arg2
    }
}
class DivideOperator: Operator {
    override func execute(arg1: Double, arg2: Double) -> Double {
        return arg1 / arg2
    }
}

class OperatorFactory {
    class func create(tag : Int) -> Operator {
        let maps : [Int:Operator] = [11:AddOperator(),12:SubstractOperator(), 13:MultipleOperator(), 14:DivideOperator()]
        if let op = maps[tag] {
            return op
        }
        return AddOperator()
    }
}

class Statement {
    let arg1: Double, arg2: Double
    
    let op : Operator
    init(a1: Double, a2: Double, op: Operator) {
        arg1 = a1
        arg2 = a2
        self.op = op
    }
    func eval() -> Double {
        return op.execute(arg1, arg2: arg2)
    }
    class func curry(a1: Double, op: Operator)(a2: Double) -> Statement {
        return Statement(a1: a1, a2: a2, op: op)
    }
}
