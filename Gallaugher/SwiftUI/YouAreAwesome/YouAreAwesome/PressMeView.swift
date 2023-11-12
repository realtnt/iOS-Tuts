//
//  PressMeView.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 12/11/2023.
//

import SwiftUI

struct PressMeView: View {
    @State private var counter = 0
    var body: some View {
        VStack {
            Text("Press Count: \(counter)")
            Button("Press Me") {
                counter += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .font(.title2)
    }
}

#Preview {
    PressMeView()
}
