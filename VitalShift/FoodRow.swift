//
//  FoodRow.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI

struct FoodRow: View {
    var food: Food

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(food.name)
                    .font(.headline)
                    .padding(.bottom, 2)

                HStack(spacing: 10) {
                    Text(food.isHealthy ? "Healthy" : "Unhealthy")
                        .foregroundColor(food.isHealthy ? .green : .red)

                    Spacer()

                    Text("Sugar")
                        .foregroundColor(food.isHighInSugar ? .red : .gray)

                    Text("Carbs")
                        .foregroundColor(food.isHighInCarbs ? .red : .gray)
                }
                .font(.subheadline)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    let previewFood1 = Food(name:"Apple",
                           isHealthy: true,
                           isHighInSugar: true,
                           isHighInCarbs: false)
    
    let previewFood2 = Food(name:"Cake",
                           isHealthy: false,
                           isHighInSugar: true,
                           isHighInCarbs: true)
    
    Group {
        FoodRow(food: previewFood1)
        FoodRow(food: previewFood2)
    }
}
