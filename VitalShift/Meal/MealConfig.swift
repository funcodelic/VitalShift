//
//  MealConfig.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/25/25.
//

import SwiftUI
import SwiftData

struct MealConfig: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    var meal: Meal
    @State private var draft: MealDraft
    var isNewMeal: Bool
    
    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: draft.date)
    }

    init(meal: Meal, isNewMeal: Bool = false) {
        self.meal = meal
        self.isNewMeal = isNewMeal
        _draft = State(initialValue: MealDraft(from: meal))
    }

    var body: some View {
       NavigationView {
            VStack(alignment: .center, spacing: 25) {
                HStack(alignment: .center, spacing: 25) {
                    VStack(alignment: .center) {
                        Picker("Meal Type", selection: $draft.type) {
                            ForEach(Meal.MealType.allCases, id: \.self) { type in
                                Text(type.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.menu)
                        .frame(width: 130) // Fix width to prevent jumpiness
                    }

                    VStack(alignment: .center) {
                        UIKitDatePicker(date: $draft.date)
                            .frame(width: 150) // Or whatever looks clean
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("\(draft.type.rawValue.capitalized) @ \(formattedTime)")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        if isNewMeal {
                            context.delete(meal)
                        }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        meal.type = draft.type
                        meal.date = draft.date
                        dismiss()
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
    MealConfig(meal: sampleMeal)
}
