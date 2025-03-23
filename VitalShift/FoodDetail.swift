//
//  FoodDetail.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI

//struct FoodDetail: View {
//    @Environment(ModelData.self) var modelData
//    let food: Food
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15) {
//            Text(food.name)
//                .font(.largeTitle)
//                .fontWeight(.bold)
//            
//            Text(food.isHealthy ? "Healthy" : "Unhealthy")
//                .foregroundColor(food.isHealthy ? .green : .red)
//                .font(.title2)
//                .fontWeight(.semibold)
//            
//            HStack(spacing: 20) {
//                Text("Sugar")
//                    .foregroundColor(food.isHighInSugar ? .red : .gray)
//                    .font(.headline)
//                
//                Text("Carbs")
//                    .foregroundColor(food.isHighInCarbs ? .orange : .gray)
//                    .font(.headline)
//            }
//            Spacer()
//        }
//        .padding()
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button("Edit") {
//                    // Edit action goes here
//                }
//            }
//        }
//    }
//}

struct FoodDetail: View {
    @Environment(ModelData.self) var modelData
    let food: Food

    @State private var showingConfig = false

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

// Preview
#Preview {
    let modelData = ModelData()
    
    return FoodDetail(food: modelData.foods[0])
        .environment(modelData)
}
