//
//  PressMeView.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 12/11/2023.
//

import SwiftUI

struct PressMeView: View {
    @State private var counter = 0
    @State private var toggleIsOn = true
    @State private var name = ""
    @State private var selectedColor: Color = .red
    @State private var date: Date = Date()
    @State private var stepperValue = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Press Count: \(counter)")
            Button("Press Me") {
                counter += 1
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            TextField("Enter a name", text: $name)
                .textFieldStyle(.roundedBorder)
            Text("Name entered: \(name)")
            Spacer()
            
            Toggle("Toggle:", isOn: $toggleIsOn)
            
            Spacer()
            
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
            ColorPicker("Pick a color:", selection: $selectedColor)
            
            Spacer()
            
            DatePicker("Date:", selection: $date)
            Text("Selected date is: \(date.formatted(date: .abbreviated, time: .shortened))")
            
            Spacer()
            Stepper("Stepper value: \(stepperValue)", value: $stepperValue, in: 1...10)
        }
        .font(.title2)
        .padding()
        
    }
}

#Preview {
    PressMeView()
}
