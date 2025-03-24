//
//  VitalShiftApp.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI
import SwiftData

@main
struct VitalShiftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Food.self)
    }
}
