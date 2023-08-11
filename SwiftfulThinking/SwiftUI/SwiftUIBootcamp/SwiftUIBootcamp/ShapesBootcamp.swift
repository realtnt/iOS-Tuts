//
//  ShapesBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Theo Ntogiakos on 28/06/2023.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
        Circle()
//            .fill(Color.blue)
            .stroke(Color.red, style:
                        StrokeStyle(lineWidth: 20, lineCap: .butt,
                                    dash: [5, 1, 5, 1, 5, 1, 5, 1, 5])
                    )
    }
}

#Preview {
    ShapesBootcamp()
}
