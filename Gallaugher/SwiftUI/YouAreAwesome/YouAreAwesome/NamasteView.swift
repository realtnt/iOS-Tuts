//
//  NamasteView.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 11/11/2023.
//

import SwiftUI

struct NamasteView: View {
    @State private var message = "Namaste"
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "figure.mind.and.body")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.pink)
                .frame(width: .infinity)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.pink)
                .frame(height: 150)

            Spacer()
            
            HStack {
                Button("Awesome") {
                    message = "Awesome"
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button("Great") {
                    message = "Great"
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    NamasteView()
}
