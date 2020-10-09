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
            return "You are incredibly outgoing. You surround yourself with the people you love, and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}

struct State {
    private var currentQuestionIndex = 0
    
    let questions = [
        Question(
            text: "Which activities do you enjoy?",
            answers: [
                Answer(text: "Swimming", type: .turtle),
                Answer(text: "Sleeping", type: .cat),
                Answer(text: "Cuddling", type: .rabbit),
                Answer(text: "Eating", type: .dog)
            ]
        ),
        Question(
            text: "What is your favorite food?",
            answers: [
                Answer(text: "Steak", type: .dog),
                Answer(text: "Fish", type: .cat),
                Answer(text: "Carrots", type: .rabbit),
                Answer(text: "Corn", type: .turtle)
            ]
        ),
        Question(
            text: "How much do you enjoy car rides?",
            answers: [
                Answer(text: "I dislike them", type: .cat),
                Answer(text: "I get a little nervous", type: .rabbit),
                Answer(text: "I barely notice them", type: .turtle),
                Answer(text: "I love them", type: .dog)
            ]
        ),
        Question(
            text: "What do you like to hunt?",
            answers: [
                Answer(text: "Geckos", type: .cat),
                Answer(text: "Butterflies", type: .rabbit),
                Answer(text: "Flies", type: .turtle),
                Answer(text: "Bones", type: .dog)
            ]
        )
    ]
    
    private var chosenAnswers: [Answer] = []
}

extension State {
    var currentQuestion: Question?{
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
        let answer = questions[currentQuestionIndex].answers[index]
        print("User chose answer for \(answer.type.rawValue)")
        chosenAnswers.append(answer)
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
    
    var currentProgress: Float {
        return Float(currentQuestionIndex) / Float(questions.count)
    }
    

}
