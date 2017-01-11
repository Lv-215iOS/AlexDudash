//
//  Calculation.swift
//  CalcAlexDudash
//
//  Created by Sasha Dudash on 12/18/16.
//  Copyright © 2016 Sasha Dudash. All rights reserved.
//

import Foundation

class CalcModel: CalcBrainInterface {
    
    private var inputArray = ""
    private var inputDataArray = [String]()
    private var outputArray = [String]()
    func digit(value: Double){
        inputArray += String(Int(value
        ))
    }
    
    func binary(operation: BinaryOperation) {
        inputArray += operation.rawValue
    }
    
    func unary(operation: UnaryOperation) {
        inputArray += operation.rawValue
        
    }
    
    func utility(operation: UtilityOperation) {
        if operation == .Equal {
            let value = calculateExpression()
            
            result?(value, nil)
            inputArray = "\(value)"
            inputDataArray = [String]()
            outputArray = [String]()
        } else if operation == .AClean {
            inputArray = ""
            inputDataArray = [String]()
            outputArray = [String]()
        } else if operation == .Clean {
            inputArray.remove(at: inputArray.index(before: inputArray.endIndex))
            inputDataArray = [String]()
            outputArray = [String]()
        } else {
            inputArray += operation.rawValue
        }
    }
    
    var result: ((Double?, Error?)->())?
    
    private func divideInputDataIntoMath() {
        for charachter in inputArray.characters {
            if isOperation(at: String(charachter)) {
                inputDataArray.append(String(charachter))
            } else if isValue(at: String(charachter)){
                if inputDataArray.count == 0 {
                    inputDataArray.append(String(charachter))
                } else if isValue(at: inputDataArray[inputDataArray.count - 1]) {
                    inputDataArray[inputDataArray.count - 1] += String(charachter)
                } else if (inputDataArray.count == 1 && inputDataArray[inputDataArray.count - 1] == "-"){
                    inputDataArray[inputDataArray.count - 1] += String(charachter)
                } else if (inputDataArray.count > 1) && (checkMathOperator(at: inputDataArray[inputDataArray.count - 2]) || isOperation(at: inputDataArray[inputDataArray.count - 2])) && inputDataArray[inputDataArray.count - 1] == "-" {
                    inputDataArray[inputDataArray.count - 1] += String(charachter)
                } else {
                    inputDataArray.append(String(charachter)) //
                }
            } else if charachter == "." {
                inputDataArray[inputDataArray.count - 1] += String(charachter)
            } else if inputDataArray.count != 0 && !checkTrigonometryFunc(at: inputDataArray[inputDataArray.count - 1]) && !isOperation(at: inputDataArray[inputDataArray.count - 1]) {
                inputDataArray[inputDataArray.count - 1] += String(charachter)
            } else {
                inputDataArray.append(String(charachter))
            }
        }
        
    }
    
    private func calculateData() {
        var stack = [String]()
        for symbol in inputDataArray{
            if !isOperation(at: symbol){
                outputArray.append(String(symbol))
            } else if checkMathOperator(at: String(symbol)){
                if stack.count == 0 || symbol == "(" {
                    stack.append(String(symbol))
                } else if priorityBetweenMathOperators(first: stack.last!, second: symbol) &&  stack.last! != "(" {
                    var i = 0
                    for element in stack.reversed() {
                        if priorityBetweenMathOperators(first: element, second: symbol) &&  element != "(" {
                            i+=1
                            outputArray.append(String(element))
                        } else {
                            break
                        }
                    }
                    stack = Array(stack.dropLast(i))
                    stack.append(String(symbol))
                } else {
                    stack.append(String(symbol))
                }
            } else if symbol == ")" {
                var i = 0
                for element in stack.reversed() {
                    if element != "(" {
                        i += 1
                        outputArray.append(String(element))
                    } else {
                        break
                    }
                }
                stack = Array(stack.dropLast(i+1))
            } else {
                stack.append(String(symbol))
            }
            
        }
        for element in stack.reversed() {
            outputArray.append(String(element))
        }
        
        
    }
    
    // MARK: - Setting priorities
    
    private func settingPriority(char:String) -> Int {
        if char == "+" || char == "-" {
            return 1
        } else if (char == "^") {
            return 3
        } else if checkTrigonometryFunc(at: char) {
            return 4
        }
        return 2
    }
    
    private func priorityBetweenMathOperators(first:String, second:String) -> Bool {
        if settingPriority(char: first) >= settingPriority(char: second) {
            return true
        }
        return false
    }
    
    // MARK: - Checking
    
    //checking if is Number
    private func isValue(at char: String) -> Bool {
        if !checkMathOperator(at: char) && !isOperation(at: char) {
            return true
        }
        return false
    }
    //checking if is operation
    private func isOperation(at char: String) -> Bool {
        
        if checkMathOperator(at: char) || char == "(" || char == ")" {
            return true
        }
        return false
    }
    //checking if is trigonometry or square root
    private func checkTrigonometryFunc(at char: String) -> Bool {
        if char=="sin" || char=="cos" || char=="tg" || char=="ctg" || char=="sqrt" {
            return true
        }
        return false
    }
    //checking if is Math operation
    private func checkMathOperator(at char: String) -> Bool {
        
        if char=="+" || char=="/" || char=="*" || char=="-" || char == "^" || char == "sin" || char == "cos" || char == "tg" || char == "ctg" || char=="sqrt" {
            return true
        }
        return false
    }
    
    // Mark: - Calculate
    
    func calculateExpression() -> Double {
        self.divideInputDataIntoMath()
        self.calculateData()
        var stack =  [Double]()
        for value in outputArray {
            switch value {
            case "+":
                let rightValue = stack.removeLast()
                let leftValue = stack.removeLast()
                stack.append(leftValue + rightValue)
            case "-":
                let rightValue = stack.removeLast()
                let leftValue = stack.removeLast()
                stack.append(leftValue - rightValue)
            case "*":
                let rightValue = stack.removeLast()
                let leftValue = stack.removeLast()
                stack.append(leftValue * rightValue)
            case "/":
                let rightValue = stack.removeLast()
                let leftValue = stack.removeLast()
                stack.append(leftValue / rightValue)
            case "^":
                let rightValue = stack.removeLast()
                let leftValue = stack.removeLast()
                stack.append(pow(leftValue, rightValue))
            case "sin":
                let value = stack.removeLast()
                stack.append(sin(value))
            case "cos":
                let value = stack.removeLast()
                stack.append(cos(value))
            case "tg":
                let value = stack.removeLast()
                stack.append(tan(value))
            case "ctg":
                let value = stack.removeLast()
                stack.append(1/tan(value))
            case "sqrt":
                let value = stack.removeLast()
                stack.append(sqrt(value))
            default:
                stack.append(Double(value)!)
            }
            
        }
        return stack[stack.count-1]
    }
}
