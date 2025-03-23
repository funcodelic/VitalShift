//
//  FoodConfig.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI


struct FoodConfig: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(ModelData.self) private var modelData

    let food: Food
    @State private var editedFood: Food

    init(food: Food) {
        self.food = food
        _editedFood = State(initialValue: food)
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                TextField("Food Name", text: $editedFood.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Toggle("Healthy", isOn: $editedFood.isHealthy)
                    .padding(.horizontal)

                Toggle("High in Sugar", isOn: $editedFood.isHighInSugar)
                    .padding(.horizontal)

                Toggle("High in Carbs", isOn: $editedFood.isHighInCarbs)
                    .padding(.horizontal)
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
                        if let index = modelData.foods.firstIndex(where: { $0.id == food.id }) {
                            modelData.foods[index] = editedFood
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}



// Preview
#Preview {
    let modelData = ModelData()
    
    return FoodConfig(food: modelData.foods[0])
        .environment(modelData)
}
