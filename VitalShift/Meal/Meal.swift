//
//  Meal.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/25/25.
//

import Foundation
import SwiftData


@Model
class Meal {
    public enum MealType: String, Codable, CaseIterable {
        case breakfast
        case lunch
        case dinner
        case snack
        case drink
        case dessert
    }

    var type: MealType
    var date: Date
    var foods: [Food] = []

    init(type: MealType, date: Date = Date(), foods: [Food] = []) {
        self.type = type
        self.date = date
        self.foods = foods
    }
}


