//
//  ContentView.swift
//  SwiftUIBootcamp
//
//  Created by Theo Ntogiakos on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .bold()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
