//
//  SpeedComponents.swift
//  CalculateTrueAirSpeed
//
//  Created by Nazmi Yavuz on 23.06.2021.
//

import Foundation

struct SpeedComponents {
    
    let indicatedAirSpeed: Double
    
    let temperature: Double
    
    let altitude: Double
    
    var trueAirSpeed: Int {
        return calculateTrueAirSpeed()
    }
    
    // MARK: - Private Functions
    
    private func calculateTrueAirSpeed() -> Int {
        
        let value1 = altitude / 600
        
        let value2 = 15 - (1.98 * altitude / 1000)
        
        let value3 = temperature - value2
        
        let value4 = value3 * 0.2
        
        let value5 = ((value1 + value4) / 100) + 1
        
        let value6 = indicatedAirSpeed * value5
        
        return Int(round(value6))
        
    }
    
}
