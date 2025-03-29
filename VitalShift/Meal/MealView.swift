//
//  MealView.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/25/25.
//

import SwiftUI

struct MealView: View {
    let meal: Meal
    @State private var isEditing = false
    @State private var draft: MealDraft

    init(meal: Meal) {
        self.meal = meal
        _draft = State(initialValue: MealDraft(from: meal))
    }

    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: draft.date)
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 25) {

                if isEditing {
                    HStack(spacing: 25) {
                        VStack(alignment: .center) {
                            Picker("Meal Type", selection: $draft.type) {
                                ForEach(Meal.MealType.allCases, id: \.self) { type in
                                    Text(type.rawValue.capitalized)
                                }
                            }
                            .pickerStyle(.menu)
                            .frame(width: 130)
                        }

                        VStack(alignment: .center) {
                            UIKitDatePicker(date: $draft.date)
                                .frame(width: 150)
                        }
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("\(draft.type.rawValue.capitalized) @ \(formattedTime)")
            .toolbar {
                if isEditing {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            draft = MealDraft(from: meal)
                            isEditing = false
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            meal.type = draft.type
                            meal.date = draft.date
                            isEditing = false
                        }
                    }
                } else {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Edit") {
                            isEditing = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let calendar = Calendar.current
    let sixPM = calendar.date(bySettingHour: 18, minute: 0, second: 0, of: Date())!
    let sampleMeal = Meal(type: .dinner, date: sixPM)
    MealView(meal: sampleMeal)
}
