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
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        calcBrain.result = { (value, error)->() in
            if (value != nil) {
                self.outputController?.outputInfo(info: "\(value!)")
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
                outputController?.appendInfo(info: operation)
                calcBrain.binary(operation: .Plus)
            case "-":
                outputController?.appendInfo(info: operation)
                calcBrain.binary(operation: .Minus)
            case "×":
                outputController?.appendInfo(info: operation)
                calcBrain.binary(operation: .Mul)
            case "÷":
                outputController?.appendInfo(info: operation)
                calcBrain.binary(operation: .Div)
            case "%":
                outputController?.appendInfo(info: operation)
                calcBrain.binary(operation: .Mod)
            case "^":
                outputController?.appendInfo(info: operation)
                calcBrain.binary(operation: .Power)
            case "sin":
                outputController?.appendInfo(info: operation)
                calcBrain.unary(operation: .Sin)
            case "cos":
                outputController?.appendInfo(info: operation)
                calcBrain.unary(operation: .Cos)
            case "tg":
                outputController?.appendInfo(info: operation)
                calcBrain.unary(operation: .Tg)
            case "ctg":
                outputController?.appendInfo(info: operation)
                calcBrain.unary(operation: .Ctg)
            case "√":
                outputController?.appendInfo(info: operation)
                calcBrain.unary(operation: .Sqrt)
            case "←":
                outputController?.deleteLastCharacter()
                calcBrain.utility(operation: .Clean)
            case ".":
                outputController?.appendInfo(info: operation)
                calcBrain.utility(operation: .Dot)
            case "=":
                outputController?.appendInfo(info: operation)
                calcBrain.utility(operation: .Equal)
            case "AC":
                outputController?.outputInfo(info: "")
                calcBrain.utility(operation: .AClean)

            default:
                outputController?.appendInfo(info: operation)
                calcBrain.digit(value: Double(operation)!)
            }
        

    
    
    
    }


}

