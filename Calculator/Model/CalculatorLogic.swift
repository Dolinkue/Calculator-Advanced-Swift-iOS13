//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Nicolas Dolinkue on 07/04/2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double
    
    init(number: Double){
        self.number = number
    }
    
    func Calculo(symbol: String) -> Double? {
       
        
        
            if symbol == "+/-" {
               return number * -1
                
            }
            else if symbol == "%" {
               return number * 0.01
            }
            else if symbol == "AC" {
                return number * 0
            }
            
        return nil
        
    }
    
  
  
    
    
    
}
