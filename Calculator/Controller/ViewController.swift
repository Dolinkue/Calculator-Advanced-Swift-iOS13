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
    
    
    private var displaValue: Double {
        
        get{
            // guard para prevenir error por nill en number
            guard let number = Double(displayLabel.text!) else {
                fatalError()
            }
            return number
        }
        
        set {
            
            displayLabel.text = String(newValue)
            
        }
    }
    
    private var calculo = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
    
        isFinishedTypingNumber = true
        //cuando un calculo es precionado set el numero
        calculo.setNumber(displaValue)
       
        if let calcMethod = sender.currentTitle {
           
            if let result = calculo.Calculo(symbol: calcMethod)  {
                displaValue = result
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
                
                
                // para no dejar que puedan ingresar mas de  un .
                if numValue == "." {
                    
                    let isInt = floor(displaValue) == displaValue
                    
                    //aca se chequea si es falso y no deja agregar otro . ya que no seria mas un Double
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
                
            }
            
        
        }
        
        
        
        
    
    }

}

