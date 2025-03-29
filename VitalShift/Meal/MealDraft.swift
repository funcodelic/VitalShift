//
//  MealDraft.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/25/25.
//

import Foundation

struct MealDraft {
    var type: Meal.MealType
    var date: Date

    init(from meal: Meal) {
        type = meal.type
        date = meal.date
    }
}
