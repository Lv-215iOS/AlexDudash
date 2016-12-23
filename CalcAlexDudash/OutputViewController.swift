//
//  OutputViewController.swift
//  CalcAlexDudash
//
//  Created by Sasha Dudash on 12/18/16.
//  Copyright © 2016 Sasha Dudash. All rights reserved.
//

import UIKit

protocol OutputInterface {
    func output(info: String)
}

class OutputViewController: UIViewController, OutputInterface{
    
    @IBOutlet weak var labelResult: UILabel!
    
    
    func output(info: String){
        labelResult.text = info
    }
    
    func addInfo(info: String){
        if labelResult.text != nil {
            labelResult.text = labelResult.text! + info
        } else {
            labelResult.text = info
        }
    }
    
    func  mainLabel() -> String {
        if labelResult.text != nil {
            return labelResult.text!
        }
        return ""
    }
    
    func deleteLastCharacter() {
        labelResult.text!.remove(at: labelResult.text!.index(before: labelResult.text!.endIndex))
    }
    
    
    var mainViewController : CalculatorController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
}
