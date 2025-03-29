//
//  FoodConfig.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI


struct FoodDetail: View {
    let food: Food
    @State private var showingConfig = false

    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            Text(food.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(food.isHealthy ? "Healthy" : "Unhealthy")
                .foregroundColor(food.isHealthy ? .green : .red)
                .font(.title2)
                .fontWeight(.semibold)

            HStack(spacing: 20) {
                Text("Sugar")
                    .foregroundColor(food.isHighInSugar ? .red : .gray)
                    .font(.headline)

                Text("Carbs")
                    .foregroundColor(food.isHighInCarbs ? .orange : .gray)
                    .font(.headline)
            }

            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") {
                    showingConfig = true
                }
            }
        }
        .sheet(isPresented: $showingConfig) {
            FoodConfig(food: food)
        }
    }
}


#Preview {
    let previewFood = Food(name:"Preview Food",
                           isHealthy: false,
                           isHighInSugar: false,
                           isHighInCarbs: false)
    FoodDetail(food: previewFood)
}
