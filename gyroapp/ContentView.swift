//
//  ContentView.swift
//  gyroapp
//
//  Created by Ola Loevholm on 09/03/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var motionSensorManager: MotionSensorManager
    
    init(sensorManager: MotionSensorManager = MotionSensorManager()) {
        _motionSensorManager = StateObject(wrappedValue: sensorManager)
    }
    
    var body: some View {
        VStack {
            Text("Motion sensors:")
                .fontWeight(.heavy)
            Text("Accelerometer:")
                .fontWeight(.semibold)
            let accelerometer = motionSensorManager.accelerometerCoordinates3D
            let magnetometer = motionSensorManager.magnetometerCoordinates3D
            let gyroscope = motionSensorManager.gyroscopeCoordinates3D
            HStack {
                Text(accelerometer?.toString() ?? "N/A")
            }
            Text("Magnetometer:")
                .fontWeight(.semibold)
            HStack {
                Text(magnetometer?.toString() ?? "N/A")
            }
            Text("Gyroscope:")
                .fontWeight(.semibold)
            HStack {
                Text(gyroscope?.toString() ?? "N/A")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(sensorManager: MotionSensorManager())
}
