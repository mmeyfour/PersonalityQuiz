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
