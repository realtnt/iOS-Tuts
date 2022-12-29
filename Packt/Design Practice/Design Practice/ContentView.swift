//
//  ContentView.swift
//  Design Practice
//
//  Created by Ntogiakos, Theodoros on 18/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("I like eggs!")
            .bold()
            .padding()
            .background(.blue)
            .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
