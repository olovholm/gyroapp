//
//  ContentView.swift
//  gyroapp
//
//  Created by Ola Loevholm on 09/03/2025.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.purple, Color.blue],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)

struct ContentView: View {
    @StateObject private var motionSensorManager: MotionSensorManager
    
    init(sensorManager: MotionSensorManager = MotionSensorManager()) {
        _motionSensorManager = StateObject(wrappedValue: sensorManager)
    }
    //TODO: Proximity sensor, ambient light, barometer,
    
    var body: some View {
        ZStack {
            backgroundGradient.opacity(0.75)
            VStack {
                Text("Motion sensors:")
                    .fontWeight(.heavy)
                Text("Accelerometer:")
                    .fontWeight(.semibold)
                let accelerometer = motionSensorManager.accelerometerCoordinates3D
                let magnetometer = motionSensorManager.magnetometerCoordinates3D
                let gyroscope = motionSensorManager.gyroscopeCoordinates3D
                let relativeAltitude = motionSensorManager.relativeAltitudeData
                
                
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
                Text("Relative Altitude")
                    .fontWeight(.semibold)
                HStack {
                    Text("\(relativeAltitude?.toString() ?? "N/A")")
                }
            }
            .padding()
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView(sensorManager: MotionSensorManager())
}
