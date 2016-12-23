//
//  InputViewController.swift
//  CalcAlexDudash
//
//  Created by Sasha Dudash on 12/18/16.
//  Copyright © 2016 Sasha Dudash. All rights reserved.
//

import UIKit


class InputViewController: UIViewController {
    
    var mainViewController : CalculatorController? = nil
    
    @IBOutlet weak var cosButton: UIButton!
    @IBOutlet weak var sinButton: UIButton!
    @IBOutlet weak var tanButton: UIButton!
    @IBOutlet weak var ctgButton: UIButton!
    @IBOutlet weak var sqrtButton: UIButton!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var switchPro: UISwitch!
   
    @IBAction func buttonPressed(_ sender: UIButton) {
        mainViewController?.pressedButton(operation: sender.currentTitle!)
    }
    
    @IBAction func switchProCalc(_ sender: UISwitch) {
        if switchPro.isOn {
            cosButton.isHidden = false
            sinButton.isHidden = false
            tanButton.isHidden = false
            ctgButton.isHidden = false
            sqrtButton.isHidden = false
            powerButton.isHidden = false
         
        }else {
            cosButton.isHidden = true
            sinButton.isHidden = true
            tanButton.isHidden = true
            ctgButton.isHidden = true
            sqrtButton.isHidden = true
            powerButton.isHidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        cosButton.isHidden = true
        sinButton.isHidden = true
        tanButton.isHidden = true
        ctgButton.isHidden = true
        sqrtButton.isHidden = true
        powerButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
