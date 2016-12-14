//
//  InputController.swift
//  CalcSashaDudash
//
//  Created by adminaccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

protocol InputInterfaceProtocol{



}


class InputController : UIViewController , InputInterfaceProtocol{
    
    var mainCalculatorController : CalculatorController? = nil
    
    
    
    @IBAction func pressDigit(_ sender: UIButton) {
        
        mainCalculatorController?.digitPressed (operation : sender.currentTitle! )
    }
    
    
    
    @IBAction func binaryOperationPressed(_ sender: UIButton) {
        
        mainCalculatorController?.binaryOperationPressed (operation : sender.currentTitle!)
        
    }
    
    
    @IBAction func equalOperationPressed(_ sender: UIButton) {
        
        mainCalculatorController?.equalPressed(operation: sender.currentTitle!)
    }
    
    
    
}
