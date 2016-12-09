//
//  Calculation.swift
//  CalcSashaDudash
//
//  Created by adminaccount on 12/9/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import Foundation

class CalculatorItSelf {
    
    private var accumulator = 0.0
    
    func setOperand(operand:Double){
        accumulator = operand
    }
    
    private var operations : Dictionary<String,Operation> = [
        "+" : Operation.BinaryOperation({$0 + $1}),
        "−" : Operation.BinaryOperation({$0 - $1}),
        "×" : Operation.BinaryOperation({$0 * $1}),
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "±" : Operation.UnaryOperation({-$0}),
        "=" : Operation.Equals,
        "√" : Operation.UnaryOperation(sqrt),
        "π" : Operation.Constant(M_PI),
        "sin": Operation.UnaryOperation(sin),
        "cos": Operation.UnaryOperation(cos),
        ]
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double,Double)->Double)
        case Equals
    }
    
    func performOperation(symbol:String){
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
            
            
        }
        
        
    }
    
    private struct PendingBinaryOperationInfo{
        var  binaryFunction: (Double,Double)->Double
        var firstOperand:Double
    }
    
    private var pending : PendingBinaryOperationInfo?
    
    private func executePendingBinaryOperation(){
        
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
            pending=nil
            
        }
        
        
    }
    
    var result:Double{
        
        get{
            
            return accumulator
        }
    }
    
}
