//
//  FoodList.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI

struct FoodList: View {
    @Environment(ModelData.self) var modelData
    
    var foods: [Food] {
        modelData.foods.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
    }
    
    var body: some View {
        
        NavigationSplitView {
            List {
                ForEach(foods) { food in
                    NavigationLink {
                        FoodDetail(food: food)
                    } label: {
                        FoodRow(food: food)
                    }
                }
            }
            .animation(.default, value: foods)
            .navigationTitle("Foods")
        } detail: {
            Text("Select a food.")
        }
        
    }
}


// Preview
#Preview {
    FoodList()
        .environment(ModelData())
}
