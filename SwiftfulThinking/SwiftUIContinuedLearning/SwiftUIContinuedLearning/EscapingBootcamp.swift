//
//  EscapingBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Theo Ntogiakos on 22/02/2023.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    private var count: Int = 0
    
    func getData() {
        count += 1
        downloadData5 { [weak self] data in
            self?.text = "\(data.data) \(self?.count ?? 0)"
        }
    }
    
    func downloadData() -> String {
        return "New data"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New data 2")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("New data 2")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler(DownloadResult(data: "New data 2"))
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler(DownloadResult(data: "New data 2"))
        }
    }
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct DownloadResult {
    let data: String
}

struct EscapingBootcamp: View {
    @StateObject var viewModel = EscapingViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.orange)
            .onTapGesture {
                viewModel.getData()
            }
    }
}

struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}
