//
//  MealRow.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/25/25.
//

import SwiftUI

struct MealRow: View {
    var meal: Meal

    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: meal.date)
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(meal.type.rawValue.capitalized)
                    .font(.headline)

                Text(formattedTime)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    let meal1 = Meal(type: .breakfast, date: Date())
    let meal2 = Meal(type: .lunch, date: Date().addingTimeInterval(-3600))
    let meal3 = Meal(type: .dinner, date: Date().addingTimeInterval(-7200))

    Group {
        MealRow(meal: meal1)
        MealRow(meal: meal2)
        MealRow(meal: meal3)
    }
}
