//
//  ContentView.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        FoodList()
        
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
