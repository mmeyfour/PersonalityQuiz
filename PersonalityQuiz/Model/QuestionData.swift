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

enum Animal: String {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
}
extension Animal {
    var subtitle : String {
        switch self {
            case .dog:
                return "piratilla"
            case .cat:
                return "piratilla"
            case .turtle:
                return "piratilla"
            case .rabbit:
                return "piratilla"
        }
    }
    
}

struct State {
    private var currentQuestionIndex = 0
    let questions = [
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
    private var chosenAnswers: [Answer] = []
}

extension State {
    var nextQuestion: Question?{
        guard currentQuestionIndex < questions.count else {
            return nil
        }
        return questions[currentQuestionIndex]
    }
    mutating func incrementQuestion() {
        currentQuestionIndex += 1
    }
    var hasNextQuestion: Bool {
        return currentQuestionIndex < questions.count
    }
    mutating func chooseAnswer(at index: Int){
        chosenAnswers.append(questions[currentQuestionIndex].answers[index])
    }
    mutating func add(answer: Answer){
        chosenAnswers.append(answer)
    }
    var winningAnimal: Animal? {
        var quizCount: [Animal: Int] = [:]
        
        for answer in chosenAnswers {
            let animal = answer.type
            let currentCount = quizCount[animal]
            if let currentCount = currentCount {
                quizCount[animal] = currentCount + 1
            } else {
                quizCount[animal] = 1
            }
        }
        
        guard var winningAnimal = quizCount.keys.first else {
                return nil
            }
        
        for (newAnimal, newValue) in quizCount {
            guard let referenceValue = quizCount[winningAnimal] else {
                continue
            }
            if newValue > referenceValue {
                winningAnimal = newAnimal
            }
        }
        
        return winningAnimal
    }
    mutating func resetAnswers(){
        chosenAnswers = []
    }
    
    mutating func progress() -> Float {
        return Float(currentQuestionIndex) / Float(questions.count)
    }
    

}
