//
//  OutputController.swift
//  CalcSashaDudash
//
//  Created by adminaccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

protocol OutpuInterface{
    
 func outputResult()
    
}



class OutputController : UIViewController, OutpuInterface {

    @IBOutlet weak var displayResult: UILabel!
    
    func outputResult() {
        
    }
 
    //
    var mainCalculatorController : OutpuInterface? = nil


}
