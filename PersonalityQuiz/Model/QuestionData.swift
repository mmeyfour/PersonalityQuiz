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
        text: "Which Activities Do You enjoy ?",
        answers: [
            Answer(text: "Swimming", type: .turtle),
            Answer(text: "sleeping", type: .cat),
            Answer(text: "Cudding", type: .rabbit),
            Answer(text: "Eating", type: .dog)
        ]
    ),
    Question(
        text: "How Much Do You enjoy car rides?",
        answers: [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .rabbit),
            Answer(text: "Ibearly notice them", type: .turtle),
            Answer(text: "I love Them", type: .dog)
        ]
    )
]
