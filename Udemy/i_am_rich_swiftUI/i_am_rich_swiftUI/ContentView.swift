//
//  ContentView.swift
//  i_am_rich_swiftUI
//
//  Created by Ntogiakos, Theodoros on 22/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemCyan)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("I Am Rich")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
