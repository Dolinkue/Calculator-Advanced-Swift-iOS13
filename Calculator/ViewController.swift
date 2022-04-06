//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    //solo se puede acceder en esta clase se elimina la propiedad para usar en otra clase
    private var isFinishedTypingNumber: Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
    
        isFinishedTypingNumber = true
        
        // guard para prevenir error por nill en number
        guard let number = Double(displayLabel.text!) else {
            fatalError()
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
                
            }
            if calcMethod == "%" {
                displayLabel.text = String(number / 100)
            }
            if calcMethod == "AC" {
                displayLabel.text = String(number * 0)
            }
            
        }
        
        
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
                
            }else {
                
                guard let currentDisplayValue = Double(displayLabel.text!) else {
                    fatalError()
                }
                // para no dejar que puedan ingresar mas de  un .
                if numValue == "." {
                    
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
                
            }
            
        
        }
        
        
        
        
    
    }

}

