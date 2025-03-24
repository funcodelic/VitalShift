//
//  FoodDetail.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI
import SwiftData


struct FoodConfig: View {
    @Environment(\.dismiss) private var dismiss

    var food: Food
    @State private var draft: FoodDraft

    init(food: Food) {
        self.food = food
        _draft = State(initialValue: FoodDraft(from: food))
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                TextField("Food Name", text: $draft.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Divider()

                Toggle("Healthy", isOn: $draft.isHealthy)
                    .padding(.horizontal)

                Divider()

                Toggle("High in Sugar", isOn: $draft.isHighInSugar)
                    .padding(.horizontal)

                Toggle("High in Carbs", isOn: $draft.isHighInCarbs)
                    .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationTitle("Configure Food")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        food.name = draft.name
                        food.isHealthy = draft.isHealthy
                        food.isHighInSugar = draft.isHighInSugar
                        food.isHighInCarbs = draft.isHighInCarbs
                        dismiss()
                    }
                }
            }
        }
    }
}


// Preview
#Preview {
    let previewFood = Food(name:"Preview Food",
                           isHealthy: false,
                           isHighInSugar: false,
                           isHighInCarbs: false)
    FoodConfig(food: previewFood)
}
