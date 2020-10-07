//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Mersad Meyfour Asadi on 07/10/2020.
//

import Foundation


struct Question {
    let text: String
    let answers: [Answer]
}
struct Answer {
    let text: String
    let type: Animal
}

enum Animal {
    case dog
    case cat
    case rabbit
    case turtle
}

var questions = [
    Question(
        text: "What is your favorite food ?",
        answers: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrots", type: .rabbit),
            Answer(text: "Corn", type: .turtle)
        ]
    ),
    Question(
        text: "Which Activities Do You Prefer ?",
        answers: [
            Answer(text: "Swimming", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrots", type: .rabbit),
            Answer(text: "Corn", type: .turtle)
        ]
    ),
    Question(
        text: "How Much Do You ?",
        answers: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrots", type: .rabbit),
            Answer(text: "Corn", type: .turtle)
        ]
    )
]
