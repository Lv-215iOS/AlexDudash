//
//  InputViewController.swift
//  CalcAlexDudash
//
//  Created by Sasha Dudash on 12/18/16.
//  Copyright © 2016 Sasha Dudash. All rights reserved.
//

import UIKit
import AVFoundation

class InputViewController: UIViewController {
    
    @IBOutlet weak var cosButton: UIButton!
    @IBOutlet weak var sinButton: UIButton!
    @IBOutlet weak var tanButton: UIButton!
    @IBOutlet weak var ctgButton: UIButton!
    @IBOutlet weak var sqrtButton: UIButton!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var switchPro: UISwitch!
    
    @IBOutlet var buttonsToDisplayAfterSwitch: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        audioForAllTheButtons.play()
        buttonDidPress?(sender.currentTitle!)
    }
    
    var audioForAllTheButtons = AVAudioPlayer()
    var buttonDidPress: ((String) -> ())? = nil
    
    
    @IBAction func switchProCalc(_ sender: UISwitch) {
        if switchPro.isOn {
            for button in buttonsToDisplayAfterSwitch {
                
                button.isHidden = false
                button.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                UIView.animate(withDuration: 2.0,
                               delay: 0,
                               usingSpringWithDamping: 0.2,
                               initialSpringVelocity: 6.0,
                               options: .allowUserInteraction,
                               animations: { [weak self] in
                                self?.cosButton.transform = .identity
                    },
                               completion: nil)
                UIView.animate(withDuration: 2.0,
                               delay: 0,
                               usingSpringWithDamping: 0.2,
                               initialSpringVelocity: 6.0,
                               options: .allowUserInteraction,
                               animations: { [weak self] in
                                self?.sinButton.transform = .identity
                    },
                               completion: nil)
                UIView.animate(withDuration: 2.0,
                               delay: 0,
                               usingSpringWithDamping: 0.2,
                               initialSpringVelocity: 6.0,
                               options: .allowUserInteraction,
                               animations: { [weak self] in
                                self?.tanButton.transform = .identity
                    },
                               completion: nil)
                UIView.animate(withDuration: 2.0,
                               delay: 0,
                               usingSpringWithDamping: 0.2,
                               initialSpringVelocity: 6.0,
                               options: .allowUserInteraction,
                               animations: { [weak self] in
                                self?.ctgButton.transform = .identity
                    },
                               completion: nil)
                UIView.animate(withDuration: 2.0,
                               delay: 0,
                               usingSpringWithDamping: 0.2,
                               initialSpringVelocity: 6.0,
                               options: .allowUserInteraction,
                               animations: { [weak self] in
                                self?.sqrtButton.transform = .identity
                    },
                               completion: nil)
                UIView.animate(withDuration: 2.0,
                               delay: 0,
                               usingSpringWithDamping: 0.2,
                               initialSpringVelocity: 6.0,
                               options: .allowUserInteraction,
                               animations: { [weak self] in
                                self?.powerButton.transform = .identity
                    },
                               completion: nil)
            }
            
            
        } else {
            for button in buttonsToDisplayAfterSwitch {
                button.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // animation
        switchPro.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.switchPro.transform = .identity
            },
                       completion: nil)
        
        for button in buttonsToDisplayAfterSwitch {
            button.isHidden = true
        }
        // audio for buttons
        do {
            audioForAllTheButtons = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "button-16", ofType: "wav")!))
            audioForAllTheButtons.prepareToPlay()
        }
        catch {
            print(error)
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
