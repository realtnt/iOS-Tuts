//
//  ImagesView.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 12/11/2023.
//

import SwiftUI

class ImagesViewModel: ObservableObject {
    @Published var imageNumber = 0
    
    func nextImage() {
        imageNumber = (imageNumber + 1) % 10
    }
    
    func previousImage() {
        guard imageNumber > 0 else {
            imageNumber = 9
            return
        }
        imageNumber = (imageNumber - 1) % 10
    }
    
    func randomImage() {
        var number: Int
        repeat {
            number = Int.random(in: 0...9)
        } while number == imageNumber
        imageNumber = number
    }
}

struct ImagesView: View {
    @StateObject var vm = ImagesViewModel()
    var body: some View {
        
        Spacer()
        
        Image("image\(vm.imageNumber)")
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black)
            )
            .shadow(radius: 15)
            .frame(height: 400)

        Spacer()

        Text("\(vm.imageNumber + 1)")
            .font(.largeTitle)
            .fontWeight(.black)
        
        Spacer()
        
        HStack {
            Button("Previous") {
                vm.previousImage()
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
            
            Button("I Feel Lucky") {
                vm.randomImage()
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
            
            Button("Next") {
                vm.nextImage()
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ImagesView()
}
