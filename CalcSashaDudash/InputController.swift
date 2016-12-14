//
//  InputController.swift
//  CalcSashaDudash
//
//  Created by adminaccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

protocol InputInterface {
    var buttonDidPress: ((_ operation: String)->())? {get set}
}


class InputController : UIViewController, InputInterface {
    
    var buttonDidPress: ((String) -> ())? = nil
    
    @IBAction func pressDigit(_ sender: UIButton) {
        
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func binaryOperationPressed(_ sender: UIButton) {
        
        buttonDidPress?(sender.currentTitle!)
        
    }
    
    @IBAction func equalOperationPressed(_ sender: UIButton) {
        
        buttonDidPress?(sender.currentTitle!)
    }
}
