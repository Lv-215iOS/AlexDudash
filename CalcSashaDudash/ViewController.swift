//
//  ViewController.swift
//  CalcSashaDudash
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayResult: UILabel!
    
    private var userIsTypingNow = false
    
    @IBAction func touchSomeNumber(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if userIsTypingNow {
            let textCurrentlyInDisplay = displayResult.text!
            displayResult.text = textCurrentlyInDisplay + number
            
        }
        else
        {
            displayResult.text = number
        }
        userIsTypingNow = true
        
        
    }
    
    private var showValue : Double {
        get {
            return Double(displayResult.text!)!
        }
        set {
            displayResult.text = String(newValue)
        }
    }
    
    private var calculation = CalculatorItSelf()
    
    @IBAction func doSomeOfTheOperations(_ sender: UIButton) {
        if userIsTypingNow {
            calculation.setOperand(operand: showValue)
        }
        userIsTypingNow = false
        if let mathematicalSymbol = sender.currentTitle{
            calculation.performOperation(symbol: mathematicalSymbol)
        }
        showValue = calculation.result
        
    }
    
    
}




