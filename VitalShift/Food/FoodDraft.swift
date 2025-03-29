//
//  FoodDraft.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/23/25.
//

import Foundation

struct FoodDraft {
    var name: String
    var isHealthy: Bool
    var isHighInSugar: Bool
    var isHighInCarbs: Bool

    init(from food: Food) {
        name = food.name
        isHealthy = food.isHealthy
        isHighInSugar = food.isHighInSugar
        isHighInCarbs = food.isHighInCarbs
    }
}
