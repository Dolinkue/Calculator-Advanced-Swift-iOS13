//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Nicolas Dolinkue on 07/04/2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (num1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
    
        self.number = number
    
    }
    
    
    mutating func Calculo(symbol: String) -> Double? {
       
        
        if let n = number {
            if symbol == "+/-" {
               return n * -1
                
            }
            else if symbol == "%" {
               return n * 0.01
            }
            else if symbol == "AC" {
                return n * 0
            }
            
            else if symbol == "=" {
                performTwoCalculation(n2: n)
                
            }
            else {
                
                intermediateCalculation = (num1: n, calcMethod: symbol)
            
            }
        }
        
        return nil
        
        }
    
    private func performTwoCalculation(n2: Double) -> Double {
        
        if let n1 = intermediateCalculation?.num1, let operation = intermediateCalculation?.calcMethod {
            if operation == "+" {
                return n1 + n2
            }
            
        }
    }
    
    
    }
    
  
  
    
    
    

