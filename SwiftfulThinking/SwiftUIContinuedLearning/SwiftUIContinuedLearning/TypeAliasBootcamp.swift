//
//  TypeAliasBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Theo Ntogiakos on 22/02/2023.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypeAliasBootcamp: View {
    
//    @State var item: MovieModel = MovieModel(title: "Tilte", director: "Joe", count: 5)
    @State var item: TVModel = TVModel(title: "TV Title", director: "Jamie", count: 34)
                                             
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypeAliasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypeAliasBootcamp()
    }
}
