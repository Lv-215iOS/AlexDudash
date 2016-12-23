//
//  ViewController.swift
//  CalcAlexDudash
//
//  Created by Sasha Dudash on 12/18/16.
//  Copyright © 2016 Sasha Dudash. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {
 
    var outputController : OutputViewController? = nil
    var inputController : InputViewController? = nil
    var calcBrain = CalcModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         calcBrain.result = { (value, error)->() in
            if (value != nil) {
                self.outputController?.output(info: "\(value!)")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerEmbedSegue" {
            outputController = segue.destination as? OutputViewController
            outputController?.mainViewController = self
        } else if segue.identifier == "InputControllerEmbedSegue" {
            inputController = segue.destination as? InputViewController
            inputController?.mainViewController = self
        }
    }
    
    func pressedButton(operation : String) {
    
            switch operation {
            case "+":
                outputController?.addInfo(info: operation)
                calcBrain.binary(operation: .Plus)
            case "-":
                outputController?.addInfo(info: operation)
                calcBrain.binary(operation: .Minus)
            case "×":
                outputController?.addInfo(info: operation)
                calcBrain.binary(operation: .Mul)
            case "÷":
                outputController?.addInfo(info: operation)
                calcBrain.binary(operation: .Div)
            case "%":
                outputController?.addInfo(info: operation)
                calcBrain.binary(operation: .Mod)
            case "^":
                outputController?.addInfo(info: operation)
                calcBrain.binary(operation: .Power)
            case "sin":
                outputController?.addInfo(info: operation)
                calcBrain.unary(operation: .Sin)
            case "cos":
                outputController?.addInfo(info: operation)
                calcBrain.unary(operation: .Cos)
            case "tg":
                outputController?.addInfo(info: operation)
                calcBrain.unary(operation: .Tg)
            case "ctg":
                outputController?.addInfo(info: operation)
                calcBrain.unary(operation: .Ctg)
            case "√":
                outputController?.addInfo(info: operation)
                calcBrain.unary(operation: .Sqrt)
            case "←":
                outputController?.deleteLastCharacter()
                calcBrain.utility(operation: .Clean)
            case ".":
                outputController?.addInfo(info: operation)
                calcBrain.utility(operation: .Dot)
            case "=":
                outputController?.addInfo(info: operation)
                calcBrain.utility(operation: .Equal)
            case "AC":
                outputController?.output(info: "")
                calcBrain.utility(operation: .AClean)

            default:
                outputController?.addInfo(info: operation)
                calcBrain.digit(value: Double(operation)!)
            }
        

    
    
    
    }


}

