//
//  Food.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/23/25.
//

import Foundation
import SwiftData


@Model
class Food {
    var name: String
    var isHealthy: Bool
    var isHighInSugar: Bool
    var isHighInCarbs: Bool

    init(name: String, isHealthy: Bool, isHighInSugar: Bool, isHighInCarbs: Bool) {
        self.name = name
        self.isHealthy = isHealthy
        self.isHighInSugar = isHighInSugar
        self.isHighInCarbs = isHighInCarbs
    }
}
