//
//  MealDetail.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/25/25.
//

import SwiftUI

struct MealDetail: View {
    let meal: Meal
    @State private var showingConfig = false

    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: meal.date)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
//                Text(meal.type.rawValue.capitalized)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                
//                Text(formattedTime)
//                    .font(.title2)
//                    .foregroundColor(.gray)
//                
//                Spacer()
            }
            .padding()
            .navigationTitle("\(meal.type.rawValue.capitalized) @ \(formattedTime)")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") {
                    showingConfig = true
                }
            }
        }
        .sheet(isPresented: $showingConfig) {
            MealConfig(meal: meal, isNewMeal: false)
        }
    }
    
}

#Preview {
    let noon: Date = {
        var components = DateComponents()
        components.hour = 12
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }()

    let previewMeal = Meal(type: .lunch, date: noon)
    return MealDetail(meal: previewMeal)
}
