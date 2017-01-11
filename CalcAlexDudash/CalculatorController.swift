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
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        calcBrain.result = { (value, error)->() in
            if (value != nil) {
                if value!.isInfinite {
                    self.outputController?.outputInfo(info: "😱")
                } else if value!.isNaN { self.outputController?.outputInfo(info: "😱")
                } else if value == Double(Int(value!)) {
                    self.outputController?.outputInfo(info: "\(Int64(value!))")
                } else {
                    self.outputController?.outputInfo(info: "\(value!)")
                }
            }
        }
        inputController?.buttonDidPress = { [unowned self] (operation)->() in
            self.pressedButton(operation: operation)
        }
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(CalculatorController.handleSwipes(sender:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(CalculatorController.handleSwipes(sender:)))
        
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
    }
    
    func handleSwipes(sender : UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background2.png")!)
        }
        if (sender.direction == .right) {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background3.png")!)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerEmbedSegue" {
            outputController = segue.destination as? OutputViewController
        } else if segue.identifier == "InputControllerEmbedSegue" {
            inputController = segue.destination as? InputViewController
        }
    }
    
    func pressedButton(operation : String) {
        
        switch operation {
            
        // binary operations
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
            
        // unary operations
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
            
        // utility operations
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
            outputController?.outputInfo(info: "")
            calcBrain.utility(operation: .AClean)
            
        default:
            outputController?.addInfo(info: operation)
            calcBrain.digit(value: Double(operation)!)
        }
    }
}

