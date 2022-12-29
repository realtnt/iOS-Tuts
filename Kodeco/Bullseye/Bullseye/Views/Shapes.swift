//
//  Shapes.swift
//  Bullseye
//
//  Created by Ntogiakos, Theo on 01/09/2022.
//

import SwiftUI
import UIKit

struct Shapes: View {
  @State private var wideShapes = true
  
  var body: some View {
    VStack {
      if !wideShapes {
        Circle()
        .strokeBorder(Color.blue, lineWidth: 20.0)
        .frame(width: 200.0, height: 100.0)
      }
      
      RoundedRectangle(cornerRadius: 20.0)
        .fill(UIColor(named: "ButtonColor") == nil ? Color.red : Color("ButtonColor"))
        .frame(width: wideShapes ? 200 : 100)
      Capsule()
        .fill(Color.yellow)
        .frame(width: wideShapes ? 200 : 100)
      Ellipse()
        .fill(Color.yellow)
        .frame(width: wideShapes ? 200 : 100)
      Button(action: {
        withAnimation {
          wideShapes.toggle()
        }
      })
      {
        ButtonText(text: "Animate")
      }
      .padding()
    }
    .background(Color.green)
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
