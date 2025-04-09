//
//  DeviceMotion.swift
//  gyroapp
//
//  Created by Ola Loevholm on 09/03/2025.
//

import Foundation
import CoreMotion
import SwiftUI

class MotionSensorManager : ObservableObject {
    private var motionManager: CMMotionManager = CMMotionManager()
    
    @Published var accelerometerCoordinates3D: Coordinates3D?
    @Published var magnetometerCoordinates3D: Coordinates3D?
    @Published var gyroscopeCoordinates3D: Coordinates3D?
    
    init() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.accelerometerUpdateInterval = 1
            motionManager.magnetometerUpdateInterval = 1
            motionManager.gyroUpdateInterval = 1
            motionManager.startAccelerometerUpdates(to: .main) { [weak self] (data, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.accelerometerCoordinates3D = Coordinates3D(x: data.acceleration.x, y: data.acceleration.y, z: data.acceleration.z)
                    }
                }
            }
            motionManager.startMagnetometerUpdates(to: .main) { [weak self] (data, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.magnetometerCoordinates3D = Coordinates3D(x: data.magneticField.x, y: data.magneticField.y, z: data.magneticField.z)
                    }
                }
            }
            motionManager.startGyroUpdates(to: .main) { [weak self] (data, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.gyroscopeCoordinates3D = Coordinates3D(x: data.rotationRate.x, y: data.rotationRate.y, z: data.rotationRate.z)
                    }
                }
            }
        }
    }

}

