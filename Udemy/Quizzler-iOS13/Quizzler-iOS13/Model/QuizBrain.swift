//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Ntogiakos, Theodoros on 29/12/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    private let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: 1),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: 2),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: 1),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: 0),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: 2),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: 1),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: 1),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: 0),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: 1),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: 1)
    ]

    private var questionNumber = 0
    private var score = 0

    mutating func check(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        }
        return false
    }

    func getQuestionText() -> String {
        return quiz[questionNumber].questionText
    }

    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }

    func getScore() -> Int {
        return score
    }

    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }

    func getChoiceText(_ choice: Int) -> String {
        return quiz[questionNumber].choices[choice - 1]
    }
}
