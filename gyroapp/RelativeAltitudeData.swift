//
//  PressureData.swift
//  gyroapp
//
//  Created by Ola Loevholm on 09/04/2025.
//

import Foundation

struct RelativeAltitudeData {
    
    var pressure: NSNumber
    var relativeAltitude: NSNumber
    
    init(pressure: NSNumber, relativeAltitude: NSNumber) {
        self.pressure = pressure
        self.relativeAltitude = relativeAltitude
    }
    
    func toString() -> String {
        return "Pressure: \(NSString(format: "%.2f" , pressure)) \n Relative Altitude: \(NSString(format: "%.2f" , relativeAltitude))"
    }
    
}
