//
//  BackgroundThreadBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Theo Ntogiakos on 22/02/2023.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        var newData = [String]()
        DispatchQueue.global().async {
            newData = self.downloadData()
            
            DispatchQueue.main.async {
                self.dataArray = newData
            }
        }
    }
    
    private func downloadData() -> [String] {
        var data = [String]()
        
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThreadBootcamp: View {
    @StateObject var viewModel = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Load data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        viewModel.fetchData()
                    }
                ForEach(viewModel.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct BackgroundThreadBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundThreadBootcamp()
    }
}
