//
//  MotionData.swift
//  gyroapp
//
//  Created by Ola Loevholm on 21/03/2025.
//

import Foundation

struct Coordinates3D {
    var x: Double
    var y: Double
    var z: Double
    
    init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    func toString() -> String {
        return "(\(NSString(format: "%.2f" , x)), \(NSString(format: "%.2f" , y)), \(NSString(format: "%.2f" , z)))"
    }
    
}
