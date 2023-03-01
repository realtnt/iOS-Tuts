//
//  DoCatchTryThrowBootcamp.swift
//  SwiftConcurrency
//
//  Created by Ntogiakos, Theodoros on 20/02/2023.
//

import SwiftUI

class DoCatchTryThrowsBootcampDataManager {
    var isActive: Bool = false

    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("NEW TEXT! ", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }

    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("NEW TEXT - 2! ")
        } else {
            return .failure(URLError(.backgroundSessionRequiresSharedContainer))
        }
    }

    func getTitle3() throws -> String {
        if isActive {
            return "NEW TEXT - 3! "
        } else {
            throw URLError(.badServerResponse)
        }
    }

    func getTitle4() throws -> String {
        if isActive {
            return "FINAL TEXT! "
        } else {
            throw URLError(.badServerResponse)
        }
    }

    func fakeFailed() throws -> String {
        throw URLError(.badURL)
    }
}

class DoCatchTryThrowsBootcampViewModel: ObservableObject {
    @Published var text: String = "Starting text."
    @Published var text2: String = "Starting text."
    @Published var text3: String = "Starting text."
    @Published var text4: String = "Starting text."

    private var counter: Int = 0
    private var counter2: Int = 0
    private var counter3: Int = 0
    private var counter4: Int = 0

    @Published var activeButtonText: String = "Start"

    let manager = DoCatchTryThrowsBootcampDataManager()

    func toggleActive() {
        manager.isActive.toggle()
        activeButtonText = manager.isActive ? "Active" : "Inactive"
    }

    func fetchTitle() {
        let returnedValue = manager.getTitle()
        counter += 1

        if let newTitle = returnedValue.title {
            text = newTitle + String(counter)
        } else if let error = returnedValue.error {
            counter = 0
            text = error.localizedDescription
        }
    }

    func fetchTitle2() {
        let result = manager.getTitle2()
        counter2 += 1

        switch result {
        case .success(let newTitle):
            text2 = newTitle + String(counter2)
        case .failure(let error):
            counter2 = 0
            text2 = error.localizedDescription
        }
    }

    func fetchTitle3() {
        counter3 += 1
        do {
            let result = try manager.getTitle3()
            text3 = result + String(counter3)
        } catch let error {
            counter3 = 0
            text3 = error.localizedDescription
        }
    }

    func fetchTitle4() {
        counter4 += 1

        if let result = try? manager.fakeFailed() {
            text4 = result
        }

        do {
            let result = try manager.fakeFailed()
            text4 = result + String(counter4)

            let result2 = try manager.getTitle4()
            text4 = result2 + String(counter4)
        } catch {
            counter4 = 0
            text4 = error.localizedDescription
        }
    }
}

struct DoCatchTryThrowsBootcamp: View {
    @StateObject private var viewModel = DoCatchTryThrowsBootcampViewModel()

    var body: some View {
        VStack {
            Button(viewModel.activeButtonText, action: viewModel.toggleActive)
                .padding()
                .background(Color.yellow)
                .clipShape(Capsule())
            Text(viewModel.text)
                .frame(width: 300, height: 120)
                .background(.blue)
                .onTapGesture {
                    viewModel.fetchTitle()
                }

            Text(viewModel.text2)
                .frame(width: 300, height: 120)
                .background(.red)
                .onTapGesture {
                    viewModel.fetchTitle2()
                }

            Text(viewModel.text3)
                .frame(width: 300, height: 120)
                .background(.green)
                .onTapGesture {
                    viewModel.fetchTitle3()
                }

            Text(viewModel.text4)
                .frame(width: 300, height: 120)
                .background(.brown)
                .onTapGesture {
                    viewModel.fetchTitle4()
                }
        }
    }
}

struct DoCatchTryThrowBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DoCatchTryThrowsBootcamp()
    }
}
