//
//  Operator.swift
//  calc
//
//  Created by kpse on 6/11/15.
//  Copyright (c) 2015 kpse. All rights reserved.
//

import Foundation

class Operator {
    var prioriry : Int {
        return 0
    }
    func execute(arg1: Statement, arg2: Statement) -> Double {
        return 0
    }
}
class AddOperator: Operator {
    override func execute(arg1: Statement, arg2: Statement) -> Double {
        return arg1.eval() + arg2.eval()
    }
    override var prioriry: Int {
        return 1
    }
}
class SubstractOperator: Operator {
    override var prioriry: Int {
        return 1
    }
    override func execute(arg1: Statement, arg2: Statement) -> Double {
        return arg1.eval() - arg2.eval()
    }
}
class MultipleOperator: Operator {
    override var prioriry: Int {
        return 2
    }
    override func execute(arg1: Statement, arg2: Statement) -> Double {
        if prioriry > arg1.priority {
            return arg1.postpone(self, arg: arg2).eval()
        } else if prioriry > arg2.priority {
            return arg2.postpone(self, arg: arg1).eval()
        }
        return arg1.eval() * arg2.eval()
    }

}
class DivideOperator: Operator {
    override func execute(arg1: Statement, arg2: Statement) -> Double {
        if prioriry > arg1.priority {
            return arg1.postpone(self, arg: arg2).eval()
        } else if prioriry > arg2.priority {
            return arg2.postpone(self, arg: arg1).eval()
        }
        return arg1.eval() / arg2.eval()
    }
    override var prioriry: Int {
        return 2
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