//
//  FoodConfig.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI

struct FoodConfig: View {
    @State private var name: String = ""
    @State private var isHealthy: Bool = false
    @State private var isHighInSugar: Bool = false
    @State private var isHighInCarbs: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("Food Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            HStack {
                Toggle(isOn: $isHealthy) {
                    Text("Healthy")
                        .padding(.leading, 5)
                }
            }
            .padding(.horizontal)
            
            HStack {
                HStack {
                    Toggle(isOn: $isHighInSugar) {
                        Text("Sugar")
                            .foregroundColor(isHighInSugar ? .red : .gray)
                            .padding(.leading, 5)
                    }
                }
                
                Spacer()
                
                HStack {
                    Toggle(isOn: $isHighInCarbs) {
                        Text("Carbs")
                            .foregroundColor(isHighInCarbs ? .orange : .gray)
                            .padding(.leading, 5)
                    }
                }
                .padding(.leading, 20)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

// Preview
struct FoodConfig_Previews: PreviewProvider {
    static var previews: some View {
        FoodConfig()
    }
}
