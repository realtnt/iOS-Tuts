//
//  TextBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Theo Ntogiakos on 27/06/2023.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.body)
//            .fontWeight(.semibold)
            .underline(color: Color.red)
            .strikethrough(color: Color.green)
    }
}

#Preview {
    TextBootcamp()
}
