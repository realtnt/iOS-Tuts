//
//  ContentView.swift
//  TheoCard-SwiftUI
//
//  Created by Ntogiakos, Theodoros on 22/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Me")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .foregroundColor(.accentColor)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.accentColor, lineWidth: 5.0)
                    )
                Text("Theo")
                    .font(Font.custom("PTSerif-Bold", size: 40.0))
                    .bold()
                Text("iOS Developer")
                    .foregroundColor(.accentColor)
                    .font(.system(size: 25))
                    .italic()
                Divider()
                Text("+44 123 456 789")
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(.yellow)
                            .frame(height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.accentColor, lineWidth: 2.0)
                            )
                    }
                    .padding(.vertical)

                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.accentColor, lineWidth: 2.0)
                    .frame(height: 50)


                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.yellow)
                    .frame(height: 50)
                    .overlay(
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.green)
                            Text("theo@ios.dev-fake")
                        }
                    )
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
