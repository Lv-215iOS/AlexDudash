//
//  ViewController.swift
//  CalcSashaDudash
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//


import UIKit

class CalculatorController: UIViewController {
    
    
    var outputController: OutputController? = nil
    var inputController: InputController? = nil
    
    
    var userIsTypingRightNow = false
    var calculatorBrain = CalculatorBrain()
    ////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private var currentInput: Double {
        get {
            return Double((self.outputController?.displayResult.text!)!)!
        }
        set {
            self.outputController?.displayResult.text = "\(newValue)"
            userIsTypingRightNow = false
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerEmbedSegue" {
            outputController = segue.destination as? OutputController                //swift casting
            outputController?.mainCalculatorController = self
        } else if segue.identifier == "InputControllerEmbedSegue"{
            inputController = segue.destination as?InputController
            inputController?.mainCalculatorController = self
        }
        
        }
    
    func digitPressed (operation : String){
        
        if userIsTypingRightNow {
            self.outputController?.displayResult.text! = (self.outputController?.displayResult.text!)! + operation
        }
        else{
        self.outputController?.displayResult?.text = operation
        }
        userIsTypingRightNow = true
        
    }
    
    func binaryOperationPressed (operation : String){
        if userIsTypingRightNow {
        
        calculatorBrain.digit(value: currentInput)
        calculatorBrain.saveBinaryOperationSymbol(symbol: operation)
        userIsTypingRightNow = false
        }
    }
    
    
    func equalPressed(operation : String) {
        
        calculatorBrain.result = { (resultValue, error)->() in
            self.outputController?.displayResult.text = String(describing: resultValue!)
        }
        
        calculatorBrain.digit(value: currentInput)
        calculatorBrain.utility(operation: UtilityOperation.Equal)
        
    }
    
    
}






