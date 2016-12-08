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
  
    var userIsTypingNow = false
    
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
 


}

