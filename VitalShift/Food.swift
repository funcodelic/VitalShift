//
//  Food.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import Foundation

// Food struct
struct Food: Identifiable {
    let id = UUID()
    let name: String
    var isHealthy: Bool
    var isHighInSugar: Bool
    var isHighInCarbs: Bool
}
