//
//  UIKitDatePicker.swift
//  VitalShift
//
//  Created by Troy Mulder on 3/25/25.
//

import SwiftUI
import UIKit

struct UIKitDatePicker: UIViewRepresentable {
    @Binding var date: Date
    var mode: UIDatePicker.Mode = .time
    var minuteInterval: Int = 15

    func makeUIView(context: Context) -> UIDatePicker {
        let picker = UIDatePicker()
        picker.datePickerMode = mode
        picker.minuteInterval = minuteInterval
        picker.addTarget(context.coordinator, action: #selector(Coordinator.dateChanged(_:)), for: .valueChanged)
        return picker
    }

    func updateUIView(_ uiView: UIDatePicker, context: Context) {
        uiView.date = date
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(date: $date)
    }

    class Coordinator: NSObject {
        var date: Binding<Date>

        init(date: Binding<Date>) {
            self.date = date
        }

        @objc func dateChanged(_ sender: UIDatePicker) {
            self.date.wrappedValue = sender.date
        }
    }
}
