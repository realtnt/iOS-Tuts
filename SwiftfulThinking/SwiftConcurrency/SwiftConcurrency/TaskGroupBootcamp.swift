//
//  TaskGroupBootcamp.swift
//  SwiftConcurrency
//
//  Created by Theo Ntogiakos on 22/02/2023.
//

import SwiftUI

class TaskgroupBootcampDataManager {
    private let urlString: String = "https://picsum.photos/500"
    
    func fetchImagesWithAsyncLet() async throws -> [UIImage] {
            async let image1 = fetchImage(urlString: urlString)
            async let image2 = fetchImage(urlString: urlString)
            async let image3 = fetchImage(urlString: urlString)
            async let image4 = fetchImage(urlString: urlString)

            return await [try image1, try image2, try image3, try image4]
    }
    
    func fetchImagesWithGroupTask() async throws -> [UIImage] {
        let imageArray = try await withThrowingTaskGroup(of: UIImage.self) { group in
            var images = [UIImage]()
            
            group.addTask { try await self.fetchImage(urlString: self.urlString) }
            group.addTask { try await self.fetchImage(urlString: self.urlString) }
            group.addTask { try await self.fetchImage(urlString: self.urlString) }
            group.addTask { try await self.fetchImage(urlString: self.urlString) }
            
            for try await image in group {
                images.append(image)
            }
            return images
        }
        return imageArray
    }

    private func fetchImage(urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch {
            throw error
        }
    }
}

class TaskgroupBootcampViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    private let dataManager: TaskgroupBootcampDataManager
    
    init(dataManager: TaskgroupBootcampDataManager) {
        self.dataManager = dataManager
    }
    
    func getImages() async {
        if let images = try? await dataManager.fetchImagesWithGroupTask() {
            await MainActor.run {
                self.images.append(contentsOf: images)
            }
        }
    }
}

struct TaskGroupBootcamp: View {
    @StateObject private var viewModel = TaskgroupBootcampViewModel(dataManager: TaskgroupBootcampDataManager())
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Task Group 🤪")
            .task {
                await viewModel.getImages()
            }
        }
    }
}

struct TaskGroupBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskGroupBootcamp()
    }
}
