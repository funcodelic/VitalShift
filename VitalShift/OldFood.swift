//
//  Food.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import Foundation

// Food struct
struct OldFood: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var isHealthy: Bool
    var isHighInSugar: Bool
    var isHighInCarbs: Bool
}
