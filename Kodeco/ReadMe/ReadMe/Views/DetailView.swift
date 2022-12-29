//
//  DetailsView.swift
//  ReadMe
//
//  Created by Ntogiakos, Theodoros on 22/11/2022.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    var body: some View {
        Book.Image(title: book.title, author: "author")
        Spacer()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {

        DetailView(book: .init())
    }
}
