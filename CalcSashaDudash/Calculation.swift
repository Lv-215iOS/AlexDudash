import Foundation

enum BinaryOperation {
    case Plus
    case Minus
    case Mul
    case Div
}

enum UnaryOperation {
    case PlusMinus
    case SquareRoot
    case Cos
    case Sin
   
}

enum UtilityOperation {
    case Equal
    case Clear
}

protocol CalculatorBrainInterface {
    func digit(value: Double)
    func binary(operation: BinaryOperation)
    func unary(operation: UnaryOperation)
    func utility(operation: UtilityOperation)
    var result: ((Double?, Error?)->())? {get set}
}

class CalculatorBrain: CalculatorBrainInterface {
    internal var result: ((Double?, Error?) -> ())?

    
    
    var operandOne: Double?
    var operandTwo: Double?
    var currentOperand: Double?
    var resultValue: Double?
    var operationSymbol: BinaryOperation?
    
    func digit(value: Double) {
        if operandOne == nil {
            operandOne = value
        } else if operandTwo == nil {
            operandTwo = value
        }
    }
    
    func binary(operation: BinaryOperation) {
        switch operation {
        case .Plus:
            resultValue = (operandOne ?? 0.0) + (operandTwo ?? 0.0)
        case .Minus:
            resultValue = (operandOne ?? 0.0) - (operandTwo ?? 0.0)
        case .Mul:
            resultValue = (operandOne ?? 0.0) * (operandTwo ?? 0.0)
        case .Div:
            resultValue = (operandOne ?? 0.0) / (operandTwo ?? 0.0)
     
        }
        
        
    }
    
    func saveBinaryOperationSymbol(symbol: String){
        switch symbol {
        case "+": operationSymbol = BinaryOperation.Plus
        case "-": operationSymbol = BinaryOperation.Minus
        case "×": operationSymbol = BinaryOperation.Mul
        case "÷": operationSymbol = BinaryOperation.Div
        default: break
        }
    }
    
    
    
    
    func unary(operation: UnaryOperation) {
      /*  switch operation {
        case .sqrt:
            value = (sqrt (operandOne ?? 0.0 ))
        case .sin:
            value = (sin (operandOne ?? 0.0 ))
        case .cos:
            value = (cos(operandOne ?? 0.0 ))
        case .changeSign:
            value = -(operandOne ?? 0.0)
     
        }*/
        
    }
    
    func utility(operation: UtilityOperation) {
        switch operation {
        case .Equal:
            if operationSymbol != nil {
                binary(operation: operationSymbol!)
            }
        case .Clear:
            resultValue! = 0.0
       
    }
    
    
}

}
