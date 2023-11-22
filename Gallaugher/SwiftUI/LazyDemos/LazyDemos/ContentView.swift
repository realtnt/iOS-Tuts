//
//  ContentView.swift
//  LazyDemos
//
//  Created by Theo Ntogiakos on 21/11/2023.
//

import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 10)
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<1000) { i in
                    let _ = print("Dang \(i)")
                    RedAndCyanView(i: i)
                }
            }
        }
        .padding()
    }
}

struct RedAndCyanView: View {
    var i: Int
    var body: some View {
        ZStack {
            Color.red
            Text("\(i)")
                .padding()
                .background(.cyan)
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    ContentView()
}

