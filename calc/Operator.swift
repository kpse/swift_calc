//
//  Operator.swift
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