//
//  FoodList.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI
import SwiftData


struct FoodList: View {
    @Query var foods: [Food]
    @Environment(\.modelContext) private var context
    
    @State private var newFood: Food?
    @State private var foodToDelete: Food?
    @State private var showDeleteAlert = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(foods.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }) { food in
                    NavigationLink {
                        FoodDetail(food: food)
                    } label: {
                        FoodRow(food: food)
                    }
                }
                .onDelete { indexSet in
                    if let index = indexSet.first {
                        let sortedFoods = foods.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
                        foodToDelete = sortedFoods[index]
                        showDeleteAlert = true
                    }
                }
                .alert("Delete Food?", isPresented: $showDeleteAlert, presenting: foodToDelete) { food in
                    Button("Delete", role: .destructive) {
                        context.delete(food)
                    }
                    Button("Cancel", role: .cancel) { }
                } message: { food in
                    Text("Are you sure you want to delete \"\(food.name)\"?")
                }
            }
            .animation(.default, value: foods)
            .navigationTitle("Foods")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        addItem()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(item: $newFood) { food in
                FoodConfig(food: food)
            }
        } detail: {
            Text("Select a food.")
        }
        
        
    }

    private func addItem() {
        let proposedName = "New Food"
        let item = Food(name: proposedName, isHealthy: false, isHighInSugar: false, isHighInCarbs: false)
        context.insert(item)
        newFood = item
    }

    private func isFoodNameUnique(_ name: String) -> Bool {
        !foods.contains(where: { $0.name.localizedCaseInsensitiveCompare(name) == .orderedSame })
    }
    
    private func printContextCount() {
        do {
            let allFoods = try context.fetch(FetchDescriptor<Food>())
            print("Food count in context: \(allFoods.count)")
        } catch {
            print("Failed to fetch foods: \(error)")
        }
    }
}


// Preview
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Food.self, configurations: config)

    // Insert sample data into the context
    let context = container.mainContext
    context.insert(Food(name: "Apple", isHealthy: true, isHighInSugar: false, isHighInCarbs: false))
    context.insert(Food(name: "Donut", isHealthy: false, isHighInSugar: true, isHighInCarbs: true))

    return FoodList()
        .modelContainer(container)
}
