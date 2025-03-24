//
//  FoodDetail.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI
import SwiftData


struct FoodConfig: View {
    @Environment(\.modelContext) private var context
    @State private var alertMessage: String?
    @State private var showAlert = false
    
    @Environment(\.dismiss) private var dismiss

    var food: Food
    @State private var draft: FoodDraft

    init(food: Food) {
        self.food = food
        _draft = State(initialValue: FoodDraft(from: food))
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                TextField("Food Name", text: $draft.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Divider()

                Toggle("Healthy", isOn: $draft.isHealthy)
                    .padding(.horizontal)

                Divider()

                Toggle("High in Sugar", isOn: $draft.isHighInSugar)
                    .padding(.horizontal)

                Toggle("High in Carbs", isOn: $draft.isHighInCarbs)
                    .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationTitle("Configure Food")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if let error = validateName(draft.name) {
                            alertMessage = error
                            showAlert = true
                        } else {
                            food.name = draft.name
                            food.isHealthy = draft.isHealthy
                            food.isHighInSugar = draft.isHighInSugar
                            food.isHighInCarbs = draft.isHighInCarbs
                            dismiss()
                        }
                    }
                    .alert("Invalid Name", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text(alertMessage ?? "Unknown error")
                    }
                }
            }
        }
        
    }
    
    func validateName(_ name: String) -> String? {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            return "Name cannot be empty."
        }
        if trimmed.lowercased() == "new food" {
            return "\"New Food\" is a reserved name."
        }
        if !isFoodNameUnique(trimmed.lowercased()) {
            return "\(trimmed) is already in use."
        }

        return nil
    }
    
    func isFoodNameUnique(_ name: String) -> Bool {
        let fetchDescriptor = FetchDescriptor<Food>(
            sortBy: [SortDescriptor(\.name, order: .forward)]
        )

        do {
            let allFoods = try context.fetch(fetchDescriptor)
            for f in allFoods {
                print("Found food: \(f.name)")
            }

            return !allFoods.contains {
                $0 !== food && $0.name.lowercased() == name.lowercased()
            }

        } catch {
            print("Failed to fetch foods: \(error)")
            return true  // Fail-safe: assume it's unique
        }
    }
    
}


// Preview
#Preview {
    let previewFood = Food(name:"Preview Food",
                           isHealthy: false,
                           isHighInSugar: false,
                           isHighInCarbs: false)
    FoodConfig(food: previewFood)
}
