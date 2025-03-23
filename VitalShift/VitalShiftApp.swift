//
//  VitalShiftApp.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI

@main
struct VitalShiftApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
