//
//  Book views.swift
//  ReadMe
//
//  Created by Ntogiakos, Theodoros on 07/11/2022.
//

import SwiftUI

extension Book {
    struct Image: View {
        let title: String
        let author: String

        var body: some View {
            let symbol = SwiftUI.Image(title: title) ??
                .init(systemName: "book")

            symbol
                .resizable()
                .scaledToFit()
//                .frame(width: 80, height: 80)
                .font(Font.title.weight(.light))
                .foregroundColor(.secondary.opacity(0.5))
                .padding()
        }
    }
}

extension Image {
    init?(title: String) {
        guard let character = title.first,
        case let symbolName = "\(character.lowercased()).square",
        UIImage(systemName: symbolName) != nil
        else {
            return nil
        }

        self.init(systemName: symbolName)
    }
}

struct Book_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Book.Image(title: Book().title, author: Book().author)
            Book.Image(title: "", author: "fff")
            Book.Image(title: "😀", author: "eeee")
        }
    }
}
