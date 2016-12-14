//
//  OutputController.swift
//  CalcSashaDudash
//
//  Created by adminaccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

protocol OutpuInterfaceProtocol{
    
    func outputResult()
    
}



class OutputController : UIViewController, OutpuInterfaceProtocol {

    @IBOutlet weak var displayResult: UILabel!
    
    func outputResult() {
        
    }
    
    //
    var mainCalculatorController : CalculatorController? = nil


}
