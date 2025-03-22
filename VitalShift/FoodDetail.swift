//
//  FoodDetail.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI

struct FoodDetail: View {
    let food: Food
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
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
    }
}

// Preview
struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(food: Food(name: "Cheese", isHealthy: true, isHighInSugar: false, isHighInCarbs: false))
    }
}
