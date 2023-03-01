//
//  WeakSelfBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Theo Ntogiakos on 22/02/2023.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate", destination: WeakSelfSecondScreen())
                .navigationTitle("Screen 1")
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(.green)
                    .cornerRadius(10)
            , alignment: .topTrailing
        )
        .padding()
    }
}

class WeakSelfSecondScreenBootcampViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("Initialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    func getData() {
        DispatchQueue.global().async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
                self?.data = "New data!!!"
            }
        }
    }
    
    deinit {
        print("Deinitialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
}

struct WeakSelfSecondScreen: View {
    @StateObject var viewModel = WeakSelfSecondScreenBootcampViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            if let data = viewModel.data {
                Text(data)
            }
        }
        .navigationTitle("Screen 2")
    }
}

struct WeakSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootcamp()
    }
}
