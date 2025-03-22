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
                    
                    Text(food.isHighInSugar ? "Sugar" : "No Sugar")
                        .foregroundColor(food.isHighInSugar ? .red : .gray)
                    
                    Text(food.isHighInCarbs ? "Carbs" : "Low Carb")
                        .foregroundColor(food.isHighInCarbs ? .orange : .gray)
                }
                .font(.subheadline)
            }
            
            Spacer()
        }
        .padding()
    }
}

// Preview
struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(food: Food(name: "Apple", isHealthy: true, isHighInSugar: true, isHighInCarbs: true))
            .previewLayout(.sizeThatFits)
    }
}
