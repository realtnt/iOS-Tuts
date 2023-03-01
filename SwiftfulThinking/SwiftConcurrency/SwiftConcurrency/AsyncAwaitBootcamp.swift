//
//  AsyncAwaitBootcamp.swift
//  SwiftConcurrency
//
//  Created by Theo Ntogiakos on 21/02/2023.
//

import SwiftUI

class AsyncAwaitBootcampViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func addItem(_ item: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.dataArray.append("addItem in asyncAfter: \(item): \(Thread.current)")
        }
        self.dataArray.append("addItem sync: \(item): \(Thread.current)")
    }
    
    func addItemBackground(_ item: String) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            let itemText = "addItemBackground: \(item): \(Thread.current)"
            DispatchQueue.main.async {
                self.dataArray.append(itemText)
            }
        }
    }
    
    func addAsyncItem1(_ text: String) async {
        let item = "Async Item 1"
        
        await MainActor.run(body: {
            self.dataArray.append(item)
        })
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        let item2 = "Async Item 2"
        await MainActor.run(body: {
            self.dataArray.append(item2)
        })
    }
}

struct AsyncAwaitBootcamp: View {
    @StateObject private var viewModel = AsyncAwaitBootcampViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.dataArray, id: \.self) { data in
                    Text(data)
                        .padding()
                        .background(.green)
                        .cornerRadius(15)
                }
            }
            .onAppear {
                viewModel.addItem("First Item")
            }
            
            Button("Add item") {
                Task() {
                    await viewModel.addAsyncItem1("New Item")
                }
                viewModel.addItem("FINAL!!")
            }
            .padding()
            .background(Color.yellow)
            .clipShape(Capsule())
        }
    }
}

struct AsyncAwaitBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitBootcamp()
    }
}
