//
//  MealList.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/25/25.
//

import SwiftUI
import SwiftData


struct MealList: View {
    @Query var meals: [Meal]
    @Environment(\.modelContext) private var context

    @State private var newMeal: Meal?
    @State private var mealToDelete: Meal?
    @State private var showDeleteAlert = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(meals.sorted { $0.date < $1.date }) { meal in
                    NavigationLink {
                        MealDetail(meal: meal)
                    } label: {
                        MealRow(meal: meal)
                    }
                }
                .onDelete { indexSet in
                    if let index = indexSet.first {
                        let sortedMeals = meals.sorted { $0.date > $1.date }
                        mealToDelete = sortedMeals[index]
                        showDeleteAlert = true
                    }
                }
                .alert("Delete Meal?", isPresented: $showDeleteAlert, presenting: mealToDelete) { meal in
                    Button("Delete", role: .destructive) {
                        context.delete(meal)
                    }
                    Button("Cancel", role: .cancel) { }
                } message: { _ in
                    Text("Are you sure?")
                }
            }
            .animation(.default, value: meals)
            .navigationTitle("Meals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(item: $newMeal) { meal in
                MealConfig(meal: meal, isNewMeal: true)
                    .interactiveDismissDisabled(true)
            }
        } detail: {
            Text("Make a Meal.")
        }
    }
    
    private func addItem() {
        let calendar = Calendar.current
        let today = Date()

        // Set the date to today with 8:00 AM as the time
        var comps = calendar.dateComponents([.year, .month, .day], from: today)
        comps.hour = 8
        comps.minute = 0
        comps.second = 0

        let breakfastTime = calendar.date(from: comps) ?? today

        // Create and insert the meal
        let meal = Meal(type: .breakfast, date: breakfastTime)
        context.insert(meal)
        newMeal = meal
    }

    private func roundUpToNext15Minutes(_ date: Date) -> Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.hour, .minute], from: date)
        let minute = components.minute ?? 0
        let remainder = minute % 15
        if remainder != 0 {
            components.minute! += (15 - remainder)
        }
        components.second = 0
        components.nanosecond = 0
        return calendar.date(from: components) ?? date
    }
}



#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Meal.self, configurations: config)
    let context = container.mainContext

    // Insert sample meals
    let calendar = Calendar.current
    let today = Date()

    func date(hour: Int) -> Date {
        var comps = calendar.dateComponents([.year, .month, .day], from: today)
        comps.hour = hour
        comps.minute = 0
        return calendar.date(from: comps)!
    }

    context.insert(Meal(type: .breakfast, date: date(hour: 8)))
    context.insert(Meal(type: .lunch, date: date(hour: 12)))
    context.insert(Meal(type: .dinner, date: date(hour: 18)))

    return MealList().modelContainer(container)
}
