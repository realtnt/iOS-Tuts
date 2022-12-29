//
//  QuizQuestion.swift
//  Quizzler-iOS13
//
//  Created by Ntogiakos, Theodoros on 29/12/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let questionText: String
    let choices: [String]
    let answer: String

    init(q: String, a: [String], correctAnswer: Int) {
        questionText = q
        choices = a
        answer = a[correctAnswer]
    }
}
