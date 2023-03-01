//
//  TaskBootcamp.swift
//  SwiftConcurrency
//
//  Created by Theo Ntogiakos on 21/02/2023.
//

import SwiftUI

class TaskBootcampViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil
    
    let url: URL = URL(string: "https://picsum.photos/1200")!
    
    func fetchImage() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        do {
            let (data, _) = try await URLSession.shared.data(from: self.url, delegate: nil)
            await MainActor.run(body: {
                self.image = UIImage(data: data)
                print("IMAGE 1 fetched")
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage2() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        do {
            let (data, _) = try await URLSession.shared.data(from: self.url, delegate: nil)
            await MainActor.run(body: {
                self.image2 = UIImage(data: data)
                print("IMAGE 2 fetched")
            })
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct TaskBootcampHomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("CLICK!") {
                    TaskBootcamp()
                }
            }
        }
    }
}

struct TaskBootcamp: View {
    @StateObject private var viewModel = TaskBootcampViewModel()
    @State private var fetchImageTask: Task<(), Never>? = nil
    @State private var fetchImageTask2: Task<(), Never>? = nil

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Button("Image 1", action: {
                    self.fetchImageTask = Task {
                        await viewModel.fetchImage()
                    }
                })
                .padding()
                .background(Color.yellow)
                .clipShape(Capsule())
                
                Button("Image 2", action: {
                    self.fetchImageTask2 = Task {
                        await viewModel.fetchImage2()
                    }
                })
                .padding()
                .background(Color.yellow)
                .clipShape(Capsule())
                
                Button("Get Both", action: {
                    self.fetchImageTask = Task {
                        await viewModel.fetchImage()
                    }
                    self.fetchImageTask2 = Task {
                        await viewModel.fetchImage2()
                    }
                })
                .padding()
                .background(Color.yellow)
                .clipShape(Capsule())
            }
            
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            
            if let image2 = viewModel.image2 {
                Image(uiImage: image2)
                    .resizable()
                    .scaledToFit()
            }
        }
        .task {
            await viewModel.fetchImage()
        }
        .task {
            await viewModel.fetchImage2()
        }
        .onDisappear {
            self.fetchImageTask?.cancel()
            self.fetchImageTask2?.cancel()
        }
//        .onAppear {
//            self.fetchImageTask = Task {
//                await viewModel.fetchImage()
//            }
//            self.fetchImageTask2 = Task {
//                await viewModel.fetchImage2()
//            }
//        }
    }
}

struct TaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskBootcamp()
    }
}
