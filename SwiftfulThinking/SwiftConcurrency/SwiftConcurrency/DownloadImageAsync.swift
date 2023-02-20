//
//  DownloadImageAsync.swift
//  SwiftConcurrency
//
//  Created by Ntogiakos, Theodoros on 20/02/2023.
//

import SwiftUI

class DownloadImageAsyncImageLoader {
    let url = URL(string: "https://picsum.photos/1200")!
    
    func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard let data = data,
              let image = UIImage(data: data),
              let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            return nil
        }
        return image
    }
    
    func downloadWithEscaping(completionHandler: @escaping (_ image: UIImage?, _ error: Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            let image = self?.handleResponse(data: data, response: response)
            completionHandler(image, error)
        }
        .resume()
    }
}


class DownloadImageAsyncViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let loader = DownloadImageAsyncImageLoader()

    func fetchImage() {
        loader.downloadWithEscaping { [weak self] image, error in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}

struct DownloadImageAsync: View {
    @StateObject private var viewModel = DownloadImageAsyncViewModel()

    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
        }
        .onAppear {
            viewModel.fetchImage()
        }
        .onTapGesture {
            viewModel.fetchImage()
        }
    }
}

struct DownloadImageAsync_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageAsync()
    }
}
