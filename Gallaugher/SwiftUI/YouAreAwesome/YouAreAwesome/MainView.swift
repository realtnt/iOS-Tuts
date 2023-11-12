//
//  MainView.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 11/11/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("You Are Awesome") {
                    YouAreAwesomeView()
                }
                NavigationLink("Namaste") {
                    NamasteView()
                }
                NavigationLink("SFSymbols") {
                    SFSymbolsView()
                }
                NavigationLink("Images") {
                    ImagesView()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
