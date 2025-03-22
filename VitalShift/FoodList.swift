//
//  FoodList.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI

struct FoodList: View {
    private let foods: [Food] = [
        Food(name: "Apple", isHealthy: true, isHighInSugar: false, isHighInCarbs: true),
        Food(name: "Chicken", isHealthy: true, isHighInSugar: false, isHighInCarbs: false),
        Food(name: "Olive Oil", isHealthy: true, isHighInSugar: false, isHighInCarbs: false),
        Food(name: "Almonds", isHealthy: true, isHighInSugar: false, isHighInCarbs: false),
        Food(name: "Oats", isHealthy: true, isHighInSugar: false, isHighInCarbs: true),
        Food(name: "Greek Yogurt", isHealthy: true, isHighInSugar: false, isHighInCarbs: false),
        Food(name: "Vegetables", isHealthy: true, isHighInSugar: false, isHighInCarbs: false),
        Food(name: "Seafood", isHealthy: true, isHighInSugar: false, isHighInCarbs: false),
        Food(name: "Whole Wheat Bread", isHealthy: true, isHighInSugar: false, isHighInCarbs: true),
        Food(name: "Tomatoes", isHealthy: true, isHighInSugar: false, isHighInCarbs: false),
        Food(name: "Pasta", isHealthy: true, isHighInSugar: false, isHighInCarbs: true),
        Food(name: "Cheese", isHealthy: true, isHighInSugar: false, isHighInCarbs: false),
        Food(name: "Eggs", isHealthy: true, isHighInSugar: false, isHighInCarbs: false),
        Food(name: "Nuts", isHealthy: true, isHighInSugar: false, isHighInCarbs: false),
        
        Food(name: "Soda", isHealthy: false, isHighInSugar: true, isHighInCarbs: true),
        Food(name: "Hamburger", isHealthy: false, isHighInSugar: false, isHighInCarbs: true),
        Food(name: "Beer", isHealthy: false, isHighInSugar: true, isHighInCarbs: true),
        Food(name: "Fries", isHealthy: false, isHighInSugar: false, isHighInCarbs: true),
        Food(name: "Candy", isHealthy: false, isHighInSugar: true, isHighInCarbs: true)
    ]
    
    var body: some View {
        NavigationSplitView {
            List(foods) { food in
                NavigationLink(destination: FoodDetail(food: food)) {
                    FoodRow(food: food)
                }
            }
            .navigationTitle("Food List")
        } detail: {
            Text("Select a food")
                .foregroundColor(.gray)
        }
    }
}

// Preview
struct FoodList_Previews: PreviewProvider {
    static var previews: some View {
        FoodList()
    }
}
